#!/bin/sh 
mkdir results_f log harvester
mkdir k1
mkdir k2
mkdir k3
mkdir k4
mkdir k5
mkdir k6
mkdir k7
mkdir k8
mkdir k9
mkdir k10

cd log
mkdir k1
mkdir k2
mkdir k3
mkdir k4
mkdir k5
mkdir k6
mkdir k7
mkdir k8
mkdir k9
mkdir k10

cd ..

cat structureCommands | parallel -j 100%

mv k1 k2 k3 k4 k5 k6 k7 k8 k9 k10  results_f/
mkdir harvester_input
cp results_f/k*/*_f harvester_input
echo 'Your structure run has finished.'
# Run structureHarvester
./structureHarvester.py --dir harvester_input --out harvester --evanno --clumpp
echo 'structureHarvester run has finished.'
#Clean up harvester input files.
zip populations07-p14-m5-maf05_Harvester_Upload.zip harvester_input/*
mv populations07-p14-m5-maf05_Harvester_Upload.zip harvester/
rm -rf harvester_input
