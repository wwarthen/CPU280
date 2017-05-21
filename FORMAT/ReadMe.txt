To build the FORMAT tool via a Windows command prompt,
you can invoke Build.cmd.  This will launch the CP/M
version of Turbo Pascal inside an ANSI emulator.

To build the the program:

1. Select O to access the compiler options menu.
2. Select C for Com-file.
3. Select E for End address.
4. Enter C000
5. Confirm that the compiler options look like this:
               Memory
    compile -> Com-file
               cHn-file

    Start address: 20E3 (min 20E3)
    End   address: C000 (max FE06)
6. Select Q to quit the compiler options menu.
7. Select C to Compile.
8. When prompted for "Work file name:", enter "format-e".
9. The compiler should run and produce "format-e.com" and
   your screen should look somewhat like this:
   
    Logged drive: P
    
    Work file:
    Main file:
    
    Edit     Compile  Run   Save
    
    eXecute  Dir      Quit  compiler Options
    
    Text:     0 bytes (8118-8118)
    Free: 30957 bytes (8119-FA06)
    
    >
    
    Work file name: format-e
    
    Loading P:FORMAT-E.PAS
    Compiling  --> P:FORMAT-E.COM
      1255 lines
    
    Code: 19134 bytes (20E3-6BA1)
    Free: 18780 bytes (6BA2-B4FE)
    Data:  2817 bytes (B4FF-C000)
    
    >
10. Select Q to quit.

Note that compiling format-e.pas builds the English version
and format-d builds the German version.  The resulting files
are format-e.com and format-d.com.  Assuming you only want a
single file called format.com, you would just rename the
desired output file.

Wayne Warthen
wwarthen@gmail.com
2017-02-28