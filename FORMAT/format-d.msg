(********************************************************************)
(*  FORMAT-D.MSG: Texte und Meldungen in deutsch                    *)
(********************************************************************)

(* 20250125 Tilmann Reh *)

const

(* fuer FORMAT.PAS (Hauptprogramm) *)

_Menu1        = '(1) Liste der m|gl. Formate      (6) Diskette formatieren';
_Menu2        = '(2) Gesamtliste drucken          (7) Parameter schreiben';
_Menu3        = '(3) Formatdaten anzeigen         (8) Fremdformat bearbeiten';
_Menu4        = '(4) Format editieren';
_Menu5        = '(5) Diskette untersuchen         (0) Ende';
_MenuQ        = 'Gew}nschte Funktion ? ';
_WrongBIOS    = 'falsche BIOS-Version !';
_NewFileQ     = 'Kein Datenfile vorhanden. Neu erzeugen';

(* fuer FORMAT.IN1 (Basisroutinen) *)

_WaitTaste    = 'Beliebige Taste dr}cken ';
_Error        = 'Fehler: ';
_DrvErr       = 'Unzul{ssige Laufwerksbezeichnung'^M^J;
_NumErr       = 'Unzul{ssige Format-Nummer'^M^J;
_NotRdy       = 'Laufwerk nicht bereit'^M^J;
_SizErr       = 'Laufwerk hat unpassende Gr|~e'^M^J;
_DenErr       = 'Laufwerk kann Dichte nicht bearbeiten'^M^J;
_SidErr       = 'Laufwerk kann nicht 2 Seiten bearbeiten'^M^J;
_TrkErr       = 'Laufwerk kann nicht 80 Spuren bearbeiten'^M^J;
_FrmErr       = 'Formatieren nicht m|glich'^M^J;
_WrErr        = 'Diskette nicht beschreibbar'^M^J;
_SecErr       = 'Sektorgr|~e nicht }bereinstimmend'^M^J;
_EmpErr       = 'Diskette nicht formatiert'^M^J;
_RdErr        = 'Diskette nicht lesbar'^M^J;
_FormNumber   = 'Format-Nummer   : ';
_FormName     = 'Format-Name     : ';
_DriveQ       = 'Laufwerk (A..D) : ';

(* fuer FORMAT.IN2 (Ausgabe) *)

_Continue     = 'weiter mit RETURN, Abbruch mit ESC ';
_SortQ        = 'Liste alphabetisch sortieren';
_ListFileQ    = 'Ausgabe in Datei';
_ListHead     = 'Gesamtliste Diskettenformate vom ';
_SecOrder     = 'Sektorfolge: ';
_DiskSize     = ^M^J'Diskettengr|~e: ';
_Inches       = ' Zoll, ';
_Tracks       = ' Spuren (Tracks)';
_SecEach      = ' Sektoren je ';
_Bytes        = ' Byte, ';
_SingleDen    = 'Single Density (FM)'^M^J;
_DoubleDen    = 'Double Density (MFM)'^M^J;
_ECMADen      = 'Single/Double Density (ECMA)'^M^J;
_HighDen      = 'High Density (HD)'^M^J;
_OneSide      = '1 Seite';
_TwoSide      = '2 Seiten';
_TwoSideSec   = ', Sektor}berlauf';
_TwoSideTrk   = '2 Seiten, Spur}berlauf';
_TwoSideHalf  = '2 Seiten, Halbspur}berlauf';
_HeadNumber   = ', Kopfnummer';
_HeadMult     = 'n ';
_PhysSkew     = ^M^J'physikalischer Skew ';
_Invert       = 'Invertierte Aufzeichnung'^M^J;
_Multi        = 'Multisector-f{hig'^M^J;
_TrkTrans     = 'Spur}bersetzung Nr. ';
_LogSkew      = 'logischer Skew ';
_BlockSize    = 'Blockgr|~e ';
_DirEntries   = ' Directory-Eintr{ge'^M^J;
_Reserved     = ' reservierte Spur(en)'^M^J;
_PrevNextForm = 'Navigieren mit +/-, sonst Ende ';

(* fuer FORMAT.IN3 (Editieren) *)

_FormatName   = 'Format-Name: ';
_FormNameQ    = 'Name des Formats (RETURN=}bernehmen):';
_DiskSizeQ    = 'Diskettengr|~e (3/5/8"):';
_TracksQ      = 'Spurzahl:';
_DenseQ       = 'Density: 1=FM, 2=MFM, 3=FM/MFM, 4=HD:';
_SecSizeQ     = 'Sektorgr|~e: 0=128, 1=256, 2=512, 3=1024 Byte:';
_SecNumQ      = 'Phys. Sektoren pro Spur (einseitig):';
_OverflowQ    = ']berlauf: 0=None, 1=Sektor, 2=Spur, 3=Halbspur:';
_Head0Q       = 'Kopfnummer Seite 0:';
_Head1Q       = 'Kopfnummer Seite 1:';
_PhysSkewQ    = 'Physikalischer Skew:';
_InvertQ      = 'Aufzeichnung: 0=Normal, 1=Invers:';
_MultiQ       = 'Multisector-f{hig: 0=Nein, 1=Ja:';
_TrkTransQ    = 'Spur}bersetzung Nr.: 1..4, 0=keine:';
_LogSkewQ     = 'logischer Skew (0=Tabelle):';
_BlockSizeQ   = 'Blockgr|~e: 3=1k, 4=2k, 5=4k, 6=8k, 7=16k:';
_DirBlocksQ   = 'Directory-Blocks (je ';
_Entries      = ' Eintr.):';
_OffsetQ      = 'Anzahl Offset-Spuren:';
_NewTable     = 'Neue Tabelle (RETURN=Ende):';
_EditFormQ    = 'Format-Nummer (RETURN=Neu) ? ';

(* fuer FORMAT.IN4 (Diskette untersuchen) *)

_IntForm      = ^M^J'Internes Format. Name: ';
_MoreDataQ    = 'Weitere Daten erw}nscht';
_InfoByte     = ' Byte ';
_InfoSS       = 'Einseitig';
_InfoDSSec    = 'Sektor}berlauf';
_InfoDSTrk    = 'Spur}berlauf';
_InfoDSHalf   = 'Halbspur}berlauf';
_InfoCap      = 'Gesamtkapazit{t ';
_NoTrkDet     = 'Spurlage nicht erkennbar!';
_SecsSide     = 'Sektoren Seite ';
_EditQ        = ^M^J^M^J'Editieren gew}nscht';

(* fuer FORMAT.IN5 (Fremdformate) *)

_DiffSize     = 'Hinweis: Laufwerksgr|~e verschieden, aber kompatibel';
_InDrive      = 'In Laufwerk ';
_NowForm      = ': jetzt Format ';

(* fuer FORMAT.IN6 (Formatieren) *)

_InitDir      = ^M'Initialisieren der Directory';
_SetStamps    = ^M'Aktivieren der Zeiteintr{ge ';
_WholeDiskQ   = 'Ganze Diskette formatieren';
_StartTrkQ    = 'Anfang bei Spur ';
_EndTrkQ      = 'Ende bei Spur   ';
_WrParamQ     = 'Parameterblock schreiben';
_DirInitQ     = 'Directory initialisieren';
_StampsQ      = 'Zeiteintr{ge aktivieren';
_CreateQ      = 'CREATE-Eintrag aktivieren';
_AccessQ      = 'ACCESS-Eintrag aktivieren';
_UpdateQ      = 'UPDATE-Eintrag aktivieren';
_LabelQ       = 'Directory-Label ? ';
_FormatQ      = 'Wirklich formatieren';
_FTrack       = ^M'Spur ';
_ErrTrks      = ^M'Probleme auf Spur(en)';
_MoreDisks    = ^M^J'weitere Diskette formatieren';
