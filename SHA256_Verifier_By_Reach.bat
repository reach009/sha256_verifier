@REM This batch file is written by Chea Sovanreach
@REM Version 1.0
@REM Purpose: To verify checksum of the file

@Echo off
set /p file=Please enter file name with full path: 
@REM Echo %file%

set /p ori_sha256=Please enter SHA256 checksum to be compared: 
@REM Echo %ori_sha256%

:: Pass the file to hash as the only arg
Set "SHA256="
For /f "skip=1 Delims=" %%# in (
  'certutil -hashfile "%file%" SHA256'
) Do If not defined SHA256 Set SHA256=%%#
Set SHA256=%SHA256: =%

Echo File SHA256 Checksum is: %SHA256%

@REM Compare with given checksum
if "%SHA256%" equ "%ori_sha256%" (
      echo SHA256 identical!
) else (
      echo SHA256 does not match with given hashsum
)
Echo:
Echo:
Echo # Shoutout to Reach =)	#