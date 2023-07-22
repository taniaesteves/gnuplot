#!/bin/bash

SCRIPTS_DIR="criba"
PLOTS_DIR="plots"
DATA_DIR="data"
GRAPHS_DIR="graphs"
OUT_DIR="pdfs"

function init {
    cd $SCRIPTS_DIR
    mkdir -p $GRAPHS_DIR
    mkdir -p $OUT_DIR
}

function dd {
    gnuplot -c $PLOTS_DIR/plot_histogram_criba_dataset_distribution.gp $DATA_DIR/criba-dataset-distribution.dat;
    epstopdf $GRAPHS_DIR/dataset_distribution.eps $OUT_DIR/dataset_distribution.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/dataset_distribution.pdf;
    fi
}

function de {
    gnuplot -c $PLOTS_DIR/plot_histogram_criba_dataset_extensions.gp $DATA_DIR/criba-dataset-extensions.dat;
    epstopdf $GRAPHS_DIR/dataset_extensions.eps $OUT_DIR/dataset_extensions.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/dataset_extensions.pdf;
    fi
}

function all {
    dd "$1";
    de "$1";
}

function open_all {
    open $OUT_DIR/dataset_distribution.pdf;
    open $OUT_DIR/dataset_extensions.pdf;
}

function open_dir {
    open $OUT_DIR
}

init
"$@"