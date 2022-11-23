@ECHO OFF
ECHO.
ECHO Enter 1 TOS Image, 512K
ECHO.
ECHO For PAK68/2 with 4x ROM Sockets
ECHO.

DEL 1-U8.img /Q
DEL 3-U9.img /Q
DEL 2-U10.img /Q
DEL 4-U11.img.img /Q
DEL 256K1.img /q 
DEL 256K2.img /q
DEL %1.512K.img /q

ECHO Padding file to 512K
romwak.exe /p %1 %1.512K.img 512 0

ECHO Splitting 512K file into 2 parts.
romwak.exe /b %1.512K.img 256K1.img 256K2.img

ECHO Splitting 256K_ODD into 2 parts.
romwak.exe /b 256K1.img 1-U8.img 3-U9.img

ECHO Splitting 256K_EVEN into 2 parts.
romwak.exe /b 256K2.img 2-U10.img 4-U11.img

DEL 256K1.img /q 
DEL 256K2.img /q
DEL %1.512K.img /q

ECHO Done.
ECHO.
ECHO Burn 1-U8.img to a 128K (e)(e)prom/maskrom, and insert into U8
ECHO.
ECHO Burn 2-U10.img to a 128K (e)(e)prom/maskrom, and insert into U10
ECHO.
ECHO Burn 3-U9.img to a 128K(e)(e)prom/maskrom, and insert into U9
ECHO.
ECHO Burn 4-U11.img to a 128K(e)(e)prom/maskrom, and insert into U11
ECHO.
pause

