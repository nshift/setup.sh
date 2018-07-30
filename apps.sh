#!/bin/sh
source ./.terminal/ui.sh

function print_usage {
	echo "Usage: ./apps.sh [--version|--help]"
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
## Sublime Text.
##
## A sophisticated text editor for code, markup and prose.
##
## See more: http://www.sublimetext.com.
##
step "Install Sublime Text"

sublime_text_output=$(brew cask install sublime-text 2>&1 >/dev/null)

if [ $? -eq 0 ]; then
	success "Sucessfully installed Sublime Text."
elif echo "$sublime_text_output" | grep -i "It seems there is already an App"; then
	success "Sublime Text is already installed"
else
	error "Fail to install Sublime Text."
fi
if [ $? -eq 0 ]; then
	success "Sucessfully installed Sublime Text."
else
	error "Fail to install Sublime Text."
fi

##
## Spectacle.
##
## Window control with simple and customizable keyboard shortcuts.
##
## See more: https://www.spectacleapp.com.
##
step "Install Spectacle"

spectacle_output=$(brew cask install spectacle 2>&1 >/dev/null)

if [ $? -eq 0 ]; then
	success "Sucessfully installed Spectacle."
elif echo "$spectacle_output" | grep -i "It seems there is already an App"; then
	success "Spectacle is already installed"
else
	error "Fail to install Spectacle."
fi

##
## Slack.
##
## Slack is the collaboration hub that brings the right people together with all the right information and tools to get work done.
##
## See more: https://slack.com.
##
step "Install Slack"

mas lucky slack

if [ $? -eq 0 ]; then
	success "Sucessfully installed Slack."
else
	error "Fail to install Slack."
fi