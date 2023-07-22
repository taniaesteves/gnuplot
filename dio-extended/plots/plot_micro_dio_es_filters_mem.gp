#!/usr/bin/gnuplot -p

reset
fontsize = 22
set term postscript enhanced  color eps size 5,4 fontsize
set output "graphs/micro_dio_es_filters_mem.eps"
set datafile separator ";"

set grid y
set style data histograms
set style histogram rowstacked title offset 0,-0.8
set style fill solid 1.0 border rgb 'black'
set boxwidth 0.5


set format y '%.s %c'
set yrange [0:16]
set xrange [-0.5:4.5]
set xtics nomirror rotate by 35 right
set bmargin 6
set lmargin 8
set rmargin 1

set ylabel "{/:Bold {/:Italic Memory usage (GiB)}}" font ", 22"
set key at screen 0.55, 0.04 center vertical height 1  maxrows 1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 0 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 0 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8

# --------

