# Pengwin

专门为 Windows 10 Linux® 子系统调整的 Linux® 发行版，基于 Debian®，由 [Whitewater Foundry](https://whitewaterfoundry.com) 出品。



<img src='https://github.com/WhitewaterFoundry/Screenshots/raw/master/ezgif.com-gif-maker.gif'>

<a href='//www.microsoft.com/store/apps/9NV1GV1PXZ6P?ocid=badge'><img src='https://get.microsoft.com/images/zh-cn%20dark.svg' alt='Chinese badge' height=50/></a>

- [English](EADME.md)
- [繁體中文](README.zh-hant.md)
- [日本語](README.ja.md)

如要获取 Pengwin 最新动向，可以访问我们的[博客](https://www.pengwin.dev/blog)以及我们的推特账号 [@PengwinLinux](https://twitter.com/PengwinLinux)。

[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?label=Follow&style=social)](https://twitter.com/pengwinlinux)

如果你是企业用户，你也许会对我们专门针对企业用户开发的 [Pengwin 企业版](https://github.com/WhitewaterFoundry/WLE)感兴趣。

## 功能

- Pengwin 是一款使用 Microsoft Research 开源技术基于 Debian 发行版的 Windows 10 Linux 子系统发行版。
- Pengwin 同时也是第一款专门为开发者和资深用户设计的在 [Windows 10 Linux 子系统](https://github.com/sirredbeard/Awesome-WSL)(WSL) 上运行的 Linux 开发环境。
- 预装 [wslu](https://github.com/wslutilities/wslu), 一款专门为 WSL 而设计的工具组。
- `$ pengwin-setup` 协助你配置你的 Linux 到你最喜欢的样子：
    - 修改你的 Pengwin 语言设置。
    - 可选的 terminal shells: csh, zsh (带 [oh-my-zsh](https://ohmyz.sh/))或者 [fish](https://fishshell.com/) (带 [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish))。
    - 可选的文字编辑器: [emacs](https://www.gnu.org/software/emacs/), [neovim](https://neovim.io/) 或者 [Visual Studio Code](https://code.visualstudio.com/)。
    - 安装你最喜爱的开发环境: [NodeJS](https://nodejs.org/) (n，npm和/或yarn), Python 3.7 (带pip), [Ruby](http://www.ruby-lang.org/) (通过rbenv )与 [Go](https://golang.org/)。
    - 用这些工具来管理你的 Windows 和 Azure: [PowerShell](https://github.com/PowerShell/PowerShell) 和 [azure-cli](https://github.com/Azure/azure-cli)。
    - 开启/关闭 Windows 文件管理器右键菜单支持。
    - 配置 WSL 的 GUI 设置，包括一款针对 Linux 设计的 [Windows 10 主题](https://github.com/B00merang-Project/Windows-10)，高分辨率支持和 CJK 输入法支持。
    - 支持 Docker 桥的创建。
- 支持大部分的 [GUI 应用](https://github.com/ethanhs/WSL-Programs)! 注：需要安装 Windows 下的X服务器，如 [X410](http://afflnk.microsoft.com/c/1291904/459838/7593?prodsku=9NLP712ZMN9Q&u=https%3A%2F%2Fwww.microsoft.com%2Fen-us%2Fstore%2Fp%2Fx410%2F9NLP712ZMN9Q)。
- Pengwin 提供与其他 WSL 支持的发行版相比更快的 Bug 修复。
- 我们会基于[社区反馈](https://github.com/WhitewaterFoundry/Pengwin/issues)不断的开发[新功能](https://github.com/WhitewaterFoundry/Pengwin/pulls)。还有，不要错过我们的 [Pengwin 赏金计划](CONTRIBUTING.md)。

## 安装需求

- Windows 10
    - 最低 1709/16299
    - 推荐 1809/17763
- 确保 Windows 10 Linux 子系统已启用
    - 你可用使用以下命令在有管理员权限的 PowerShell 来启用 Windows 10 Linux 子系统:
        ```
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
        ```
        
## 更新

你可以使用 apt 包管理系统检查更新。

1. 检查最新更新： `$ sudo apt-get update`
2. 安装最新更新： `$ sudo apt-get upgrade`

## 版本

Pengwin 是一款使用滚动发行的发行版。 Debian 程序包、pengwin-base 以及 pengwin-setup 会受到持续而不间断的更新。 Pengwin 的版本号（如1.2）是用来进行长期的功能及 Bug 记录使用的，会在2-3个月发布一个新的版本。每一个新版本都会进行编译并上传到微软商店。例如说，第三个1.2编译版本在商店里会被标注为 1.2.3。

查看 `pengwin-setup` 的版本: `$ apt-cache policy pengwin-setup`

查看 `pengwin-base` 的版本: `$ apt-cache policy pengwin-base`

## 支持

Pengwin 在商店的购买可以是独立的开源开发者们能够持续的开发，测试和调整 Pengwin。我们尝试为您提供最好的用户服务。大部分问题可以通过以下方法解决。

- 请先[在此](https://github.com/sirredbeard/Pengwin/issues)搜索你的问题。
- 如果找不到，请在[ WSL 反馈页](https://github.com/Microsoft/WSL/issues)搜索你的问题。
- 你也可以查看微软官方的[ WSL 故障排除](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting)档案。
- 如果你无法找到你的问题，请[开一个新的 issue](https://github.com/WhitewaterFoundry/Pengwin/issues/new?template=bug_report.md). 我们通常会在几个小时内回复你，请您耐心等待。

## 其他文档

- [LICENSE.md](LICENSE.md)
- [BUILDING.md](BUILDING.md)
- [PRIVACY.md](PRIVACY.md)
- [ROADMAP.md](ROADMAP.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)

## 相关链接

- [Awesome Windows Subsystem for Linux](https://github.com/sirredbeard/Awesome-WSL)
- [Awesome UNIX](https://github.com/sirredbeard/Awesome-UNIX)
- [wslu](https://github.com/wslutilities/wslu)

## 开发团体

### 核心团队

- [Hayden Barnes](https://github.com/sirredbeard)
- [Patrick Wu](https://github.com/patrick330602)
- [Carlos Rafael Ramirez](https://github.com/crramirez)
- [Kim Bradley](https://github.com/grufwub)

### 贡献者

- [Andrew Fehr](https://github.com/ThatWeirdAndrew)

### 测试/QA

- [Jack Mangano](https://thechipcollective.com/)
- [Nuno do Carmo](http://wslcorsair.blogspot.com/)

<a href='//www.microsoft.com/store/apps/9NV1GV1PXZ6P?ocid=badge'><img src='https://assets.windowsphone.com/42e5aa4a-f19a-4205-9191-a97105ed7663/Chinese_Simplified_get-it-from-MS_InvariantCulture_Default.png' alt='Chinese badge' height=50/></a>