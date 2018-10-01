## WLinux Components

- build-tar.bat - Builds the WLinux custom Linux distro in a WLinux or Debian environment.
- Launcher project - Builds the actual executable that is run when a user launches the app. 
- DistroLauncher-Appx project - Builds the distro package with all the assets and other dependencies. 

## Building Requirements
1. [Visual Studio Community 2017](https://visualstudio.microsoft.com/vs/community/). (Free)
	- The "Universal Windows Platform development" Workload is required, along with the following Individual components:
		- `C++ Universal Windows Platform tools`
		- `Windows 10 SDK (10.0.15063.0) for UWP: C#, VB, JS`
1. Developer Mode
	- Windows 10 must be in Developer mode, which can be enabled in Start -> Settings -> Update & Security -> For developers.
1. Enable WSL
	- The Windows Subsystem for Linux is not enabled by default, and is required to run the app. You can add the feature to your Windows installation by running `C:\Windows\System32\OptionalFeatures.exe` and selecting it from the list.

## Build Process
1. Open DistroLauncher.sln in Visual Studio Community 2017.
2. Generate a test certificate:
    1. In the Solution Explorer, open `DistroLauncher-Appx\DistroLauncher.appxmanifest`
    1. Select the Packaging tab
    1. Select "Choose Certificate"
    1. Click the Configure Certificate drop down and select Create test certificate.
1. Build install.tar.gz
    1. Use [create-targz.x64.sh] and copy to x64 in your build folder.
1. Build the solution to make sure you have everything you need. Fix any build dependencies you are missing.
1. Build the Windows UWP package:
    1. Open a `Developer Command Prompt for VS 2017` and change directory to your build directory.
    1. Run `build-app.bat`

1. If everything has gone correctly, you should find your app package in a subfolder under the `AppPackages\DistroLauncher-Appx` folder.
    1. First, install the certificate:
	    1. Double-click on the security certificate file.
		1. Click the "Install Certificate" button.
		1. Select "Local Machine" for the store location.
		1. Select "Automatically select the certificate store based on the type of certificate", then click Next. (If you have any certificate issues, try specifying the Root Certificate Authority Trust here.)
		1. Proceed through the rest of the wizard, clicking Next, Finish, OK, and then OK.
    1. Once that's done, you should be able to double-click on the .appx package file and install it.

## Command Line Usage
The launcher app provides the following functionality:

* `wlinux.exe`
  - Launches the user's default shell in the user's home directory.

* `wlinux.exe install [--root]`
  - Install the distribution and do not launch the shell when complete.
    - `--root`: Do not create a user account and leave the default user set to root.

* `wlinux.exe run <command line>`
  - Run the provided command line in the current working directory. If no command line is provided, the default shell is launched.
  - Everything after `run` is passed to WslLaunchInteractive.

* `wlinux.exe config [setting [value]]`
  - Configure settings for this distribution.
  - Settings:
    - `--default-user <username>`: Sets the default user to <username>. This must be an existing user.

* `wlinux.exe help`
  - Print usage information.
