#!/bin/sh

function print_usage {
	echo "Usage: ./install.sh [--force|--version|--help]"
	echo ""
	echo "  --force		force to update oh-my-zsh plugins and themes"
	echo "  --version	display the project version"
	echo "  --help		get more information"
	echo ""
}

case "${1}" in
    --help )
        print_usage
        exit 0
        ;;
    --version )
		echo "Version 1.0.0"
		exit 0
		;;
    --force )
		FORCED=true
		;;
	* )
		FORCED=false
		;;
esac

##
## Oh My Zsh.
##
## Oh My Zsh is an open source, community-driven framework for managing your zsh configuration.
##
## See more: https://github.com/robbyrussell/oh-my-zsh.
##
step "Install Oh My Zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ $? -eq 0 ]; then
	success "Oh My Zsh has been sucessfully installed."
else
	error "Fail to install Oh My Zsh."
fi

##
## oh-my-zsh theme.
##
## oh-my-zsh is fully configurable to your needs with the help of the $ZSH_CUSTOM variable,
## whether you want to change its internals, plugins or the rich theme set – and all that without forking!
##
## Initially $ZSH_CUSTOM points to oh-my-zsh's custom directory. 
## Whatever you place inside of it will take precedence over the built-in configuration.
##
## See more: https://github.com/robbyrussell/oh-my-zsh/wiki/Customization.
##
step "Install Oh My Zsh custom theme"

ZSH_CUSTOM=~/.oh-my-zsh/custom

if [ $FORCED = true ]; then
	rm -rf $ZSH_CUSTOM/themes/
fi
cp -r themes $ZSH_CUSTOM

if [ $? -eq 0 ]; then
	success "Oh My Zsh custom theme has been sucessfully installed."
else
	error "Fail to install Oh My Zsh custom theme."
fi

##
## oh-my-zsh plugins.
##
## Enable the plugins you want by editing your ~/.zshrc file.
##
## See more: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins.
##

ZSH_CUSTOM_PLUGIN_PATH=$ZSH_CUSTOM/plugins

##
## zsh-autosuggestions.
##
## Fish-like fast/unobtrusive autosuggestions for zsh.
## It suggests commands as you type, based on command history.
##
## See more: https://github.com/zsh-users/zsh-autosuggestions.
##
step "Install zsh autosuggestions plugin"

if [ $FORCED = true ]; then
	rm -rf $ZSH_CUSTOM_PLUGIN_PATH/zsh-autosuggestions
fi
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM_PLUGIN_PATH/zsh-autosuggestions

if [ $FORCED = false ] && [ $? -eq 0 ]; then
	success "Zsh autosuggestions plugin has been sucessfully installed."
else
	error "Fail to install zsh autosuggestions plugin."
fi

##
## Install zsh completions.
##
## This projects aims at gathering/developing new completion scripts that are not available in Zsh yet. 
## The scripts may be contributed to the Zsh project when stable enough.
##
## See more: https://github.com/zsh-users/zsh-completions.
##
step "Install zsh completions plugin"

if [ $FORCED = true ]; then
	rm -rf $ZSH_CUSTOM_PLUGIN_PATH/zsh-completions
fi
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM_PLUGIN_PATH/zsh-completions

if [ $FORCED = false ] && [ $? -eq 0 ]; then
	success "Zsh completions plugin has been sucessfully installed."
else
	error "Fail to install zsh completions plugin."
fi

##
## Install zsh syntax highlighting.
##
## This package provides syntax highlighting for the shell zsh. 
## It enables highlighting of commands whilst they are typed at a zsh prompt 
## into an interactive terminal. 
## This helps in reviewing commands before running them, particularly in catching syntax errors.
##
## See more: https://github.com/zsh-users/zsh-syntax-highlighting.
##
step "Install zsh syntax highlighting"

if [ $FORCED = true ]; then
	rm -rf $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

if [ $FORCED = false ] && [ $? -eq 0 ]; then
	success "Zsh syntax highlighting has been sucessfully installed."
else
	error "Fail to install zsh syntax highlighting."
fi

##
## Input fonts.
##
## Input is a typeface for code, designed by David Jonathan Ross and released by Font Bureau.
##
## See more: http://input.fontbureau.com.
##
step "Install Input fonts"

cp -f fonts/*.ttf /Library/Fonts/

if [ $FORCED = false ] && [ $? -eq 0 ]; then
	success "Input fonts has been sucessfully installed."
else
	error "Fail to install Input fonts."
fi

##
## Homebrew.
##
## The missing package manager for macOS.
##
## See more: https://brew.sh.
##
step "Install Homebrew"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if [ $FORCED = true ]; then
	brew update
fi

if [ $? -eq 0 ]; then
	success "Homebrew has been sucessfully installed."
else
	error "Fail to install Homebrew."
fi

##
## Ruby.
##
## A dynamic, open source programming language with a focus on simplicity and productivity.
##
## See more: https://www.ruby-lang.org/en/.
##
step "Install Ruby"

brew install ruby

if [ $? -eq 0 ]; then
	success "Ruby has been sucessfully installed."
else
	error "Fail to install Ruby."
fi

##
## Bundler.
##
## Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed.
##
## See more: https://bundler.io.
##
step "Install Bundler"

gem install bundler

if [ $? -eq 0 ]; then
	success "Bundler has been sucessfully installed."
else
	error "Fail to install Bundler."
fi

##
## Custom Gemfile.
##
## Gemfile will install the following gems:
## - cocoapods: CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects (https://cocoapods.org).
## - xcpretty: Flexible and fast xcodebuild formatter (https://github.com/supermarin/xcpretty).
## - terminal-table: Ruby ASCII Table Generator, simple and feature rich (https://github.com/tj/terminal-table).
## - colorize: Ruby string class extension. It add some methods to set color, background color and text effect on console easier using ANSI escape sequences (https://github.com/fazibear/colorize).
##
## See more: https://bundler.io/gemfile.html
##
step "Install gems from Gemfile"

bundle install
if [ $FORCED = true ]; then
	bundle update
fi

if [ $? -eq 0 ]; then
	success "Gems from Gemfile have been sucessfully installed."
else
	error "Fail to install gems from Gemfile."
fi

##
## Homebrew Cask.
##
## A CLI workflow for the administration of macOS applications distributed as binaries https://brew.sh.
##
## See more: https://github.com/Homebrew/homebrew-cask.
##
step "Install Homebrew Cask"

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

if [ $? -eq 0 ]; then
	success "Homebrew Cask has been sucessfully installed."
else
	error "Fail to install Homebrew Cask."
fi

##
## Github Desktop.
##
## Extend your GitHub workflow beyond your browser with GitHub Desktop.
##
## See more: https://desktop.github.com.
##
step "Install Github Desktop"

github_output=$(brew cask install github 2>&1 >/dev/null)

if [ $? -eq 0 ]; then
	success "Github Desktop has been sucessfully installed."
elif echo "$github_output" | grep -i "It seems there is already an App"; then
	success "Github Desktop is already installed"
else
	error "Fail to install Github Desktop."
fi

##
## iTerm2.
##
## iTerm2 is a replacement for Terminal and the successor to iTerm. 
## It works on Macs with macOS 10.10 or newer. iTerm2 brings the terminal into 
## the modern age with features you never knew you always wanted.
##
## See more: https://iterm2.com.
##
step "Install iTerm2"

iTerm2_output=$(brew cask install iterm2 2>&1 >/dev/null)

if [ $? -eq 0 ]; then
	success "iTerm2 has been sucessfully installed."
elif echo "$iTerm2_output" | grep -i "It seems there is already an App"; then
	success "iTerm2 is already installed"
else
	error "Fail to install iTerm2."
fi

if [ $FORCED = true ]; then
	rm -rf $ZSH_CUSTOM/com.googlecode.iterm2.plist
fi
cp com.googlecode.iterm2.plist $ZSH_CUSTOM

if [ $? -eq 0 ]; then
	success "iTerm2 preference has been sucessfully imported."
else
	error "Fail to import iTerm2 preference."
fi

important "$(cat <<-END
	Important ⚠️ : You should import the preferences by using iTerm app, by following these steps:

	1. Open iTerm2 app
	2. Enable the option \`Load preferences from a custom folder or URL\`
	3. Click on \`Browse\` button and set the path to \`$ZSH_CUSTOM\`.
END
)"

##
## Custom zshrc file.
##
## ZSH run commands file will apply agnoster oh-my-zsh theme every time iTerm is started up.
##
## It also contains pre-installed plugins:
## - git: This plugin adds many useful aliases and functions (https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git).
## - git-extras: GIT utilities -- repo summary, repl, changelog population, author commit percentages and more (https://github.com/tj/git-extras).
## - git-flow: A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model (https://github.com/nvie/gitflow).
## - npm: adds autocompletion to npm (https://www.npmjs.com).
## - osx: This plugin provides a few utilities to make it more enjoyable on OSX (https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx).
## - pod: Completion plugin for CocoaPods (http://docs.cocoapods.org/commands.html).
## - sublime: Plugin for Sublime Text, a cross platform text and code editor, available for Linux, Mac OS X, and Windows (https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sublime).
## - zsh-autosuggestions: Fish-like fast/unobtrusive autosuggestions for zsh (https://github.com/zsh-users/zsh-autosuggestions).
## - zsh-completions: This projects aims at gathering/developing new completion scripts that are not available in Zsh yet (https://github.com/zsh-users/zsh-completions).
## - zsh-syntax-highlighting: This package provides syntax highlighting for the shell zsh (https://github.com/zsh-users/zsh-syntax-highlighting).
##
## See more: https://github.com/robbyrussell/oh-my-zsh/wiki/Customization.
##
step "Custom zshrc file"

if [ $FORCED = true ]; then
	rm -f ~/.zshrc
fi
cp .zshrc ~/

if [ $? -eq 0 ]; then
	success "Zshrc file has been sucessfully customized."
else
	error "Fail to customize Zshrc file."
fi