#!/usr/bin/gnuplot -p

reset
fontsize = 12
set term postscript enhanced eps size 10,4 fontsize
set output "graphs/catbpf_profiling_rates.eps"
set datafile separator ";"


set style data histogram
set style histogram cluster gap 1
set style fill solid
set xtics rotate by -45


set ylabel "Rate (MB/s)"
# set xlabel "Setup"

set format y '%.s %c'

set style line 2 lc rgb 'black' lt 1 lw 1
set style line 2 lc rgb "#EDEBE4" lt 1 lw 2
set style line 3 lc rgb "#A7ABA6" lt 1 lw 2


set multiplot layout 1,3  margins 0.05,0.96,0.17,0.90 spacing 0,0
set yrange[0:22]


unset key

set title "Call Rate" font ", 16"
plot 'data/dio_bpf_rates.dat' index 0 using 2:xtic(1) title col  lt -1 fs pattern 2, \
        '' index 0 using 4:xtic(1) title col  lt -1 fs pattern 4,\
        '' index 0 using 6:xtic(1) title col  lt -1 fs pattern 7,\
        '' index 0 using ($0-1.25):($2):3 with errorbars notitle lw 2 lt -1, \
        '' index 0 using ($0-1):($4):5 with errorbars notitle lw 2 lt -1, \
        '' index 0 using ($0-0.75):($6):7 with errorbars notitle lw 2 lt -1

unset ylabel
unset ytics
set title "Submittion Rate" font ", 16"
plot 'data/dio_bpf_rates.dat' index 1 using 2:xtic(1) title col  lt -1 fs pattern 2, \
        '' index 1 using 4:xtic(1) title col  lt -1 fs pattern 4,\
        '' index 1 using 6:xtic(1) title col  lt -1 fs pattern 7,\
        '' index 1 using ($0-1.25):($2):3 with errorbars notitle lw 2 lt -1, \
        '' index 1 using ($0-1):($4):5 with errorbars notitle lw 2 lt -1, \
        '' index 1 using ($0-0.75):($6):7 with errorbars notitle lw 2 lt -1

set key  right box
set title "Lost Rate" font ", 16"
plot 'data/dio_bpf_rates.dat' index 2 using 2:xtic(1) title col  lt -1 fs pattern 2, \
        '' index 2 using 4:xtic(1) title col  lt -1 fs pattern 4,\
        '' index 2 using 6:xtic(1) title col  lt -1 fs pattern 7,\
        '' index 2 using ($0-1.25):($2):3 with errorbars notitle lw 2 lt -1, \
        '' index 2 using ($0-1):($4):5 with errorbars notitle lw 2 lt -1, \
        '' index 2 using ($0-0.75):($6):7 with errorbars notitle lw 2 lt -1
