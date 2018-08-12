#!/bin/bash -e
dfs=$(find . -name df.sh)
for i in ${dfs}; do
    echo ${i}
    pushd ${i%/*}
    ./df.sh
    popd
done
