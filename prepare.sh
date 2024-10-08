#! /usr/bin/env bash
set -e

function generate_lookups() {
    echo "Generating lookups for $1"
    [ -f /mnt/hgfs/SOSD/$1_equality_lookups_10M ] || ./generate /mnt/hgfs/SOSD/$1 10000000
    [ -f /mnt/hgfs/SOSD/$1_equality_lookups_1M ] || ./generate /mnt/hgfs/SOSD/$1 1000000
}

echo "Generating queries..."

generate_lookups wiki_ts_200M_uint64

generate_lookups books_200M_uint32

generate_lookups fb_200M_uint64

generate_lookups osm_cellids_800M_uint64

generate_lookups books_800M_uint64

