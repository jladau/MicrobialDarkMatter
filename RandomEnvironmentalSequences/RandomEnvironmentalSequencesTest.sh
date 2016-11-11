#!/bin/bash

#loading local variables
sDir=$HOME/Documents/Research/Java/Distribution/MicrobialDarkMatter/RandomEnvironmentalSequences
sOutputPath=$sDir/test/Test.fasta
sFastaPath=$sDir/test/Bac_uncultured_atmospheric.aligned.fasta
iRandomSeed=1234

#running analysis
java -cp $sDir/bin/MicrobialDarkMatter.jar edu.ucsf.RandomEnvironmentalSequences.RandomEnvironmentalSequencesLauncher --sOutputPath=$sOutputPath --sFastaPath=$sFastaPath --iRandomSeed=$iRandomSeed

#checking for differences
echo 'Checking for differences from correct output...'
sleep 1s
diff $sDir/test/Test.fasta $sDir/test/Test.CorrectOutput.fasta
diff $sDir/test/Test.probabilities-observed.csv $sDir/test/Test.CorrectOutput.probabilities-observed.csv
diff $sDir/test/Test.probabilities-simulated.csv $sDir/test/Test.CorrectOutput.probabilities-simulated.csv
echo 'Done.'
