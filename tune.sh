#!/usr/bin/env bash

mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j20 && cd ..

DATA_SETS="wiki_ts_200M_uint64"
MAX_ERROR="1 2 4 8 16 25 32 50 60 70 80 90 100 125 150 175 200 225 250 275 300 350 400 450 500"

for DATA_SET in $DATA_SETS; do
  for ERROR in $MAX_ERROR; do
    ./build/bench_end_to_end /mnt/hgfs/SOSD/${DATA_SET} /mnt/hgfs/SOSD/${DATA_SET}_equality_lookups_10M rs $ERROR
  done;
done;
