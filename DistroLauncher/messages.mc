LanguageNames = (English=0x409:MSG00409)

MessageId=1001 SymbolicName=MSG_WSL_REGISTER_DISTRIBUTION_FAILED
Language=English
WslRegisterDistribution failed with error: 0x%1!x!
.

MessageId=1002 SymbolicName=MSG_WSL_CONFIGURE_DISTRIBUTION_FAILED
Language=English
WslGetDistributionConfiguration failed with error: 0x%1!x!
.

MessageId=1003 SymbolicName=MSG_WSL_LAUNCH_INTERACTIVE_FAILED
Language=English
WslLaunchInteractive %1 failed with error: 0x%2!x!
.

MessageId=1004 SymbolicName=MSG_WSL_LAUNCH_FAILED
Language=English
WslLaunch %1 failed with error: 0x%2!x!
.

MessageId=1005 SymbolicName=MSG_USAGE
Language=English
Launches or configures Pengwin Linux distribution.

Usage:
    <no args>
        Launches the user's default shell in the user's home directory.

    --distribution, -d <Distro>
        Launches the user's default shell in the user's home directory in the specified distribution. Suitable when you have more than one %1 installation.

    install [--root]
        Install the distribution and do not launch the shell when complete.
          --root
              Do not create a user account and leave the default user set to root.

    run, -c <command line>
        Run the provided command line in the current working directory. If no
        command line is provided, the default shell is launched.

    config [setting [value]]
        Configure settings for this distribution.
        Settings:
          --default-user <username>
              Sets the default user to <username>. This must be an existing user.
    unregister
        Unregisters the distribution and deletes the root filesystem.

    help
        Print usage information.
.

MessageId=1006 SymbolicName=MSG_STATUS_INSTALLING
Language=English
Unpacking Pengwin, this may take a few minutes...
.

MessageId=1007 SymbolicName=MSG_INSTALL_SUCCESS
Language=English
Installation successful!
.

MessageId=1008 SymbolicName=MSG_ERROR_CODE
Language=English
Error: 0x%1!x! %2
.

MessageId=1009 SymbolicName=MSG_ENTER_USERNAME
Language=English
Enter new UNIX username: %0
.

MessageId=1010 SymbolicName=MSG_CREATE_USER_PROMPT
Language=English
Please create a default Linux user account. The username does not need to match your Windows username.
For more information, visit https://aka.ms/wslusers.
.

MessageId=1011 SymbolicName=MSG_PRESS_A_KEY
Language=English
Press any key to continue...
.

MessageId=1012 SymbolicName=MSG_MISSING_OPTIONAL_COMPONENT
Language=English
The Windows Subsystem for Linux optional component is not enabled. Please enable it and try again.
See https://aka.ms/wslinstall for details.
.

MessageId=1013 SymbolicName=MSG_INSTALL_ALREADY_EXISTS
Language=English
The distribution installation has become corrupted.
Please select Reset from App Settings or uninstall and reinstall the app.
.

MessageId=1014 SymbolicName=MSG_ENABLE_VIRTUALIZATION
Language=English
Please enable the Virtual Machine Platform Windows feature and ensure virtualization is enabled in the BIOS.
For information, please visit https://aka.ms/enablevirtualization.
.

MessageId=1015 SymbolicName=MSG_WSL_UN_REGISTER_DISTRIBUTION_FAILED
Language=English
WslUnRegisterDistribution failed with error: 0x%1!x!
.

