cd %SRC_DIR%

if "%VS_YEAR%" == "2008" (
    set SLN_FILE="visual_studio\matio_vs2008.sln"
) else (
    set SLN_FILE="visual_studio\matio.sln"
)

msbuild %SLN_FILE% /verbosity:normal
if errorlevel 1 exit 1

copy %SRC_DIR%\visual_studio\Release\libmatio.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1

copy %SRC_DIR%\visual_studio\Release\libmatio.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1

