Existing users can update immediately by running $ pengwin-setup update

25.06.0:
* Upgraded Terraform to 1.12.1
* Upgraded Node.js versions to 24 and 22 lts
* Upgraded to Debian 12.11
* Upgraded to Mesa 25.0.4 and the D3D12 driver includes:
    * OpenGL 4.6 support completed
    * Expanded video encode/decode support (HEVC 4:2:2/4:4:4, H.264 Baseline)
    * Added VP9 and AV1 codecs in GPU Video Acceleration
* Changed the TUI engine of pengwin-setup from newt to ncurses, with the following improvements:
    * Mouse support, you can now click options and buttons
    * Accelerator keys are shown in the options for rapid selection
    * The big dialogs like the uninstaller are now resizable
* Updated the version of VCXsrv to 21.1.13
* Updated python to 3.13
* Fixed a regression in pengwin-setup that prevented returning to the previous menu
* Fix GPU Video Acceleration access in WSL 2.5.x
* Fixed an error in the icon generation in the desktop environment installer
* Added udev package due to it is necessary for the video acceleration

24.08.2:
* Added a --help option to pengwin-setup and will show you some usability and automation options
* Upgraded Terraform to 1.9.5
* Fixed a regression that caused that the GUI menu didn't load

24.08.1:
* Improved the navigation in the pengwin-setup menus allowing selecting the options with fewer keystrokes.
* The backports are active and working, so you'll receive the latest version of many packages like curl, cmake, golang, systemd, emacs, meson, xrdp among others.
* Upgraded Terraform to 1.9.4
* Included by default the command-not-found package to help users to find the correct package to install when a command is not found.
* Fixed and improved the Kubernetes installer.
* Fixed an error when spt is trying to upgrade systemd package on WSL1.
* Fix XFCE installation with newer versions of WSL, if you are facing the issue run the installer again, from pengwin-setup.
* Be sure that dbus is only started once, regardless how many times you start Pengwin.
* Added a Message Of The Day Setting, to pengwin-setup to configure it.

24.02.3:
* Upgraded to Debian 12.4
* Improved N (Node.js) version manager installer
* Improved the Node.js installer
* Updated Node.js LTS that pengwin-setup installs to 20
* Improved ibus and fcitx installation
* apt-utils now is installed by default
* Improved the navigation of the Programming menu in pengwin-setup
* Removed the testing repo to avoid accidental installations of testing packages
* Avoid closing Windows Terminal after pegwin-setup finishes

23.07.1:
* Updated the NodeJS installer with new versions and the latest version of yarn.

23.07.0:
* Upgraded the baseline to Debian 12 bookworm with every new version that comes with it.
* To correctly upgrade to this version you'll need to execute 'pengwin-setup update' twice and then 'sudo apt dist-upgrade -y' to complete the upgrade process
* Upgraded to Mesa 22.3.6, bringing OpenGL 4 and GPU Video Acceleration via VAAPI. It works out of the box, you only need to enable SystemD via pengwin-setup.
* Improve Windows interop when SystemD is active.

23.03.0:
* Prepare everything for a smooth transition to bookworm
* Upgrade Go to 1.19.4
* Improve docker compatibility with WSL1
* Added new MariaDB versions to installer
* Added nano to the default installation

22.11.3:
* Support for SystemD Windows 10 / 11
* Added an option in pengwin-setup to enable / disable SystemD
* Now you can install the Xfce desktop environment from pengwin-setup
* Enabled the backports so, you'll have a more recent version of 7zip, cmake, git, golang, npm among others
* Improved the DISPLAY variable management for non WSLg users or who still want to use Xservers
* Now Pengwin can start with Windows logon without showing a terminal window
* Customized the XRDP login screen with a Pengwin theme
* Customized the default wallpaper for Xfce with a Pengwin theme
* Updated .NET version to 7.0
* Include by default the software-properties-common to ease the installation of packages from PPAs
* Allow to disable WSLg from pengwin-setup only for Pengwin
* Fixed autocompletion for helm and kubectl
* Bump pyenv python to 3.10.4
* Upgraded MariaDB installer
* Upgraded terraform to 1.2.8
* Improved the integration with Rancher Desktop and Docker Desktop
* Improved the IBus installer in pengwin-setup
* Added support for installing JetBrains Toolbox inside Pengwin
* Added wslsystemctl command for starting services in WSL1

22.2.1:
* Fix name for Windows Terminal menu

22.2.0:
* Fix a launch error with Windows Terminal 1.12

22.1.6:
* Use cmd-exe instead of cmd.exe to avoid executing cmd.exe in the Linux home path.

22.1.5:
* Fix an error message shown at launch in WSL 1 about xdpyinfo when vcxsrv is installed.
* Switch Azure CLI installer to bullseye repos.
* Switch Powershell installer to bullseye repos.
* Improve the performance in the pengwin.exe config --default-user <username>.
* Finally fixed the problem that Pengwin didn't launch in Windows Terminal on specific configurations.
* If you have Windows 11, Windows Terminal 1.12, and have Windows Terminal as your default console, now when you open Pengwin from the Start Menu, it will show the correct profile on Windows Terminal.

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
