cd %SRC_DIR%

msbuild "visual_studio\matio.sln" /verbosity:normal
if errorlevel 1 exit 1

copy %SRC_DIR%\visual_studio\Release\libmatio.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1

copy %SRC_DIR%\visual_studio\Release\libmatio.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1

