@ECHO OFF
ECHO.
ECHO Enter 4 TOS BIN images, OO, EO, OE, EE, 128K each
ECHO.
ECHO From Atari TT with 4x ROM Sockets
ECHO.
ECHO Sockets OO, EO, OE, EE in that order.
ECHO.

DEL 256k1.bin /q
DEL 256k2.bin /q

ECHO Padding file to 128K
ECHO.
ECHO Padding OO file to 128K
romwak.exe /p %1 %1.128K.img 128 0
ECHO.
ECHO Padding EO file to 128K
romwak.exe /p %2 %2.128K.img 128 0
ECHO.
ECHO Padding OE file to 128K
romwak.exe /p %3 %3.128K.img 128 0
ECHO.
ECHO Padding EE file to 128K
romwak.exe /p %4 %4.128K.img 128 0

ECHO Joining Padded OO and EO Files to ODD
romwak.exe /m %1.128K.img %2.128K.img 256k1.bin

ECHO Joining Padded OE and EE Files to EVEN
romwak.exe /m %3.128K.img %4.128K.img 256k2.bin

ECHO Joining ODD and EVEN files
romwak.exe /m 256k1.bin 256k2.bin TEST.TOS.IMG

DEL %1.128K.img /Q
DEL %2.128K.img /Q
DEL %3.128K.img /Q
DEL %4.128K.img /Q

ECHO Done.
ECHO.
ECHO TEST.TOS.IMG created.
ECHO.
pause

