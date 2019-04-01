@echo off

rem Use `bash build-ruby-win64.sh` instead to avoid polluting caller's environment

path M:\dev\ruby-build\v1_8_7\bin;%PATH%
path M:\lib64\vs2010;%PATH%
call M:\dev\vs.net-2010\VC\bin\x86_amd64\vcvarsx86_amd64.bat

set LIB=M:\lib64\vs2010;%LIB%
set INCLUDE=M:\include64\vs2010;M:\include;%INCLUDE%

call .\win32\configure.bat --prefix=M:/dev/ruby-build/v2_2-x64 --target=x64-mswin64 --program-suffix=22 --disable-install-doc --with-out-ext=tcl --with-out-ext=tk

rem nmake clean
nmake

find . -type f ( -name "*.exe" -o -name "*.dll" ) -ls

echo Preparing to `nmake install`
pause
nmake install
