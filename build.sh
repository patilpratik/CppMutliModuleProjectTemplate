#!/bin/bash

##
## Supported options
##  -m | --module      : build only specific modules
##  -a | --all         : build all modules
##  --default     : build only modified
##  -c | --clean       : clean all modules
##  -c | --clean [mod] : clean module mod
##

####################################
##### Command supported ############
####################################

NONE=0
MODULE=1
ALL=2
CLEAN=3

####################################
###### Local Variables ############
###################################
ARG="all"
COMMAND=$NONE
COMPILE=0
PROJECT_DIR=$(dirname `realpath \`which $0\` `)


################### Main #############

### check input parameter
### initialize command and option
### validate command and option
### create build directory
### execute command

echo "$PROJECT_DIR"

help ()
{
    echo "Print help here"
}

clean ()
{
    echo "clean"
    if [ "$1" = "all" ]; then
        echo "cleaning all"
        make clean
    else
        pushd $1
        echo "cleaning $1"
        make clean
        popd
    fi
}

build ()
{
    if [ "$1" = "all" ]; then
        echo "building all"
        make
        if [ $? == 0 ]; then
            make install
        fi
    else
        pushd $1
        echo "building $1"
        make 
        if [ $? == 0 ]; then
            make install
        fi
        popd
    fi
}

if [ ! -d "build" ]; then
    mkdir build
fi
cd build
cmake ../

if [ "$#" -ge 1 ] ;then
    while getopts "c:ham:" opt; do
        case "$opt" in
            h)
                help
                exit 0
                ;;
            c)
                clean $OPTARG
                exit 0
                ;;
            a)
                COMMAND=$ALL
                COMPILE=1
                ;;
            m)
                COMMAND=$MODULE
                ARG=$OPTARG
                COMPILE=1
                ;;
            *)
                echo "Invalid option \"opt\""
                help
                exit 1
                ;;
        esac
    done

    if [ $COMPILE -eq 1 ]; then
        build $ARG
    fi 
else 
    build "all"
fi
