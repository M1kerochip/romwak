@ECHO OFF
ECHO.
ECHO Enter 2 TOS byteswapped Binary ROM dumps, HI and LO, 128K each
ECHO.
ECHO From Atari STE with 2x ROM Sockets
ECHO.

ECHO Padding HI file to 128K
romwak.exe /p %1 %1.128K.img 128 0

ECHO Padding LO file to 128K
romwak.exe /p %2 %2.128K.img 128 0

ECHO Joining 128K_HI and 128K_LO into 1 parts.
romwak.exe /m %1.128K.img %2.128K.img NEW_STE_TOS.img

DEL %1.128K.img /Y
DEL %2.128K.img /Y

ECHO Done.
ECHO.
pause
