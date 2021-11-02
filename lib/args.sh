#!/bin/bash

#Declare the number of mandatory args
margs=2

# Common functions - BEGIN
function example {
    echo -e "example: [COMMAND] -d VAL -m VAL -u VAL"
    echo -e "example: ./init_distro.sh -d 'Ubuntu-18.04' -m 'my-app' -u 'user3'"
}

function usage {
    echo -e "usage: [COMMAND] MANDATORY [OPTION]\n"
}

function help {
  usage
    echo -e "MANDATORY:"
    echo -e "  -d, --distro  VAL  Distro name (*reference: wsl --list --online*)"
    echo -e "  -m, --module  VAL  Application name\n"
    echo -e "OPTION:"
    echo -e "  -u, --user    VAL  Username"
    echo -e "  -h,  --help        Prints this help\n"
  example
}

# Ensures that the number of passed args are at least equals
# to the declared number of mandatory args.
# It also handles the special case of the -h or --help arg.
function margs_precheck {
	if [ $2 ] && [ $1 -lt $margs ]; then
		if [ $2 == "--help" ] || [ $2 == "-h" ]; then
			help
			exit
		else
	    	usage
			example
	    	exit 1 # error
		fi
	fi
}

# Ensures that all the mandatory args are not empty
function margs_check {
	if [ $# -lt $margs ]; then
	    usage
	  	example
	    exit 1 # error
	fi
}
# Common functions - END

# Main
margs_precheck $# $1

distro=
module=
user="user"

# Args while-loop
while [ "$1" != "" ];
do
   case $1 in
   -d  | --distro )  shift
                          distro=$1
                		  ;;
   -m  | --module )  shift
   						            module=$1
			              ;;
   -u  | --user  )  shift
                          user=$1
                          ;;
   -h   | --help )        help
                          exit
                          ;;
   *)                     
                          echo "[COMMAND]: illegal option $1"
                          usage
						  example
						  exit 1 # error
                          ;;
    esac
    shift
done

# Pass here your mandatory args for check
margs_check $distro $module
