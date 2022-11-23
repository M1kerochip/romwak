@ECHO OFF
ECHO.
ECHO Enter 1 TOS Image, 512K
ECHO.
ECHO For Atari TT with 4x ROM Sockets
ECHO.

DEL 1-OO.img /Q
DEL 3-EO.img /Q
DEL 2-OE.img /Q
DEL 4-EE.img.img /Q
DEL 256K1.img /q 
DEL 256K2.img /q
DEL %1.512K.img /q

ECHO Padding file to 512K
romwak.exe /p %1 %1.512K.img 512 0

ECHO Splitting 512K file into 2 parts.
romwak.exe /b %1.512K.img 256K1.img 256K2.img

ECHO Splitting 256K_ODD into 2 parts.
romwak.exe /b 256K1.img 1-OO.img 3-EO.img

ECHO Splitting 256K_EVEN into 2 parts.
romwak.exe /b 256K2.img 2-OE.img 4-EE.img

DEL 256K1.img /q 
DEL 256K2.img /q
DEL %1.512K.img /q

ECHO Done.
ECHO.
ECHO Burn 1-OO.img to a 128K (e)eprom/maskrom, and insert into OO
ECHO.
ECHO Burn 2-OE.img to a 128K (e)eprom/maskrom, and insert into OE
ECHO.
ECHO Burn 3-EO.img to a 128K(e)eprom/maskrom, and insert into EO
ECHO.
ECHO Burn 4-EE.img to a 128K(e)eprom/maskrom, and insert into EE
ECHO.
pause

