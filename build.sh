#!/bin/bash
set -eux
cd cgel
cd analysis
python stats.py Legal-CGEL ../../datasets/*/*.cgel > ../../STATS.md
cd ..
python -m scripts.make_index Legal-CGEL ../datasets/*/*.cgel > ../INDEX.md
python -m scripts.make_treesfile ../datasets/*/*.cgel > ../all.trees
cd ..
