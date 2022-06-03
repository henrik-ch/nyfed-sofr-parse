#!/bin/bash -e

file=sofr.json
suffix=json

mkdir -p unpacked

git log --format=format:'%H %aI' $file | while read line
do
    values=( $line )
    sha=${values[0]}
    date=${values[1]}
    git show $sha:$file > unpacked/$date.$suffix
done