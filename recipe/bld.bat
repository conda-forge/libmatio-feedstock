:: Configure
set CONF=Release

echo %LIBRARY_PREFIX%

:: Build
msbuild "visual_studio\matio.sln" ^
  /p:Configuration=Release ^
  /p:Platform=%CMAKE_GENERATOR_PLATFORM% ^
  /p:PlatformToolset=%CMAKE_GENERATOR_TOOLSET% ^
  /property:HDF5_DIR=%LIBRARY_PREFIX%
if errorlevel 1 exit 1

:: Install
copy %SRC_DIR%\visual_studio\%SLN_PLAT%\Release\libmatio.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1
copy %SRC_DIR%\visual_studio\%SLN_PLAT%\Release\libmatio.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
copy %SRC_DIR%\src\matio.h %LIBRARY_INC%\
if errorlevel 1 exit 1
copy %SRC_DIR%\visual_studio\matio_pubconf.h %LIBRARY_INC%\
if errorlevel 1 exit 1
