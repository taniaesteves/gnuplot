#!/usr/bin/gnuplot -p

reset
fontsize = 12
set term postscript enhanced eps size 10,3.5 fontsize
set output "graphs/catbpf_profiling_event_stats.eps"
set datafile separator ";"


set style data histogram
set style histogram rowstacked
box_wd = 0.3
set boxwidth box_wd
set style fill solid
set key  outside right box
set xtics rotate by -45

set title "CatBPF event stats" font ", 16"

set ylabel "# Events"
# set xlabel "Setup"

set format y '%.s %c'

set style line 2 lc rgb 'black' lt 1 lw 1
set style line 2 lc rgb "#EDEBE4" lt 1 lw 2
set style line 3 lc rgb "#A7ABA6" lt 1 lw 2


plot 'data/catbpf_event_stats.dat' using (($2)):xtic(1) ti "calls" lw 1  lt -1 fs pattern 8, \
     '' using 0:($2):3 with errorbars notitle lw 2 lt -1, \
     newhistogram at box_wd, \
     'data/catbpf_event_stats.dat' using (($4)) ti "returned" lw 1 lt -1 fs pattern 2, \
     '' using (($6)) ti "discarded" lw 1 lt -1 fs pattern 5, \
     '' using (($8)) ti "lost"  lw 1  lt -1 fs pattern 9, \
     '' using ($0+box_wd):($4):5 with errorbars notitle lw 2 lt -1, \
     '' using ($0+box_wd):($4+$6):7 with errorbars notitle lw 2 lt -1, \
     '' using ($0+box_wd):($4+$6+$8):9 with errorbars notitle lw 2 lt -1