#!/bin/bash

#Declare the number of mandatory args
margs=2

# Common functions - BEGIN
function example {
    echo -e "example: [COMMAND] -m0 VAL -m1 VAL -o0 VAL"
    echo -e "example: ./init_distro.sh -m0 'Ubuntu-18.04' -m1 'my-app' -o0 'user3'"
}

function usage {
    echo -e "usage: [COMMAND] MANDATORY [OPTION]\n"
}

function help {
  usage
    echo -e "MANDATORY:"
    echo -e "  -m0, --mandatory0  VAL  Distro name (*reference: wsl --list --online*)"
    echo -e "  -m1, --mandatory1  VAL  Application name\n"
    echo -e "OPTION:"
    echo -e "  -o0, --optional0   VAL  Username"
    echo -e "  -h,  --help             Prints this help\n"
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

marg0=
marg1=
oarg0="user"

# Args while-loop
while [ "$1" != "" ];
do
   case $1 in
   -m0  | --mandatory0 )  shift
                          marg0=$1
                		  ;;
   -m1  | --mandatory1 )  shift
   						  marg1=$1
			              ;;
   -o0  | --optional0  )  shift
                          oarg0=$1
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
margs_check $marg0 $marg1
