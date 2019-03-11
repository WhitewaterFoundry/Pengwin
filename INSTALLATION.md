## WLinux Installation
The following packages are mandatory to `run` WLinux:
* Windows Universal CRT SDK
* VC++ 2017 version 15.9 v14.16 latest v141 tools
* Visual C++ 2017 Redistributable Update

Note: If the [BUILDING.md](BUILDING.md) is followed, this is not needed!

### Importing the settings directly from VisualStudio Installer:
Create installation file `.vsconfig` with the following content:
```json
{
	"version": "1.0",
	"components": [
		"microsoft.visualstudio.component.vc.redist.14.latest",
		"microsoft.visualstudio.component.vc.tools.x86.x64",
		"microsoft.component.vc.runtime.ucrtsdk"
	]
}
```
From [VisualStudio Installer](http://aka.ms/vscommunity) use `Import Configuration`
