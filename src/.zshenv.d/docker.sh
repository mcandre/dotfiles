#!/bin/sh

# Work around gaps in image ISA's
export DOCKER_DEFAULT_PLATFORM='linux/amd64'

# Work around spurious buildx warnings
export BUILDX_NO_DEFAULT_LOAD='true'

# Focus
export DOCKER_SCOUT_SUGGEST='false'
