@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\jruby-9.0.0.0.pre2\bin\jruby.exe" "C:/Users/kimberly/etsydemo/vendor/bundle/jruby/2.2.0/bin/sdoc-merge" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\jruby-9.0.0.0.pre2\bin\jruby.exe" "%~dpn0" %*
