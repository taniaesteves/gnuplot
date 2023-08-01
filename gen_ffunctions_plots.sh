#!/bin/bash

SCRIPTS_DIR="f-functions"
PLOTS_DIR="plots"
DATA_DIR="data"
GRAPHS_DIR="graphs"
OUT_DIR="pdfs"

function init {
    cd $SCRIPTS_DIR
    mkdir -p $GRAPHS_DIR
    mkdir -p $OUT_DIR
}

function latencies {
    gnuplot -c $PLOTS_DIR/plot_latencies.gp $DATA_DIR/latencies.dat;
    epstopdf $GRAPHS_DIR/ffunctions_latencies.eps $OUT_DIR/ffunctions_latencies.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/ffunctions_latencies.pdf;
    fi
}

function all {
    latencies "$1";
}

function open_all {
    open $OUT_DIR/ffunctions_latencies.pdf;
}

function open_dir {
    open $OUT_DIR
}


init
"$@"