(********************************************************************)
(*  FORMAT-E.MSG: Texte und Meldungen in englisch                   *)
(********************************************************************)

(* 060708 Tilmann Reh *)

const

(* fuer FORMAT.PAS (Hauptprogramm) *)

_Menu1        = '(1) List of possible formats     (6) Format disk';
_Menu2        = '(2) Print complete list          (7) Write parameter block';
_Menu3        = '(3) Show format data             (8) Process foreign format';
_Menu4        = '(4) Edit format data';
_Menu5        = '(5) Examine disk                 (0) Exit';
_MenuQ        = 'wanted function ? ';
_WrongBIOS    = 'wrong BIOS version !';
_NewFileQ     = 'No data file found. Generate new';

(* fuer FORMAT.IN1 (Basisroutinen) *)

_WaitTaste    = 'Press any key ';
_Error        = 'Error: ';
_DrvErr       = 'Wrong drive name'^M^J;
_NumErr       = 'Wrong format number'^M^J;
_NotRdy       = 'Drive not ready'^M^J;
_SizErr       = 'Drive has wrong size'^M^J;
_DenErr       = 'Drive cannot process this density'^M^J;
_SidErr       = 'Drive cannot process two sides'^M^J;
_TrkErr       = 'Drive cannot process 80 tracks'^M^J;
_FrmErr       = 'Formatting impossible'^M^J;
_WrErr        = 'Disk not writable'^M^J;
_SecErr       = 'Sector size different'^M^J;
_EmpErr       = 'Disk unformatted'^M^J;
_RdErr        = 'Disk unreadable'^M^J;
_FormNumber   = 'Format number : ';
_FormName     = 'Format name   : ';
_DriveQ       = 'Drive (A..D)  : ';

(* fuer FORMAT.IN2 (Ausgabe) *)

_Continue     = 'RETURN to continue, ESC to exit ';
_SortQ        = 'Sort list alphabetically';
_ListFileQ    = 'Output to file';
_ListHead     = 'Complete format list of ';
_SecOrder     = 'Sector order: ';
_DiskSize     = ^M^J'Disk size: ';
_Inches       = ' Inch, ';
_Tracks       = ' Tracks';
_SecEach      = ' Sectors of ';
_Bytes        = ' Byte each, ';
_SingleDen    = 'Single Density (FM)'^M^J;
_DoubleDen    = 'Double Density (MFM)'^M^J;
_ECMADen      = 'Single/Double Density (ECMA)'^M^J;
_HighDen      = 'High Density (HD)'^M^J;
_OneSide      = '1 Side';
_TwoSide      = '2 Sides';
_TwoSideSec   = ', sector overflow';
_TwoSideTrk   = '2 Sides, track overflow';
_TwoSideHalf  = '2 Sides, half-track overflow';
_HeadNumber   = ', head number';
_HeadMult     = 's ';
_PhysSkew     = ^M^J'physical skew ';
_Invert       = 'Inverted recording'^M^J;
_Multi        = 'Multisector capable'^M^J;
_TrkTrans     = 'Track translation no. ';
_LogSkew      = 'logical skew ';
_BlockSize    = 'Block size ';
_DirEntries   = ' Directory entries'^M^J;
_Reserved     = ' reserved track(s)'^M^J;

(* fuer FORMAT.IN3 (Editieren) *)

_FormatName   = 'Format name: ';
_FormNameQ    = 'Name of format (RETURN=unchanged):';
_DiskSizeQ    = 'Disk size (3/5/8"):';
_TracksQ      = 'Tracks:';
_DenseQ       = 'Density: 1=FM, 2=MFM, 3=FM/MFM, 4=HD:';
_SecSizeQ     = 'Sector size: 0=128, 1=256, 2=512, 3=1024 Byte:';
_SecNumQ      = 'Phys. Sectors per track (per side):';
_OverflowQ    = 'Overflow: 0=None, 1=Sector, 2=Track, 3=Halftrack:';
_Head0Q       = 'Head number side 0:';
_Head1Q       = 'Head number side 1:';
_PhysSkewQ    = 'Physical skew:';
_InvertQ      = 'Recording: 0=Normal, 1=Inverted:';
_MultiQ       = 'Multisector capable: 0=No, 1=Yes:';
_TrkTransQ    = 'Track translation no.: 1..4, 0=None:';
_LogSkewQ     = 'logical skew (0=Table):';
_BlockSizeQ   = 'Block size: 3=1k, 4=2k, 5=4k, 6=8k, 7=16k:';
_DirBlocksQ   = 'Directory Groups (';
_Entries      = ' Entries each):';
_OffsetQ      = 'Offset tracks:';
_NewTable     = 'Enter new table (exit with empty line):';
_EditFormQ    = 'Format number (RETURN=new) ? ';

(* fuer FORMAT.IN4 (Diskette untersuchen) *)

_IntForm      = ^M^J'Internal format. Name: ';
_MoreDataQ    = 'More data wanted';
_InfoByte     = ' Byte each ';
_InfoSS       = 'Single-sided';
_InfoDSSec    = 'Sector overflow';
_InfoDSTrk    = 'track overflow';
_InfoDSHalf   = 'half-track overflow';
_InfoCap      = 'Total capacity ';
_NoTrkDet     = 'Tracks not detectable!';
_SecsSide     = 'Sectors on side ';
_EditQ        = ^M^J^M^J'Edit this format';

(* fuer FORMAT.IN5 (Fremdformate) *)

_DiffSize     = 'Notice: different but compatible disk sizes';
_InDrive      = 'In drive ';
_NowForm      = ': now format ';

(* fuer FORMAT.IN6 (Formatieren) *)

_InitDir      = ^M'Initialising directory';
_SetStamps    = ^M'Activating time stamps';
_WholeDiskQ   = 'Format whole disk?';
_StartTrkQ    = 'Begin with track ';
_EndTrkQ      = 'End with track   ';
_WrParamQ     = 'Write parameter block';
_DirInitQ     = 'Initialise directory';
_StampsQ      = 'Activate time stamps';
_CreateQ      = 'Activate CREATE stamp';
_AccessQ      = 'Activate ACCESS stamp';
_UpdateQ      = 'Activate UPDATE stamp';
_LabelQ       = 'Directory label ? ';
_FormatQ      = 'Formatting: Are you sure';
_FTrack       = ^M'Track ';
_ErrTrks      = ^M'Problems on track(s)';
_MoreDisks    = ^M^J'format another disk';
