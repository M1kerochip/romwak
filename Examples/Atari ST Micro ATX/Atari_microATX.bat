@ECHO OFF
ECHO.
ECHO Enter 2 TOS Images, 192K or 256K
ECHO.
ECHO For micro ATX Atari ST with 2x ROM Sockets
ECHO.

DEL LO.img /q
DEL HI.img /q
DEL 1-LO.img /q
DEL 1-HI.img /q
DEL 2-LO.img /q
DEL 2-HI.img /q
DEL %1.256K.img /q
DEL %2.256K.img /q
DEL %1.byteswapped.img /q
DEL %2.byteswapped.img /q

ECHO Padding file to 256K
romwak.exe /p %1 %1.256K.img 256 0
romwak.exe /p %2 %2.256K.img 256 0

ECHO ByteSwapping Padded File
romwak.exe /f %1.256K.img %1.byteswapped.img
romwak.exe /f %2.256K.img %2.byteswapped.img

ECHO Splitting 256K file into 2 parts.
romwak.exe /b %1.byteswapped.img 1-LO.img 1-HI.img
romwak.exe /b %2.byteswapped.img 2-LO.img 2-HI.img

ECHO Joining both LO images
romwak.exe /c 1-LO.img 2-LO.img LO.img

ECHO Joining both HI images
romwak.exe /c 1-HI.img 2-HI.img HI.img

DEL 1-LO.img /q
DEL 1-HI.img /q
DEL 2-LO.img /q
DEL 2-HI.img /q
DEL %1.256K.img /q
DEL %2.256K.img /q
DEL %1.byteswapped.img /q
DEL %2.byteswapped.img /q

ECHO Done.
ECHO.
ECHO Burn LO.img to a 256K (e)eprom/maskrom, and insert into LO
ECHO.
ECHO Burn HI.img to a 256K(e)eprom/maskrom, and insert into HI
ECHO.
ECHO Switch between first and second TOS images by changing both jumpers, JP11 and JP12
ECHO.
pause

