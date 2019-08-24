@echo off

rem Add path to MSBuild Binaries
set MSBUILD=()
if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles(x86)%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe"
    goto :FOUND_MSBUILD
)
if exist "%ProgramFiles%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe" (
    set MSBUILD="%ProgramFiles%\Microsoft Visual Studio\Preview\Community\MSBuild\15.0\Bin\msbuild.exe"
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

if %MSBUILD%==() (
    echo "I couldn't find MSBuild on your PC. Make sure it's installed somewhere, and if it's not in the above if statements (in build.bat), add it."
    goto :EXIT
) 
:FOUND_MSBUILD

%MSBUILD% %~dp0\DistroLauncher.sln /t:%_MSBUILD_TARGET% /m /nr:true ^
    /p:Configuration=Release ^
    /p:Platform="x64" ^
    /p:UseSubFolderForOutputDirDuringMultiPlatformBuild=false

if (%ERRORLEVEL%) == (0) (
    echo.
    echo Created appx in %~dp0AppPackages\DistroLauncher-Appx\
    echo.
)

:EXIT
