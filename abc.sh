#!/bin/bash

inOrder=();
reverseOrder=();

for w in {a..z}
do
    inOrder+=(${w})
done

for z in {z..a}
do
    reverseOrder+=(${z})
done

echo ${inOrder[@]}
echo ${reverseOrder[@]}
