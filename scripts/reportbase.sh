#!/bin/bash

SKELDIR="/etc/reportbase/skel"
INDEXFILE="Report.tex"
MKMATLAB=0
MATLAB="matlab -nojvm"
GENERATE_SCRIPT="generate_report_x"


function make_chapter {
  if [ ! -e "$1" ]
  then
    mkdir "$1" "$1/figures"
    sed "s/::name::/$1/g" $SKELDIR/chapter.tex > "$1/$1.tex"
  fi
  if [ $MKMATLAB -eq 1 ]; then
    mkdir "$1/matlab"
    sed "s/::name::/$1/g" $SKELDIR/chapter.m > "$1/matlab/$1.m"
  fi
}

function register_chapter {
  sed -i "s/%%::$TAG::%%/\\\\newchapter{$1}\\n%%::$TAG::%%/" $INDEXFILE
}

function rename {
  mv $1 $2
  mv "$2/$1.tex" "$2/$2.tex"
  if [ -d "$2/matlab" ] && [ -f "$2/matlab/$1.m" ] ; then
    mv "$2/matlab/$1.m" "$2/matlab/$2.m"
  fi
  sed -i "s/\\\\newchapter{$1}/\\\\newchapter{$2}/" $INDEXFILE
}

function help {
  echo "Valid commands are: init, add [chapter(s)], generate and rename [old new]"
  echo "Valid flags for the add command are"
  echo " -a   Adds following chapters as appendices. Resets m-flag to off."
  echo " -m   Toggles between creating matlab directories or not. By default off"
  echo ""
  echo "reportbase is made by Jonatan Olofsson"
}

if [ ! -e $INDEXFILE ] && [ $1 != "init" ] ; then
  echo "Indexfile $INDEXFILE could not be located. Either you're in the wrong directory, or it is not yet initialised"
fi


if [ $# -lt 1 ] ; then
  echo "Not enough arguments."; help; exit
fi

case $1 in
  "init")
    cp -R $SKELDIR/{include,$INDEXFILE} .
    ;;
  "add")
    if [ $# -le 1 ] ; then
      echo "Not enough arguments."; help; exit
    fi
    TAG="chapters"
    counter=0
    for arg in "$@"
    do
      counter=$(($counter+1))
      if [ $counter = 1 ] ; then
        continue
      fi
      case $arg in
      "-a")
        TAG="appendices"
        MKMATLAB=0
        ;;
      "-m")
        MKMATLAB=$(( ! $MKMATLAB ))
        ;;
      *)
        make_chapter $arg
        register_chapter $arg
      esac

    done
  ;;
  "generate")
    $MATLAB -r "$GENERATE_SCRIPT"
  ;;
  "rename")
    if [ ! $# -eq 3 ] ; then
      echo "Wrong number of arguments"; help; exit
    fi
    if [ ! -d $2 ] ; then
      echo "No such chapter: $2." ; exit
    fi
    if [ -d $3 ] ; then
      echo "Chapter $3 exists." ; exit
    fi

    rename $2 $3

    ;;
  *)
    echo "Invalid argument: $1"
    help
  ;;
esac

exit
