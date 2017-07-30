program IDE_Test_Programm;

(* QD 080392 Tilmann Reh *)

const  signon = ^m^j'IDE Festplatten-Utility V0.1  TR 080392'^m^j;

(* Daten der Festplatte *)
(* hier: Modified Native Mode Conner CP-3044 *)

const  cylinders   = 526;
       heads       = 4;
       sectors     = 40;

(* I/O-Adressen und Kommandos des IDE Interface *)

       alt_status  = $86;
       ide_data    = $88;
       ide_error   = $89;
       ide_seccnt  = $8A;
       ide_secnum  = $8B;
       ide_cyllow  = $8C;
       ide_cylhigh = $8D;
       ide_sdh     = $8E;
       ide_cmdstat = $8F;

       cmd_readsector  = $20;
       cmd_writesector = $30;
       cmd_seek        = $70;
       cmd_diagnostics = $90;
       cmd_initialize  = $91;
       cmd_identify    = $EC;

(* Variablen *)

type   workstr         = string[30];
       buftype         = array[0..511] of byte;

var    secbuf,bakbuf   : buftype;
       i,j,k,l,m       : integer;
       func,c          : char;
       err             : boolean;

(* Eigene Consolen-Status-Routine, damit Keypressed funktioniert *)

function ConStat:boolean;
begin
  ConStat:=BIOS(1)>0;
  end;

(* Zahlenwerte in Hex-Strings umsetzen *)

function hexbyte(x:byte):workstr;
const nyb : array[0..15] of char = '0123456789ABCDEF';
begin
  hexbyte:=nyb[x shr 4]+nyb[x and 15];
  end;

function hexword(x:integer):workstr;
begin
  hexword:=hexbyte(hi(x))+hexbyte(lo(x));
  end;

(* Fehlerstatus ausgeben *)

procedure Error(s:workstr; flag:boolean);
begin
  writeln('  ',s,'; Status: ',hexbyte(port[ide_cmdstat]),
          ' ',hexbyte(port[ide_error]));
  if flag then halt;
  end;

(* Warten, bis Platte bereit *)

procedure wait_ready;
const timeout = 10000;
var i : integer;
begin
  i:=0;
  while (port[ide_cmdstat]>128) and (i<timeout) do i:=succ(i);
  if i=timeout then Error('WaitReady TimeOut',true);
  end;

(* Warten auf Data Request (DRQ) *)

procedure wait_drq;
const timeout = 10000;
var i : integer;
begin
  i:=0;
  while (port[ide_cmdstat] and 8=0) and (i<timeout) do i:=succ(i);
  if i=timeout then Error('WaitDRQ TimeOut',true);
  end;

(* Kommando an Platte ausgeben *)

procedure ide_command(cmd:byte);
begin
  wait_ready;
  port[ide_cmdstat]:=cmd;
  wait_ready;
  end;

(* Pufferinhalt anzeigen *)
{
procedure DisplayBuffer(var buf:buftype);
var i : integer;
begin
  i:=0;
  while i<=511 do begin
    if i mod 24=0 then write(^m^j,hexword(i),':');
    write(' ',hexbyte(buf[i]));
    i:=succ(i);
    end;
  writeln;
  end;
}
(* Sektorpuffer aus Platte auslesen oder in Platte schreiben *)

function read_secbuf(var buf:buftype):boolean;
var i : integer;
begin
  wait_drq;
  i:=port[ide_data];  (* LH-Flipflop setzen *)
  for i:=0 to 511 do buf[i]:=port[ide_data];
  read_secbuf:=port[ide_cmdstat] and $89=0;
  end;

function write_secbuf(var buf:buftype):boolean;
var i : integer;
begin
  wait_drq;
  for i:=0 to 511 do port[ide_data]:=buf[i];
  wait_ready;
  write_secbuf:=port[ide_cmdstat] and $89=0;
  end;

(* Laufwerk auf angegebene Spur fahren (Seek) *)

function hd_seek(cyl:integer):boolean;
begin
  wait_ready;
  port[ide_cyllow]:=lo(cyl);
  port[ide_cylhigh]:=hi(cyl);
  port[ide_sdh]:=$A0;
  ide_command(cmd_seek);
  hd_seek:=port[ide_cmdstat] and $89=0;
  end;

(* Einzelnen Sektor von Platte lesen bzw. schreiben *)
(* maximal 5 Versuche bei Fehlerstatus *)
(* bei Fehler oder Mehrfachversuch werden Info's ausgegeben. *)

procedure hd_readsector(cyl,head,sec:integer; var buf:buftype);
var n : byte;
    b : boolean;
begin
  n:=0;
  repeat
    wait_ready;
    port[ide_error]:=$AA;
    port[ide_seccnt]:=1;
    port[ide_secnum]:=sec;
    port[ide_cyllow]:=lo(cyl);
    port[ide_cylhigh]:=hi(cyl);
    port[ide_sdh]:=$A0+head;
    ide_command(cmd_readsector);
    b:=read_secbuf(buf);
    n:=succ(n);
  until b or (n>5);
  if not b then Error('Read Sector',false) else if n>1 then writeln(n:5);
  end;

procedure hd_writesector(cyl,head,sec:integer; var buf:buftype);
(* Mehrfachversuche hier nicht noetig. Warum? Keiner weiss... *)
begin
  wait_ready;
  port[ide_seccnt]:=1;
  port[ide_secnum]:=sec;
  port[ide_cyllow]:=lo(cyl);
  port[ide_cylhigh]:=hi(cyl);
  port[ide_sdh]:=$A0+head;
  ide_command(cmd_writesector);
  if not write_secbuf(buf) then Error('Write Sector',false);
  end;

(* Platte initialisieren, in Translation/Native Mode schalten *)

procedure hd_init(cyls,hds,secs:integer);
begin
  writeln('Initialisieren der Platte...');
  port[alt_status]:=6;
  delay(10);            (* Drive Software Reset *)
  port[alt_status]:=2;  
  wait_ready;
  writeln(port[ide_error]:4,port[ide_seccnt]:4,port[ide_secnum]:4,
          port[ide_cyllow]:4,port[ide_cylhigh]:4,port[ide_sdh]:4);
  port[ide_seccnt]:=secs;
  port[ide_cyllow]:=lo(cyls);
  port[ide_cylhigh]:=hi(cyls);
  port[ide_sdh]:=pred(hds)+$A0;
  ide_command(cmd_initialize);
  writeln('Mode : ',cyls,'x',hds,'x',secs);
  end;

(* Laufwerksinformationen abfragen *)

procedure hd_identify;
var secbuf_int : array[0..255] of integer absolute secbuf;
    i,j        : integer;
begin
  writeln('Abfragen der Laufwerksinformationen...');
  ide_command(cmd_identify);
  if not read_secbuf(secbuf) then Error('Read Identify',false);
  writeln('ID Konstante:  ',secbuf_int[0],
          '  (',hexword(secbuf_int[0]),')');
  writeln('Zylinder:      ',secbuf_int[1]);
  writeln('K|pfe:         ',secbuf_int[3]);
  writeln('Unf. Byte/Trk: ',secbuf_int[4]);
  writeln('Unf. Byte/Sec: ',secbuf_int[5]);
  writeln('Sectors/Track: ',secbuf_int[6]);
  write  ('ID String:     "');
  for i:=14 to 511 do begin
    c:=char(secbuf[i xor 1]);
    if (c>=' ') and (c<='~') then write(c);
    end;
  writeln('"');
  end;

(* Drive Diagnostics (Selbsttest) ausfuehren *)

procedure hd_diagnostics;
begin
  writeln(^m^j'Laufwerks-Selbsttest...');
  ide_command(cmd_diagnostics);
  writeln('Result Code: ',hexbyte(port[ide_error]),^m^j);
  end;

(* Random Seek Test *)

procedure hd_seekrandom;
begin
  writeln('Seek Test. Abbruch mit beliebiger Taste');
  repeat
    i:=random(cylinders);
    write(^m,i:3);
    if not hd_seek(i) then error('Seek',false);
  until keypressed;
  read(kbd,c);
  writeln(' ** Abbruch **');
  end;

(* Ganze Platte linear lesen *)

procedure hd_readlinear;
begin
  writeln('Platte wird gelesen. Abbruch mit beliebiger Taste');
  for i:=0 to pred(cylinders) do
  for j:=0 to pred(heads) do
  for k:=1 to sectors do begin
    write(^m,i:3,j:2,k:3);
    hd_readsector(i,j,k,secbuf);
    if keypressed then begin
      read(kbd,c);
      writeln(' ** Abbruch **');
      exit; end;
    end;
  end;

(* Platte zufaellig (kreuz und quer) lesen *)

procedure hd_readrandom;
begin
  writeln('Platte wird gelesen. Abbruch mit beliebiger Taste');
  repeat
    i:=random(cylinders); j:=random(heads); k:=succ(random(sectors));
    write(^m,i:3,j:2,k:3);
    hd_readsector(i,j,k,secbuf);
  until keypressed;
  read(kbd,c);
  writeln(' ** Abbruch **');
  end;

(* Ganze Platte linear lesen und zurueckschreiben *)

procedure hd_rw_linear;
begin
  writeln('Test l{uft. Abbruch mit beliebiger Taste');
  for i:=0 to pred(cylinders) do
  for j:=0 to pred(heads) do
  for k:=1 to sectors do begin
    write(^m,i:3,j:2,k:3);
    hd_readsector(i,j,k,secbuf);
    hd_writesector(i,j,k,secbuf);
    if keypressed then begin
      read(kbd,c);
      writeln(' ** Abbruch **');
      exit; end;
    end;
  end;

(* Platte zufaellig (kreuz und quer) lesen und zurueckschreiben *)

procedure hd_rw_random;
begin
  writeln('Test l{uft. Abbruch mit beliebiger Taste');
  repeat
    i:=random(cylinders); j:=random(heads); k:=succ(random(sectors));
    write(^m,i:3,j:2,k:3);
    hd_readsector(i,j,k,secbuf);
    hd_writesector(i,j,k,secbuf);
  until keypressed;
  read(kbd,c);
  writeln(' ** Abbruch **');
  end;

(* Ganze Platte linear mit Zufallsdaten beschreiben, dann *)
(* zuruecklesen und vergleichen. Zerstoert alle Daten!    *)

procedure hd_test_linear;
begin
  write('Alle Daten gehen dabei drauf! Ganz sicher? (J/N) ');
  repeat read(kbd,c); c:=upcase(c) until (c='J') or (c='N');
  writeln(c); if c='N' then exit;
  writeln('Test l{uft. Abbruch mit beliebiger Taste');
  for i:=0 to pred(cylinders) do
  for j:=0 to pred(heads) do
  for k:=1 to sectors do begin
    write(^m,i:3,j:2,k:3);
    for l:=0 to 511 do bakbuf[l]:=229;
    hd_writesector(i,j,k,bakbuf);
    hd_readsector(i,j,k,secbuf);
    err:=false;
    for l:=0 to 511 do if secbuf[l]<>bakbuf[l] then err:=true;
    if err then Error('Sector R/W Verify',false);
    if keypressed then begin
      read(kbd,c);
      writeln(' ** Abbruch **');
      exit; end;
    end;
  end;

(* Platte kreuz und quer mit Zufallsdaten beschreiben, dann *)
(* zuruecklesen und vergleichen. Zerstoert alle Daten!      *)

procedure hd_test_random;
begin
  write('Alle Daten gehen dabei drauf! Ganz sicher? (J/N) ');
  repeat read(kbd,c); c:=upcase(c) until (c='J') or (c='N');
  writeln(c); if c='N' then exit;
  writeln('Test l{uft. Abbruch mit beliebiger Taste');
  repeat
    i:=random(cylinders); j:=random(heads); k:=succ(random(sectors));
    write(^m,i:3,j:2,k:3);
    for l:=0 to 511 do bakbuf[l]:=random(256);
    hd_writesector(i,j,k,bakbuf);
    hd_readsector(i,j,k,secbuf);
    err:=false;
    for l:=0 to 511 do if secbuf[l]<>bakbuf[l] then err:=true;
    if err then Error('Sector R/W Verify',false);
  until keypressed;
  read(kbd,c);
  writeln(' ** Abbruch **');
  end;

(* MAIN *)

begin
  constptr:=addr(constat);
  writeln(signon);
  hd_init(cylinders,heads,sectors);
  repeat
    write(^m^j'Funktionen:'^m^j,
    '(0) Festplatte initialisieren    (5) Platte zuf{llig lesen'^m^j,
    '(1) Identifikation lesen         (6) Linear lesen/schreiben'^m^j,
    '(2) Laufwerks-Selbsttest         (7) Zuf{llig lesen/schreiben'^m^j,
    '(3) Random Seek Test             (8) Linear schreiben/lesen (destruktiv)'^m^j,
    '(4) Platte linear lesen          (9) Zuf{llig schreiben/lesen (destruktiv)'^m^j,
    '(x) Programm beenden             Eingabe: ');
    repeat read(kbd,func); func:=upcase(func)
    until func in ['0'..'9','X'];
    write(func,^m^j^m^j);
    case func of
      '0' : hd_init(cylinders,heads,sectors);
      '1' : hd_identify;
      '2' : hd_diagnostics;
      '3' : hd_seekrandom;
      '4' : hd_readlinear;
      '5' : hd_readrandom;
      '6' : hd_rw_linear;
      '7' : hd_rw_random;
      '8' : hd_test_linear;
      '9' : hd_test_random;
      end;
  until func='X';
  end.
