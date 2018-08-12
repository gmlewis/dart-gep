#!/bin/bash -ex
dartfmt -w . && dartanalyzer . && pub run test
