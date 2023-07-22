#!/usr/bin/gnuplot -p

reset
fontsize = 22
set term postscript enhanced color eps size 5.5,4 fontsize
set output "graphs/micro_sysdig_extra.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.7

set ylabel "{/:Bold {/:Italic Number of events}}" font ", 22"
set format y '%.s %c'
set format y2 '%.s %c'
set grid ytics


set xrange [-0.5:2.5]
set yrange [0:250000000]
set y2range [0:250000]

set ytics nomirror
set xtics nomirror

set bmargin 6
set lmargin 8.5
set rmargin 9
# -------------------------------------------------------------------

unset key
set y2tics
set y2label "{/:Bold {/:Italic Throughput (ops/s)}}" font ", 22"
set xlabel "{/:Bold {/:Italic Batch size (events)}}" font ", 22"

set key at screen 0.49, 0.05 center vertical height 1 width -2 maxrows 2 sample 2 font ", 22"
plot ARG1 index 0 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     161768.075 axes x1y2 with lines lw 7 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 7 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{sysdig}" axes x1y2 with linesp ls 7 lw 7 pt 6
