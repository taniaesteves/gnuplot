#!/bin/bash

PLOTS_DIR="plots/dio-extended"
DATA_DIR="data/dio-extended"
GRAPHS_DIR="graphs/dio-extended"
OUT_DIR="pdfs/dio-extended"

mkdir -p $OUT_DIR

function rw {
    gnuplot -c $PLOTS_DIR/plot_micro_rw.gp $DATA_DIR/micro_rw.dat;
    epstopdf $GRAPHS_DIR/micro_rw.eps $OUT_DIR/micro_rw.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_cpu.gp $DATA_DIR/micro_rw_cpu.dat;
    epstopdf $GRAPHS_DIR/micro_rw_cpu.eps $OUT_DIR/micro_rw_cpu.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_mem.gp $DATA_DIR/micro_rw_mem.dat;
    epstopdf $GRAPHS_DIR/micro_rw_mem.eps $OUT_DIR/micro_rw_mem.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_rw.pdf;
        open $OUT_DIR/micro_rw_cpu.pdf;
        open $OUT_DIR/micro_rw_mem.pdf;
    fi


}

function bs_sysdig {
    gnuplot -c $PLOTS_DIR/plot_micro_sysdig_es_bs.gp $DATA_DIR/micro_sysdig_es_bs.dat ;
    epstopdf $GRAPHS_DIR/micro_sysdig_es_bs.eps $OUT_DIR/micro_sysdig_es_bs.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_sysdig_es_bs_cpu.gp  $DATA_DIR/micro_sysdig_es_bs_cpu.dat ;
    epstopdf $GRAPHS_DIR/micro_sysdig_es_bs_cpu.eps $OUT_DIR/micro_sysdig_es_bs_cpu.pdf ;

    gnuplot -c $PLOTS_DIR/plot_micro_sysdig_es_bs_mem.gp  $DATA_DIR/micro_sysdig_es_bs_mem.dat;
    epstopdf $GRAPHS_DIR/micro_sysdig_es_bs_mem.eps $OUT_DIR/micro_sysdig_es_bs_mem.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_sysdig_es_bs.pdf
        open $OUT_DIR/micro_sysdig_es_bs_cpu.pdf
        open $OUT_DIR/micro_sysdig_es_bs_mem.pdf
    fi
}

function bs_dio {
    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_bs.gp $DATA_DIR/micro_dio_es_bs.dat ;
    epstopdf $GRAPHS_DIR/micro_dio_es_bs.eps $OUT_DIR/micro_dio_es_bs.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_bs_cpu.gp  $DATA_DIR/micro_dio_es_bs_cpu.dat ;
    epstopdf $GRAPHS_DIR/micro_dio_es_bs_cpu.eps $OUT_DIR/micro_dio_es_bs_cpu.pdf ;

    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_bs_mem.gp  $DATA_DIR/micro_dio_es_bs_mem.dat;
    epstopdf $GRAPHS_DIR/micro_dio_es_bs_mem.eps $OUT_DIR/micro_dio_es_bs_mem.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_dio_es_bs.pdf
        open $OUT_DIR/micro_dio_es_bs_cpu.pdf
        open $OUT_DIR/micro_dio_es_bs_mem.pdf
    fi
}

function rb {
    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_rb.gp $DATA_DIR/micro_dio_es_rb.dat;
    epstopdf $GRAPHS_DIR/micro_dio_es_rb.eps $OUT_DIR/micro_dio_es_rb.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_rb_cpu.gp  $DATA_DIR/micro_dio_es_rb_cpu.dat ;
    epstopdf $GRAPHS_DIR/micro_dio_es_rb_cpu.eps $OUT_DIR/micro_dio_es_rb_cpu.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_rb_mem.gp $DATA_DIR/micro_dio_es_rb_mem.dat;
    epstopdf $GRAPHS_DIR/micro_dio_es_rb_mem.eps $OUT_DIR/micro_dio_es_rb_mem.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_dio_es_rb.pdf
        open $OUT_DIR/micro_dio_es_rb_cpu.pdf
        open $OUT_DIR/micro_dio_es_rb_mem.pdf
    fi

}

function filters {
    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_filters.gp $DATA_DIR/micro_dio_es_filters.dat;
    epstopdf $GRAPHS_DIR/micro_dio_es_filters.eps $OUT_DIR/micro_dio_es_filters.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_filters_cpu.gp $DATA_DIR/micro_dio_es_filters_cpu.dat ;
    epstopdf $GRAPHS_DIR/micro_dio_es_filters_cpu.eps $OUT_DIR/micro_dio_es_filters_cpu.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_filters_mem.gp  $DATA_DIR/micro_dio_es_filters_mem.dat;
    epstopdf $GRAPHS_DIR/micro_dio_es_filters_mem.eps $OUT_DIR/micro_dio_es_filters_mem.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_dio_es_filters.pdf
        open $OUT_DIR/micro_dio_es_filters_cpu.pdf
        open $OUT_DIR/micro_dio_es_filters_mem.pdf
    fi
}

function rt {
    gnuplot -c $PLOTS_DIR/plot_micro_dio_es_rt.gp $DATA_DIR/micro_dio_es_rt.dat;
    epstopdf $GRAPHS_DIR/micro_dio_es_rt.eps $OUT_DIR/micro_dio_es_rt.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_dio_es_rt.pdf
    fi
}

function all {
    rw "$1";
    bs_sysdig "$1";
    bs_dio "$1";
    rb "$1";
    filters "$1";
    rt "$1";

}

function open_all {
    open $OUT_DIR/micro_rw.pdf;
    open $OUT_DIR/micro_rw_cpu.pdf;
    open $OUT_DIR/micro_rw_mem.pdf;

    open $OUT_DIR/micro_sysdig_es_bs.pdf
    open $OUT_DIR/micro_sysdig_es_bs_cpu.pdf
    open $OUT_DIR/micro_sysdig_es_bs_mem.pdf

    open $OUT_DIR/micro_dio_es_bs.pdf
    open $OUT_DIR/micro_dio_es_bs_cpu.pdf
    open $OUT_DIR/micro_dio_es_bs_mem.pdf

    open $OUT_DIR/micro_dio_es_rb.pdf
    open $OUT_DIR/micro_dio_es_rb_cpu.pdf
    open $OUT_DIR/micro_dio_es_rb_mem.pdf

    open $OUT_DIR/micro_dio_es_filters.pdf
    open $OUT_DIR/micro_dio_es_filters_cpu.pdf
    open $OUT_DIR/micro_dio_es_filters_mem.pdf

    open $OUT_DIR/micro_dio_es_rt.pdf
}

function open_dir {
    open $OUT_DIR
}


"$@"