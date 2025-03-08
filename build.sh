#!/bin/bash
set -eux
cd cgel
cd analysis
python stats.py ../../datasets/*/*.cgel > ../../STATS.md
cd ..
python -m scripts.make_index ../datasets/*/*.cgel > ../INDEX.md
python -m scripts.make_treesfile ../datasets/*/*.cgel > ../all.trees
cd ..
