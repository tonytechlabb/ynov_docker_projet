#!/bin/sh
if [ "$1" = "time" ]; then
  date
  else
$@
fi
