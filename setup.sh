#!/bin/sh
source ./.terminal/ui.sh

function print_usage {
	echo "Usage: ./setup.sh [--force|--version|--help]"
	echo ""
	echo "  --force		force to update tools"
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

if [ $FORCED = true ]; then
	. terminal.sh --force
else
	. terminal.sh
fi

. ios.sh

. apps.sh

summary

success "Your mac is now ready"