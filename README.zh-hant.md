# Pengwin

專門為 Windows 10 Linux® 子系統調整的 Linux® 發行版，基於 Debian®，由 [Whitewater Foundry](https://whitewaterfoundry.com) 出品。

<img src='https://github.com/WhitewaterFoundry/Screenshots/raw/master/ezgif.com-gif-maker.gif'>

<a href='//www.microsoft.com/store/apps/9NV1GV1PXZ6P?ocid=badge'><img src='https://get.microsoft.com/images/zh-tw%20dark.svg' alt='Chinese Traditional badge' height=50/></a>

- [English](EADME.md)
- [简体中文](README.zh-hans.md)
- [日本語](README.ja.md)

如要獲取 Pengwin 最新動向，可以訪問我們的[部落格](https://www.pengwin.dev/blog)以及我們的推特賬號 [@PengwinLinux](https://twitter.com/PengwinLinux)。

[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?label=Follow&style=social)](https://twitter.com/pengwinlinux)

如果你是企業使用者，你也許會對我們專門針對企業使用者開發的 [Pengwin 企業版](https://github.com/WhitewaterFoundry/WLE)感興趣。

## 功能

- Pengwin 是一款使用 Microsoft Research 開源技術基於 Debian 發行版的 Windows 10 Linux 子系統發行版。
- Pengwin 同時也是第一款專門為開發者和資深使用者設計的在 [Windows 10 Linux 子系統](https://github.com/sirredbeard/Awesome-WSL)(WSL) 上執行的 Linux 開發環境。
- 預裝 [wslu](https://github.com/wslutilities/wslu), 一款專門為 WSL 而設計的工具組。
- `$ pengwin-setup` 協助你配置你的 Linux 到你最喜歡的樣子：
    - 修改你的 Pengwin 語言設定。
    - 可選的 terminal shells: csh, zsh (帶 [oh-my-zsh](https://ohmyz.sh/))或者 [fish](https://fishshell.com/) (帶 [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish))。
    - 可選的文字編輯器: [emacs](https://www.gnu.org/software/emacs/), [neovim](https://neovim.io/) 或者 [Visual Studio Code](https://code.visualstudio.com/)。
    - 安裝你最喜愛的開發環境: [NodeJS](https://nodejs.org/) (n，npm和/或yarn), Python 3.7 (帶pip), [Ruby](http://www.ruby-lang.org/) (通過rbenv )與 [Go](https://golang.org/)。
    - 用這些工具來管理你的 Windows 和 Azure: [PowerShell](https://github.com/PowerShell/PowerShell) 和 [azure-cli](https://github.com/Azure/azure-cli)。
    - 開啟/關閉 Windows 檔案管理器右鍵選單支援。
    - 配置 WSL 的 GUI 設定，包括一款針對 Linux 設計的 [Windows 10 主題](https://github.com/B00merang-Project/Windows-10)，高解析度支援和 CJK 輸入法支援。
    - 支援 Docker 橋的建立。
- 支援大部分的 [GUI 應用](https://github.com/ethanhs/WSL-Programs)! 注：需要安裝 Windows 下的X伺服器，如 [X410](http://afflnk.microsoft.com/c/1291904/459838/7593?prodsku=9NLP712ZMN9Q&u=https%3A%2F%2Fwww.microsoft.com%2Fen-us%2Fstore%2Fp%2Fx410%2F9NLP712ZMN9Q)。
- Pengwin 提供與其他 WSL 支援的發行版相比更快的 Bug 修復。
- 我們會基於[社羣反饋](https://github.com/WhitewaterFoundry/Pengwin/issues)不斷的開發[新功能](https://github.com/WhitewaterFoundry/Pengwin/pulls)。還有，不要錯過我們的 [Pengwin 賞金計劃](CONTRIBUTING.md)。

## 安裝需求

- Windows 10
    - 最低 1709/16299
    - 推薦 1809/17763
- 確保 Windows 10 Linux 子系統已啟用
    - 你可用使用以下命令在有管理員許可權的 PowerShell 來啟用 Windows 10 Linux 子系統:
        ```
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
        ```
        
## 更新

你可以使用 apt 包管理系統檢查更新。

1. 檢查最新更新： `$ sudo apt-get update`
2. 安裝最新更新： `$ sudo apt-get upgrade`

## 版本

Pengwin 是一款使用滾動發行的發行版。 Debian 程式包、pengwin-base 以及 pengwin-setup 會受到持續而不間斷的更新。 Pengwin 的版本號（如1.2）是用來進行長期的功能及 Bug 記錄使用的，會在2-3個月釋出一個新的版本。每一個新版本都會進行編譯並上傳到微軟商店。例如說，第三個1.2編譯版本在商店裡會被標註為 1.2.3。

檢視 `pengwin-setup` 的版本: `$ apt-cache policy pengwin-setup`

檢視 `pengwin-base` 的版本: `$ apt-cache policy pengwin-base`

## 支援

Pengwin 在商店的購買可以是獨立的開源開發者們能夠持續的開發，測試和調整 Pengwin。我們嘗試為您提供最好的使用者服務。大部分問題可以通過以下方法解決。

- 請先[在此](https://github.com/sirredbeard/Pengwin/issues)搜尋你的問題。
- 如果找不到，請在[ WSL 反饋頁](https://github.com/Microsoft/WSL/issues)搜尋你的問題。
- 你也可以檢視微軟官方的[ WSL 故障排除](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting)檔案。
- 如果你無法找到你的問題，請[開一個新的 issue](https://github.com/WhitewaterFoundry/Pengwin/issues/new?template=bug_report.md). 我們通常會在幾個小時內回覆你，請您耐心等待。

## 其他文档

- [LICENSE.md](LICENSE.md)
- [BUILDING.md](BUILDING.md)
- [PRIVACY.md](PRIVACY.md)
- [ROADMAP.md](ROADMAP.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)

## 相關連結

- [Awesome Windows Subsystem for Linux](https://github.com/sirredbeard/Awesome-WSL)
- [Awesome UNIX](https://github.com/sirredbeard/Awesome-UNIX)
- [wslu](https://github.com/wslutilities/wslu)

## 開發團體

### 核心團隊

- [Hayden Barnes](https://github.com/sirredbeard)
- [Patrick Wu](https://github.com/patrick330602)
- [Carlos Rafael Ramirez](https://github.com/crramirez)
- [Kim Bradley](https://github.com/grufwub)

### 貢獻者

- [Andrew Fehr](https://github.com/ThatWeirdAndrew)

### 測試/QA

- [Jack Mangano](https://thechipcollective.com/)
- [Nuno do Carmo](http://wslcorsair.blogspot.com/)

<a href='//www.microsoft.com/store/apps/9NV1GV1PXZ6P?ocid=badge'><img src='https://assets.windowsphone.com/e34f1ae1-fe0c-4fbc-afe6-3bd495fff1b9/Chinese-Traditional_get-it-from-MS_InvariantCulture_Default.png' alt='Chinese Traditional badge' height=50/></a>