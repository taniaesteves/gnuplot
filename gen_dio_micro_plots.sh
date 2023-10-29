#!/bin/bash

SCRIPTS_DIR="dio-extended"
PLOTS_DIR="plots"
DATA_DIR="data"
GRAPHS_DIR="graphs"
OUT_DIR="pdfs"

function init {
    cd $SCRIPTS_DIR
    mkdir -p $GRAPHS_DIR
    mkdir -p $OUT_DIR
}

function rw {
    gnuplot -c $PLOTS_DIR/plot_micro_rw.gp $DATA_DIR/micro_rw.dat;
    epstopdf $GRAPHS_DIR/micro_rw.eps $OUT_DIR/micro_rw.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_cpu.gp $DATA_DIR/micro_rw_cpu.dat;
    epstopdf $GRAPHS_DIR/micro_rw_cpu.eps $OUT_DIR/micro_rw_cpu.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_mem.gp $DATA_DIR/micro_rw_mem.dat;
    epstopdf $GRAPHS_DIR/micro_rw_mem.eps $OUT_DIR/micro_rw_mem.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_net.gp $DATA_DIR/micro_rw_net.dat;
    epstopdf $GRAPHS_DIR/micro_rw_net.eps $OUT_DIR/micro_rw_net.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_disk.gp $DATA_DIR/micro_rw_disk.dat;
    epstopdf $GRAPHS_DIR/micro_rw_disk.eps $OUT_DIR/micro_rw_disk.pdf;

    gnuplot -c $PLOTS_DIR/plot_micro_rw_es_size.gp $DATA_DIR/micro_rw_es_size.dat;
    epstopdf $GRAPHS_DIR/micro_rw_es_size.eps $OUT_DIR/micro_rw_es_size.pdf;

    if [ "$1" == "open" ]; then
        # open $OUT_DIR/micro_rw.pdf;
        # open $OUT_DIR/micro_rw_cpu.pdf;
        # open $OUT_DIR/micro_rw_mem.pdf;
        open $OUT_DIR/micro_rw_net.pdf;
        # open $OUT_DIR/micro_rw_disk.pdf;
        # open $OUT_DIR/micro_rw_es_size.pdf;
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

function sysdig_extra {
    gnuplot -c $PLOTS_DIR/plot_micro_sysdig_extra.gp $DATA_DIR/micro_sysdig_extra.dat;
    epstopdf $GRAPHS_DIR/micro_sysdig_extra.eps $OUT_DIR/micro_sysdig_extra.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_sysdig_extra.pdf
    fi
}

function times {
    gnuplot -c $PLOTS_DIR/plot_micro_times.gp $DATA_DIR/micro_times.dat;
    epstopdf $GRAPHS_DIR/micro_times.eps $OUT_DIR/micro_times.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/micro_times.pdf
    fi
}

function use_cases {
    gnuplot -c $PLOTS_DIR/plot_use_cases_times.gp $DATA_DIR/use_cases_times.dat;
    epstopdf $GRAPHS_DIR/use_cases_times.eps $OUT_DIR/use_cases_times.pdf;

    if [ "$1" == "open" ]; then
        open $OUT_DIR/use_cases_times.pdf
    fi
}


function all {
    rw "$1";
    bs_sysdig "$1";
    bs_dio "$1";
    rb "$1";
    filters "$1";
    rt "$1";
    times "$1";
    use_cases "$1";
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


init
"$@"