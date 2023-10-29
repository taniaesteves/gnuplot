#!/bin/bash

SCRIPTS_DIR="cat"
PLOTS_DIR="plots"
DATA_DIR="data"
GRAPHS_DIR="graphs"
OUT_DIR="pdfs"

function init {
    cd $SCRIPTS_DIR
    mkdir -p $GRAPHS_DIR
    mkdir -p $OUT_DIR
}

function bdb_times {
    gnuplot -c $PLOTS_DIR/plot_bdb_times.gp $DATA_DIR/bdb-times.dat;
    epstopdf $GRAPHS_DIR/bdb_times.eps $OUT_DIR/bdb_times.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/bdb_times.pdf;
    fi
}

function all {
    bdb_times "$1";
}

function open_all {
    open $OUT_DIR/bdb_times.pdf;
}

function open_dir {
    open $OUT_DIR
}

init
"$@"