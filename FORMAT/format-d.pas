program Disketten_Format_Manager;          (* 010707 Tilmann Reh *)

{$I FORMAT.IN0 } (* Datentyp-Deklarationen und Konstanten        *)

(* Globale und Hauptprogramm-Variablen *)

const Sign1             = 'FORMAT-MANAGER V1.05';
      Sign2             = 'Tilmann Reh 30.01.25';
      Ende              : boolean = false;
      ResetVector       : integer = 0;

var   Datei             : file;
      AktForm           : format;
      AktDriveChar      : char;
      AktDrive,
      AktSize,AktType   : byte;
      AktNum,AktSecShift: integer;
      OK                : boolean;
      ch                : char;
      IndexField        : array[1..32] of chrntyp;
      SecBuf            : array[0..1023] of byte;
      Result            : ^chrntyp;
      SearchChain       : ^ByteArray4;

{$I FORMAT-D.MSG } (* Texte und laenderspezifisches                *)
{$I FORMAT.IN1   } (* Hardware-Interface, Allgemeine Routinen      *)
{$I FORMAT.IN2   } (* Liste auf Schirm und Drucker, Daten anzeigen *)
{$I FORMAT.IN3   } (* Editieren von Formaten                       *)
{$I FORMAT.IN4   } (* Disketten untersuchen                        *)
{$I FORMAT.IN5   } (* Parameterblock schreiben und setzen          *)
{$I FORMAT.IN6   } (* Diskette formatieren                         *)

(*-------------- HAUPTMENUE ----------------*)

procedure hauptmenue;
begin
  clrscr;
  gotoxy(29,5); write(Sign1);
  gotoxy(29,6); write('====================');
  gotoxy(29,7); write(Sign2);
  gotoxy(10,9);  write(_Menu1);
  gotoxy(10,10); write(_Menu2);
  gotoxy(10,11); write(_Menu3);
  gotoxy(10,12); write(_Menu4);
  gotoxy(10,13); write(_Menu5);
  gotoxy(28,15); write(_MenuQ);
  repeat read(kbd,ch); until ch in ['0'..'9'];
  write(ch);
  case ch of '1' : List;
             '2' : PrintOut;
             '3' : Show(false);
             '4' : Editieren;
             '5' : GetForm;
             '6' : FormatDisk;
             '7' : WriteParam;
             '8' : SetFormat;
         '9','0' : Ende:=true;
             end;
  RestoreBiosDrive; (* fuer Dateioperationen! *)
  end;

function OpenSuccessful(path:string2):boolean;
begin
  assign(datei,path+'FORMAT.DAT');
  {$I-} reset(datei); {$I+}
  OpenSuccessful:=ioresult=0;
  end;

procedure GetSearchChainPtr;
const SCBPB : array[0..1] of byte = ($3A,0);
begin
  SearchChain:=ptr(BDOSHL(49,addr(SCBPB))+$4C);
  end;

(*----------------- MAIN -------------------*)

begin
  writeln(^M^J,sign1,'  ',sign2);
  if GetBiosVersion<>$0101 then begin
    writeln(_WrongBIOS);
    halt; end;
  if not OpenSuccessful('') then begin
    GetSearchChainPtr;
    xb:=false; xi:=1; AktDrive:=SearchChain^[1];
    while (AktDrive<>$FF) and (xi<=4) and not xb do begin
      if AktDrive<>0 then xb:=OpenSuccessful(char(AktDrive+$40)+':');
      xi:=succ(xi);
      AktDrive:=SearchChain^[xi];
      end;
    if not xb then if InputBoolean(_NewFileQ) then begin
      assign(datei,'FORMAT.DAT');
      rewrite(datei);
      end
    else halt;
    end;
  SaveBiosDrive; (* falls nicht sofort InputDrive aufgerufen wird... *)
  Result:=Ptr(GetResultAddress);
  if paramcount=2 then SetGetFormatCommandLine;
  repeat hauptmenue until Ende;
  BDOS(37,ResetVector);  (* Reset used drives *)
  end.
