@ECHO OFF
ECHO.
ECHO Enter 1 TOS Image, 192K
ECHO.
ECHO For Atari ST/F/M with 6x ROM Sockets
ECHO.

DEL LO-0.img /Q
DEL LO-1.img /Q
DEL LO-2.img /Q
DEL HI-0.img /Q
DEL HI-1.img /Q
DEL HI-2.img /Q
DEL %1.256K.img
DEL %1.256K.128A.img
DEL %1.256K.128B.img

ECHO Padding file to 256K
romwak.exe /p %1 %1.256K.img 256 0

ECHO ByteSwapping Padded File
romwak.exe /f %1.256K.img %1.byteswapped.img

ECHO Splitting 256K file into 2 parts.
romwak.exe /h %1.byteswapped.img %1.256K.128A.img %1.256K.128B.img

ECHO Splitting both 128K file into 2 parts.
romwak.exe /h %1.256K.128A.img %1.64A.img %1.64B.img
romwak.exe /h %1.256K.128B.img %1.64C.img %1.64D.img

ECHO Splitting 64K files into 2 parts.
romwak.exe /b %1.64A.img LO-0.img LO-1.img
romwak.exe /b %1.64B.img LO-2.img HI-0.img
romwak.exe /b %1.64C.img HI-1.img HI-2.img

DEL %1.byteswapped.img /q
DEL %1.256K.img
DEL %1.256K.128A.img
DEL %1.256K.128B.img
DEL %1.64A.img
DEL %1.64B.img
DEL %1.64C.img 
DEL %1.64D.img

ECHO Done.
ECHO.
ECHO Burn LO-0.img to a 32K (e)eprom, and insert into LO-0
ECHO.
ECHO Burn LO-1.img to a 32K (e)eprom, and insert into LO-1
ECHO.
ECHO Burn LO-2.img to a 32K (e)eprom, and insert into LO-2
ECHO.
ECHO Burn HI-0.img to a 32K (e)eprom, and insert into HI-0
ECHO.
ECHO Burn HI-1.img to a 32K (e)eprom, and insert into HI-1
ECHO.
ECHO Burn HI-2.img to a 32K (e)eprom, and insert into HI-2
ECHO.
pause

