#!/bin/bash

SKELDIR = "/etc/reportbase/skel"
INDEXFILE = "Report.tex"
MKMATLAB = false
MATLAB = "matlab -nojvm"
GENERATE_SCRIPT = "/etc/reportbase/generate_report"


function make_chapter {
  if [! -e "$1"]
  then
    mkdir "$1" "$1/figures"
    cp $SKELDIR/chapter.tex "$1/$1.tex"
  fi
  if $MKMATLAB
  then
    mkdir "$1/matlab"
    touch "$1/matlab/$1.m"
  fi
}

function register_chapter {
  sed -i "s/%%::$TAG::%%/\newchapter{$1}\\n%%::$TAG::%%/"
}

case $1 in
  "init")
    cp -R $SKELDIR/{include,$INDEXFILE} .
    ;;
  "add")
    TAG = "chapters"
    counter = 0
    for arg in "$@"
    do
      counter=$(($counter+1))
      if [ $counter = 1 ] ; then
        continue
      fi
      case $arg in
      "-a")
        TAG = "appendices"
        ;;
      "-m")
        MKMATLAB = !$MKMATLAB
        ;;
      *)
        make_chapter $arg
        register_chapter $arg
      esac

    done
  ;;
  "generate")
    $MATLAB -r $GENERATE_SCRIPT
  ;;
esac
