Existing users can update immediately by running $ pengwin-setup update
22.1.0:
* Show a better message in WSL2 when the Virtual Machine Platform Windows feature is not enabled
* Keep the previous Debian repo for compatibility with packages expecting buster
* Skip some steps in 00-pengwin.fish for non-interactive sessions
* Add testing repo with a low priority
* Change which by command -v in the scripts, due to which is deprecated and slower
* Change command -v by command -q in fish scripts
* Add an alias to the wsl command so that you can type wsl --version instead of wsl.exe --version inside Pengwin
* Remove the version restriction in iproute, due to the latest kernel support the ss -a command without issues in WSL2
* Improve start menu shortcut generation (short the generated path)
* dotnet package use the new repo for bullseye
* Bump Python to 3.10.1 also updated all installation types
* Fix gopath in go installer
* Fix MariaDB 10.6 install and improve the overall LAMP installer
* Show progress ring in profile tab and taskbar in Windows Terminal when updating pengwin-setup and generating start menu shortcuts
* Install x11-utils as part of VcXsrv installation
* Fix a bug that breaks XRDP upon SDKMan installation
* Upgrade .NET installer to 6.0
* Switch to the newer poetry install script
* Make the SDKMan install the latest Java by default when using the Java installer in pengwin-setup
* Upgrade VcXsrv to 1.20.14.0

21.8.0:
* Improved Start menu icons for Pengwin
* Fixed HiDPI with GTK in WSLg
* Upgraded docker version
* Fixed the cloud cli installer
* Upgraded Terraform to 1.0.5

21.7.1:
* Now Pengwin is compatible with XRDP. Installing xrdp and xorgxrdp should work now.
* Improved high-dpi support in the embedded VcXsrv
* Fixed the NodeJS NVM (no longer installs N instead)
* Fixed the MariaDB installer in LAMP. Also, the support for ARM64 was improved.
* Improved Python PyEnv configs and bump Python version to 3.9.6
* Upgraded helm and fixed Kubernetes installer
* Fixed the docker support uninstaller

21.5.5:
* Enables put notifications so you will receive a message everytime a new Pengwin version is released

21.5.4:
* Automatically creates an entry with logo in Windows Terminal
* Add default background and colors to Windows Terminal (you can change them in Settings)
* In App Settings, it is possible to set Pengwin launch at startup
* If display scale factor is 200% or more now the mouse cursor will be 64px wide

21.4.1:
* Updated CMake to version 3.19.1
* Updated pyenv python to version 3.9.4
* Fixed a hang with fish and dbus
* Improved Poetry installer
* Added Prezto support ZSH installer
* Do not override DISPLAY variable if it is already defined

21.3.1:
* Include the latest packages in the image.
