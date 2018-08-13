#!/bin/bash -e
# -*- compile-command: "./df-all.sh"; -*-
dfs=$(find . -name df.sh)
for i in ${dfs}; do
    pushd ${i%/*}
    ./df.sh
    popd
done
