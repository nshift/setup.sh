#!/bin/sh
source ./.terminal/ui.sh

function print_usage {
	echo "Usage: ./ios.sh [--version|--help]"
	echo ""
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
	* )
		;;
esac

##
## Mac App Store command line interface.
##
## A simple command line interface for the Mac App Store. Designed for scripting and automation.
##
## See more: https://github.com/mas-cli/mas.
##
step "Install Mac App Store command line interface"

brew install mas

if [ $? -eq 0 ]; then
	success "Sucessfully installed Mac App Store command line interface."
else
	error "Fail to install Mac App Store command line interface."
fi

##
## Xcode.
##
## Xcode is an integrated development environment for macOS containing a suite of software development tools developed by Apple for developing software for macOS, iOS, watchOS, and tvOS.
##
## See more: https://developer.apple.com/xcode/.
##
step "Install Xcode"

mas lucky xcode

if [ $? -eq 0 ]; then
	success "Sucessfully installed Xcode."
else
	error "Fail to install Xcode."
fi

##
## Xcode command line tools.
##
## Download the macOS SDK, headers, and build tools such as the Apple LLVM compiler and Make. 
## These tools make it easy to install open source software or develop on UNIX within Terminal.
##
## See more: https://developer.apple.com.
##
step "Install Xcode command line tools"

xcode_select_output="$(xcode-select --install 2>&1 >/dev/null)"

if [ $? -eq 0 ]; then
	success "Sucessfully installed Mac App Store command line interface"
elif echo "$xcode_select_output" | grep -i "command line tools are already installed"; then
	success "Mac App Store command line interface is already installed"
else
	error "Fail to install Mac App Store command line interface."
fi

##
## Git config color.
##
## Git automatically colors most of its output, but there’s a master switch if you don’t like this behavior.
##
## See more: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_colors_in_git
##
step "Configure git color"

git config --global color.ui true

if [ $? -eq 0 ]; then
	success "Sucessfully configured git color."
else
	error "Fail to configure git color."
fi

##
## Git config push.default.
##
## Defines the action git push should take if no refspec is explicitly given.
##
## See more: https://git-scm.com/docs/git-config#git-config-pushdefault
##
step "Configure git push strategy"

git config --global push.default matching

if [ $? -eq 0 ]; then
	success "Sucessfully configured git push strategy."
else
	error "Fail to set push matching strategy by default."
fi