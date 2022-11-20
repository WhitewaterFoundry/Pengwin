# Pengwin

The first Linux® distribution optimized for [WSL](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux). Based on Debian®. From open-source software startup [Whitewater Foundry](https://whitewaterfoundry.com). Formerly WLinux.

<img src='https://github.com/WhitewaterFoundry/Screenshots/raw/master/ezgif.com-gif-maker.gif'>

<a href='//www.microsoft.com/store/apps/9NV1GV1PXZ6P?ocid=badge'><img src='https://get.microsoft.com/images/en-us%20dark.svg' alt='Store badge' height=50/></a>

- [日本語](README.ja.md)
- [简体中文](README.zh-hans.md)
- [繁體中文](README.zh-hant.md)

See the [Pengwin blog](https://www.pengwin.dev/blog) and [@PengwinLinux](https://twitter.com/PengwinLinux) for up-to-date news about Pengwin. 

[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?label=Follow&style=social)](https://twitter.com/PengwinLinux)

If you are a commercial, government, or educational institution, you may like to check out our enterprise-focused distribution, [Pengwin Enterprise](https://github.com/WhitewaterFoundry/Pengwin-Enterprise).

## Features

- Pengwin is a Linux environment for Windows 10 built on open-source technology conceived by Microsoft Research and the Linux ecosystem curated by the Debian project.
- Pengwin is also the first Linux distribution pre-configured and optimized to run specifically on [Windows® Subsystem for Linux](https://github.com/sirredbeard/Awesome-WSL), a Microsoft-supported feature of Windows 10 and Windows Server 2019.
- Pengwin includes [wslu](https://github.com/wslutilities/wslu), a set of useful open-source utilities for interacting between WSL and Windows 10.
- A custom Pengwin-setup tool, accessible via `$ pengwin-setup` allows new Pengwin users to get started on Linux immediately:
    - Change language and keyboard settings.
    - Select optional shells: csh, zsh (with [oh-my-zsh](https://ohmyz.sh/)), and [fish](https://fishshell.com/) (with [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)).
    - Choose text editors: [emacs](https://www.gnu.org/software/emacs/), [neovim](https://neovim.io/), and [Visual Studio Code](https://code.visualstudio.com/).
    - Unpack your favorite development environment [NodeJS](https://nodejs.org/) (with n, npm, and/or yarn), Python 3.7 (with pip), [Ruby](http://www.ruby-lang.org/) (via rbenv), [Rust](https://www.rust-lang.org/) (via rustup installer) and [Go](https://golang.org/).
    - Manage your Microsoft Windows and Azure deployments with [PowerShell](https://github.com/PowerShell/PowerShell) and [azure-cli](https://github.com/Azure/azure-cli), command line tools for Azure.
    - Enable/disable Windows Explorer shell integration.
    - Configure experimental GUI settings, including a [Windows 10 theme](https://github.com/B00merang-Project/Windows-10) for your Linux applications, HiDPI support and international input methods.
    - Create a secure bridge to Docker running on Windows.
- Support for [many Linux graphical applications](https://github.com/ethanhs/WSL-Programs) with no need to configure display or libGL in Pengwin. (Requires a Windows-based X server, such as [X410](http://afflnk.microsoft.com/c/1291904/459838/7593?prodsku=9NLP712ZMN9Q&u=https%3A%2F%2Fwww.microsoft.com%2Fen-us%2Fstore%2Fp%2Fx410%2F9NLP712ZMN9Q).)
- Install over 27,790 open source packages via the apt package management system from the [expansive Debian repositories](https://packages.debian.org/testing/) and any third-party Debian-compatible repositories from outside projects.
- Pengwin provides faster patching for WSL-specific bugs than any upstream Linux distro available on WSL.
- New features are [actively developed](https://github.com/WhitewaterFoundry/Pengwin/pulls) based on [community input](https://github.com/WhitewaterFoundry/Pengwin/issues). Learn how you can [earn paid grants](CONTRIBUTING.md) improving Pengwin. 

## Requirements

- Windows 10
    - Minimum 1709/16299
    - Recommended 1809/17763
- Windows Subsystem for Linux Enabled
    - To enable Windows Subsystem for Linux open PowerShell as Administrator and run:
        ```
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
        ```
        
## Updates

To check for updates, use the apt package management system.

1. Check for the latest updates: `$ sudo apt-get update`
2. Apply the latest updates: `$ sudo apt-get upgrade`

## Versioning

Pengwin is rolling release. Debian packages, pengwin-base, and pengwin-setup receive ongoing updates. Version numbers are used to track long-term progress on bugs and features, e.g. 1.2, and new versions are released every 2-3 months. New builds are regularly built and uploaded to the Store. The third build uploaded during 1.2.x window will be marked 1.2.3.

To check your version of pengwin-setup: `$ apt-cache policy pengwin-setup`

To check your verison of pengwin-base: `$ apt-cache policy pengwin-base`

## Obtaining Support

Purchases of Pengwin in the Microsoft Store pay for a team of open source indie developers to add new features, test and release builds, evaluate WSL-related CVEs, and provide user support. User support is provided on a best effort basis. Most issues can be resolved by following the steps below. 

- First, search for your issue on the Pengwin Issues page [here](https://github.com/whitewaterfoundry/Pengwin/issues).
- Next, search for your issue on the general WSL Issues page [here](https://github.com/Microsoft/WSL/issues).
- Then consult the official [Troubleshooting Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting) documentation from Microsoft.
- Finally, if you are still unable to resolve your issue, please submit a bug report [here](https://github.com/WhitewaterFoundry/Pengwin/issues/new?template=bug_report.md) and we will do our best to help you. We usually respond to most Issues within a few hours. Thank you for your patience.

## Additional Pengwin Documentation

- [LICENSE.md](LICENSE.md)
- [BUILDING.md](BUILDING.md)
- [PRIVACY.md](PRIVACY.md)
- [ROADMAP.md](ROADMAP.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)

## Related Pages

- [Awesome Windows Subsystem for Linux](https://github.com/sirredbeard/Awesome-WSL)
- [Awesome UNIX](https://github.com/sirredbeard/Awesome-UNIX)
- [wslu](https://github.com/wslutilities/wslu)

## Credits

### Core Team

- [Carlos Rafael Ramirez](https://github.com/crramirez)
- [Javier David Santos](https://github.com/javiersantossanchez)
- [José Alejandro Carrizo](https://github.com/carrizo)

### Contributors

- [Andrew Fehr](https://github.com/ThatWeirdAndrew)
- [Kim Bradley](https://github.com/grufwub)
- [B. Branchard](https://github.com/branchard)
- [haodeon](https://github.com/haodeon)
- [Nick Clarke](https://github.com/nickolasclarke)
- [laventillelion](https://github.com/laventillelion)
- [Patrick Wu](https://github.com/patrick330602)

### Founder

- [Hayden Barnes](https://github.com/sirredbeard)

### Testing/QA

- [Jack Mangano](https://thechipcollective.com/)
- [Nuno do Carmo](http://wslcorsair.blogspot.com/)
- [Jeremy Sinclair](https://twitter.com/sinclairinat0r)
- [Ricardo Echavarria](https://twitter.com/r_icarus)

<a href='//www.microsoft.com/store/apps/9NV1GV1PXZ6P?ocid=badge'><img src='https://assets.windowsphone.com/85864462-9c82-451e-9355-a3d5f874397a/English_get-it-from-MS_InvariantCulture_Default.png' alt='Store badge' height=50/></a>

