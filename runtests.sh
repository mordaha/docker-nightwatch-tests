#!/bin/sh

BASEDIR=$(pwd)

# build once
# docker build -t your/tag .

# run mounting dir with tests to volume /tests in container
# exec docker run --rm -v /your/dir/with/tests:/tests your/tag ${@}

# or run it from docker hub
exec docker run --rm -v ${BASEDIR}/tests:/tests mordaha/nightwatch-tests ${@}
