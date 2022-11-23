@ECHO OFF
ECHO.
ECHO Enter 1 TOS Image, 192K
ECHO.
ECHO For Atari ST/F/M/Mega with 2x ROM Sockets
ECHO.

DEL LO.img /q
DEL HI.img /q

REM ECHO Padding file to 256K
romwak.exe /p %1 %1.256K.img 256 0

ECHO ByteSwapping Padded File
romwak.exe /f %1.256K.img %1.byteswapped.img

ECHO Splitting 192K file into 2 parts.
romwak.exe /b %1.byteswapped.img LO.img HI.img

DEL %1.256K.img /q
DEL %1.byteswapped.img /q

ECHO Done.
ECHO.
ECHO Burn LO.img to a 128K (e)eprom/maskrom, and insert into LO-0 / LO
ECHO.
ECHO Burn HI.img to a 128K(e)eprom/maskrom, and insert into HI-0 / HI
ECHO.
pause

