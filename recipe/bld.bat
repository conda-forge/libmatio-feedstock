cd %SRC_DIR%

rem set HDF5V=1.10.0
rem appveyor DownloadFile https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-%HDF5V%/bin/windows/extra/hdf5-%HDF5V%-win%ARCH%-VS2015-shared.zip
rem 7z x -y hdf5-%HDF5V%-win%ARCH%-VS2015-shared.zip
rem msiexec /a %SRC_DIR%\hdf5\hdf5-%HDF5V%-win%ARCH%.msi /qb TARGETDIR=%SRC_DIR%\hdf5\msi

rem set HDF5_DIR=%SRC_DIR%\hdf5\msi\HDF_Group\HDF5\%HDF5V%

set SLN_FILE=%SRC_DIR%\visual_studio\matio.sln
set SLN_CFG=Release
if "%ARCH%"=="32" (set SLN_PLAT=Win32) else (set SLN_PLAT=x64)

REM Build step
msbuild "%SLN_FILE%" /p:Configuration=%SLN_CFG%,Platform=%SLN_PLAT%,PlatformToolset=v140
if errorlevel 1 exit 1

copy %SRC_DIR%\visual_studio\Release\libmatio.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1

copy %SRC_DIR%\visual_studio\Release\libmatio.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
