#!/bin/bash -e
# -*- compile-command: "./df.sh"; -*-
# For filter-pub-test.go, see gist:
#   https://gist.github.com/gmlewis/ae8ea80a2e99811a9daca8b2a9ed9d87
dartfmt -w . && dartanalyzer . && pub run test | filter-pub-test
