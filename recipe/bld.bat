:: Configure
set CONF=Release
if "%ARCH%" == "64" (
  set SLN_PLAT=x64
) else (
  set SLN_PLAT=Win32
)

if "%VS_YEAR%" == "2008" (
  set TOOLSET=v90
  set SLN_FILE="visual_studio\matio_vs2008.sln"
)
if "%VS_YEAR%" == "2015" (
  set TOOLSET=v140
  set SLN_FILE="visual_studio\matio.sln"
)
if "%VS_YEAR%" == "" (
  echo Unknown VS version
  exit 1
)

call devenv %SLN_FILE% /Upgrade

:: Build
msbuild "%SLN_FILE%" ^
  /p:Configuration=Release ^
  /p:Platform=%SLN_PLAT% ^
  /p:PlatformToolset=%TOOLSET%
if errorlevel 1 exit 1

:: Install
copy %SRC_DIR%\visual_studio\Release\libmatio.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1
copy %SRC_DIR%\visual_studio\Release\libmatio.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1

