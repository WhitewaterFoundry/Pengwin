@echo off

rem Add path to MSBuild Binaries
set MSBUILD=()
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe" (
	set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe" (
	set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Preview\MSBuild\Current\Bin\MSBuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Preview\MSBuild\Current\Bin\MSBuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\2019\Community\MSBuild\15.0\Bin\msbuild.exe" (
	set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\2019\Community\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\2019\Professional\MSBuild\15.0\Bin\msbuild.exe" (
	set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\2019\Professional\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\2019\Enterprise\MSBuild\15.0\Bin\msbuild.exe" (
	set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\2019\Enterprise\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles(x86)%\MSBuild\14.0\bin" (
    set MSBUILD="%ProgramFiles(x86)%\MSBuild\14.0\bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\MSBuild\14.0\bin" (
    set MSBUILD="%ProgramFiles%\MSBuild\14.0\bin\msbuild.exe"
    goto :FOUND_MSBUILD
)

if %MSBUILD%==() (
    echo "I couldn't find MSBuild on your PC. Make sure it's installed somewhere, and if it's not in the above if statements (in build.bat), add it."
    goto :EXIT
) 
:FOUND_MSBUILD
set _MSBUILD_TARGET=Build
set _MSBUILD_CONFIG=Debug
set _MSBUILD_PLATFORM=x64
set _MSBUILD_APPX_BUNDLE_PLATFORMS="x64|ARM64"

:ARGS_LOOP
if (%1) == () goto :POST_ARGS_LOOP
if (%1) == (clean) (
    set _MSBUILD_TARGET=Clean,Build
)
if (%1) == (rel) (
    set _MSBUILD_CONFIG=Release
)
if (%1) == (x64) (
    set _MSBUILD_PLATFORM=x64
    set _MSBUILD_APPX_BUNDLE_PLATFORMS=x64
)
if (%1) == (ARM64) (
    set _MSBUILD_PLATFORM=ARM64
    set _MSBUILD_APPX_BUNDLE_PLATFORMS=ARM64
)
shift
goto :ARGS_LOOP

:POST_ARGS_LOOP
%MSBUILD% %~dp0\DistroLauncher.sln /t:%_MSBUILD_TARGET% /m /nr:true ^
	/restore ^
    /p:Configuration=%_MSBUILD_CONFIG% ^
    /p:Platform=%_MSBUILD_PLATFORM% ^
    /p:AppxBundlePlatforms=%_MSBUILD_APPX_BUNDLE_PLATFORMS% ^
    /p:UseSubFolderForOutputDirDuringMultiPlatformBuild=false

if (%ERRORLEVEL%) == (0) (
    echo.
    echo Created MSIXBUNDLE in ./Pengwin/AppPackages/Pengwin_<version>_<arch>
    echo.
)

:EXIT
