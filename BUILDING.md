## Pengwin Components

- Launcher project - Builds the actual executable that is run when a user launches the app. 
- DistroLauncher-Appx project - Builds the distro package with all the assets and other dependencies.

Read more about the components from the upstream template by Microsoft [here](https://github.com/Microsoft/WSL-DistroLauncher). 

## Building Requirements
1. [Visual Studio Community 2022](https://visualstudio.microsoft.com/vs/community/). (Free)
	- The "Universal Windows Platform development" Workload is required, along with the following Individual components:
		- `C++ (v143) Universal Windows Platform tools`
		- Recommended Version - `Windows 10 SDK (10.0.19041.0) or later for UWP: C#, VB, JS`
		- Minimum Version - `Windows 10 SDK (10.0.17763.0) for UWP: C#, VB, JS`		
1. Developer Mode
	- Windows 10 must be in Developer mode, which can be enabled in Start -> Settings -> Update & Security -> For developers.
1. Enable WSL
	- Enable by:
        - Pressing Windows+R, type `C:\Windows\System32\OptionalFeatures.exe`, click OK, find and check Windows Subsystem for Linux, click OK, and restart as required, or
        - Open PowerShell as Administrator, type `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`, and restart as required.

## Build Process
1. Open DistroLauncher.sln in Visual Studio Community 2022.
2. Generate a test certificate:

As of Visual Studio 2019 and later (including 2022), the original feature to create Test Certificates have been removed in order to, "promote better security practices". A [bug report](https://developercommunity.visualstudio.com/content/problem/612872/create-test-certificate-option-missing-from-uwp-sd.html) has been filed, but it does not seem that this feature will be coming back soon. To address that bug report, [Chris Paterson](https://developercommunity.visualstudio.com/users/179609/0a25123f-a73b-680f-8ba0-adf2e9b32c8e.html) created a script which has this same feature.

Open Powershell and copy and paste this script into the prompt, it creates the test certificate for you:
```
$Subject = "CN=Your-appxmanifest-publisher"
$Store = "Cert:\CurrentUser\My"

# Delete old certificate
Get-ChildItem $Store | Where-Object { $_.Subject -match $Subject } | Remove-Item

# Create new certificate
New-SelfSignedCertificate -Type Custom -Subject $Subject -KeyUsage DigitalSignature -FriendlyName "Pengwin Test Certificate" -CertStoreLocation $Store -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")
```
**You will need the thumbprint later so be sure to copy it**
1. Get or build install.tar.gz
    1. Get the most [recent install.tar.gz files](https://github.com/whitewaterfoundry/pengwin-rootfs-builds/releases), and place in x64 or ARM64, or
    1. Build the install.tar.gz on an existing Debian or Pengwin system using the [build scripts](https://github.com/WhitewaterFoundry/pengwin-rootfs-builds).
1. Updating the thumbprint
    1. Open the file `DistroLauncher-Appx\DistroLauncher-Appx.vcxproj`
    1. Search for the line that starts with `<PackageCertificateThumbprint>`
    1. Replace the string in the middle with the thumbprint that you copied earlier and save the file.
1. Build the solution to make sure you have everything you need. Fix any build dependencies you are missing.
1. Build the Windows UWP package:
    The package can be built in Visual Studio or via command line
    - For a UI guided build
        1. Open `DistroLauncher.sln` in Visual Studio Community 2022.
        1. Follow the instructions [here](https://docs.microsoft.com/en-us/windows/uwp/packaging/packaging-uwp-apps#create-an-app-package-upload-file)
    - To build from the command line
        1. Open a `Developer Command Prompt for VS 2022` as an administrator and change directory to your build directory.
        1. Run `build.bat`
            - By default, this generates the debug appxbundle targeting both x64 and ARM64
            - To only target Debug|x64, run `build.bat x64`
            - To only target Debug|ARM64 run `build.bat ARM64`
            - To build Releases instead of Debug appxbundles, include the `rel` option (e.g. `build.bat rel`, `build.bat rel x64`)
            - For a clean build, include the `clean` option (e.g. `build.bat clean`, `build.bat clean rel ARM64`)

1. If everything has gone correctly, you should find your app package in a subfolder under the `AppPackages\DistroLauncher-Appx` folder.
    1. First, install the certificate:
	    1. Double-click on the security certificate file.
		1. Click the "Install Certificate" button.
		1. Select "Local Machine" for the store location.
		1. Select "Automatically select the certificate store based on the type of certificate", then click Next. (If you have any certificate issues, try specifying the Root Certificate Authority Trust here.)
		1. Proceed through the rest of the wizard, clicking Next, Finish, OK, and then OK.
    1. Once that's done, you should be able to double-click on the .appxbundle package file and install it.

## Command Line Usage
The launcher app provides the following functionality:

* `pengwin.exe`
  - Launches the user's default shell in the user's home directory.

* `pengwin.exe install [--root]`
  - Install the distribution and do not launch the shell when complete.
    - `--root`: Do not create a user account and leave the default user set to root.

* `pengwin.exe run <command line>`
  - Run the provided command line in the current working directory. If no command line is provided, the default shell is launched.
  - Everything after `run` is passed to WslLaunchInteractive.

* `pengwin.exe config [setting [value]]`
  - Configure settings for this distribution.
  - Settings:
    - `--default-user <username>`: Sets the default user to <username>. This must be an existing user.

* `pengwin.exe help`
  - Print usage information.
