To build the IDETEST tool via a Windows command prompt,
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
8. When prompted for "Work file name:", enter "idetest".
9. The compiler should run and produce "idetest.com" and
   your screen should look somewhat like this:
   
    Logged drive: P
    
    Work file:
    Main file:
    
    Edit     Compile  Run   Save
    
    eXecute  Dir      Quit  compiler Options
    
    Text:     0 bytes (8118-8118)
    Free: 30957 bytes (8119-FA06)
    
    >
    
    Work file name: idetest
    
    Loading P:IDETEST.PAS
    Compiling  --> P:IDETEST.COM
      1255 lines
    
    Code: 19134 bytes (20E3-6BA1)
    Free: 18780 bytes (6BA2-B4FE)
    Data:  2817 bytes (B4FF-C000)
    
    >
10. Select Q to quit.

Wayne Warthen
wwarthen@gmail.com
2017-07-30