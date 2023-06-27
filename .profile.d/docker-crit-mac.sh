#!/bin/sh
# Work around Docker quirks and cross-compiler toolchain gaps.
# Note that this may break minikube.
export DOCKER_DEFAULT_PLATFORM='linux/amd64'
