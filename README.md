# setup.sh
[![Join the chat at https://gitter.im/NShift/setup.sh](https://badges.gitter.im/NShift/setup.sh.svg)](https://gitter.im/NShift/setup.sh?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

`setup.sh` is a collection of script that install all the essential apps and tools 
you need when you setup a new Mac.

## Table Of Contents

* [Goal and Philosophy](#goal-and-philosophy)
* [Installation](#installation)
* [Apps](#apps)
* [Tools](#tools)
* [Fonts](#fonts)
* [Support](#support)
* [Resources](#resources)
* [We Love Our Contributors](#we-love-our-contributors)

## Goal and Philosophy

`setup.sh` brings setup automation to everybody in a simple way. It should help
teams to customize the setup and create new ones easily.

**We encourage you to fork the project and add the apps that help you and your 
team to be productive and efficient.**

## Installation

```
git clone https://github.com/nshift/setup.sh
cd setup.sh
./setup.sh
```

*Note*: You can run `apps.sh`, `ios.sh` and `terminal.sh` separately but you 
should use `setup.sh` for most of the cases.

## Apps

Essential apps will be installed using [`mas-cli`](https://github.com/mas-cli/mas) 
and [`brew cask`](https://github.com/Homebrew/homebrew-cask).

These apps are perfect for being ready to get things done:

- [iTerm2](https://iterm2.com): iTerm2 is a replacement for Terminal and the 
successor to iTerm.
- [Github Desktop](https://desktop.github.com): Extend your GitHub workflow 
beyond your browser with GitHub Desktop.
- [Sublime Text](http://www.sublimetext.com): A sophisticated text editor for 
code, markup and prose.
- [Spectacle](https://www.spectacleapp.com): Window control with simple and 
customizable keyboard shortcuts.
- [Slack](https://slack.com): Slack is the collaboration hub that brings the 
right people together with all the right information and tools to get work done.
- [Xcode](https://developer.apple.com/xcode/): Xcode is an integrated development 
environment for macOS containing a suite of software development tools developed 
by Apple for developing software for macOS, iOS, watchOS, and tvOS.

You can add or remove apps by editing `apps.sh`.

You can download apps on the App Store using `mas` command:

```
mas lucky slack
```

If the app is not available on the App Store, you can download it using `brew cask`:

```
brew cask install sublime-text
```

## Tools

Tools will be installed through [`brew`](https://brew.sh) and [`bundle`](https://bundler.io) 
command lines.

These tools are perfect for being ready to code:

- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh): Oh My Zsh is an open 
source, community-driven framework for managing your zsh configuration.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): 
Fish-like fast/unobtrusive autosuggestions for zsh.
- [zsh completions](https://github.com/zsh-users/zsh-completions): This projects 
aims at gathering/developing new completion scripts that are not available in Zsh yet.
- [zsh syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): 
This package provides syntax highlighting for the shell zsh.
- [Homebrew](https://brew.sh): The missing package manager for macOS.
- [Homebrew Cask](https://github.com/Homebrew/homebrew-cask): A CLI workflow for 
the administration of macOS applications distributed as binaries https://brew.sh.
- [Ruby](https://www.ruby-lang.org/en/): A dynamic, open source programming 
language with a focus on simplicity and productivity.
- [Bundler](https://bundler.io): Bundler provides a consistent environment for 
Ruby projects by tracking and installing the exact gems and versions that are needed.
- [cocoapods](https://cocoapods.org): CocoaPods is a dependency manager for 
Swift and Objective-C Cocoa projects.
- [xcpretty](https://github.com/supermarin/xcpretty): Flexible and fast xcodebuild 
formatter.
- [terminal-table](https://github.com/tj/terminal-table): Ruby ASCII Table 
Generator, simple and feature rich.
- [colorize](https://github.com/fazibear/colorize): Ruby string class extension. 
It add some methods to set color, background color and text effect on console 
easier using ANSI escape sequences.

You can use `brew` to install tools:

```
brew install ruby
```

To install ruby gems, add it to the `Gemfile` and run:

```
bundle install
```

## Fonts

[Input](http://input.fontbureau.com) is a typeface for code, designed by David 
Jonathan Ross and released by Font Bureau.

## Support

`setup.sh` is only supporting `Mac OSX` at this momement.

## Resources

- [An Argument for Automation by Kent C. Dodds (@kentcdodds)](https://blog.kentcdodds.com/an-argument-for-automation-fce8394c14e2)

## We Love Our Contributors

Night Shift team would like to thanks all the contibutors for their contribution 
to make `setup.sh` a great project.

Thanks to @romsi and @damienfraud.