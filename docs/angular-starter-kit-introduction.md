# Angular Starter Kit

The [Angular Starter Kit](https://github.com/TimMurphy/AngularStarterKit "Angular Starter Kit") provides a minimal starting point for new [AngularJS](https://angularjs.org/ "AngularJS") projects.

This project is heavily influenced by [Angular Seed](https://github.com/angular/angular-seed "Angular Seed"). This project has two main differences from Angular Seed:

- It is written by a Windows developer for Windows developers.
- It includes this blog series to describe the project in detail.

## Getting Started

To get you started you can simply clone the Angular Starter Kit repository and install the dependencies:

### Prerequisites

These instructions and [InstallDependencies.cmd](https://github.com/TimMurphy/AngularStarterKit/blob/master/InstallDependencies.cmd "InstallDependencies.cmd") depend on Windows Package Manager [chocolatey](https://chocolatey.org/).

Install Chocolatey; requires an administrator command prompt:

	C:\> @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

You need git to clone the Angular Starter Kit.

	choco install git

## Clone Angular Starter Kit

Clone the Angular Starter Kit repository using git:

	git clone https://github.com/TimMurphy/AngularStarterKit.git
	cd AngularStarter

If you just want to start a new project without the Angular Starter Kit commit history then you can do:

	git clone --depth=1 https://github.com/TimMurphy/AngularStarterKit.git <your-project-name>

The ``depth=1`` option tells git to only pull down one commit worth of historical data.

All remaining dependencies by running:

	InstallDependencies.cmd
