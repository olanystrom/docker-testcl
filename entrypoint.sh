#!/bin/sh

set -e

if [ "$1" = 'test' ]; then
  if [ -f 'tests/generate_irules.py' ]; then
    python3 tests/generate_irules.py
  fi
  cd tests
  if [ -f 'generate_classfiles.py' ]; then
    python3 generate_classfiles.py
  fi
  export ARGS=`echo $2 | sed -e 's/^tests\///'`
  exec jtcl "$ARGS"

elif [ "$1" = 'makemeroot' ]; then
  exec ash

else
  exec su-exec testcl "$@"
fi