#!/usr/bin/gnuplot -p

reset
fontsize = 24
set term postscript enhanced  color eps size 5.5,3.6 fontsize
set output "graphs/micro_dio_es_filters_mem.eps"
set datafile separator ";"

set style data histograms
set style histogram rowstacked title offset 0,-0.8
set style fill solid 1.0 border rgb 'black'
set boxwidth 0.5

# Y axis
set grid y
set format y '%.b '
set yrange [0:17179869184]
set ytics 0,4294967296,17179869184
set ylabel "{/:Bold {/:Italic Memory usage (GiB)}}" font "NewsGotT, 30" offset -0.6,0
set ytics font "NewsGotT, 30"

# X axis
set xrange [-0.5:5.5]
set xtics nomirror rotate by 35 right
set xtics font "NewsGotT, 30"

set bmargin 8
set lmargin 7.5
set rmargin 0.5

set key at screen 0.55, 0.04 center vertical height 1 maxrows 1 sample 2  font "NewsGotT, 30"
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 0 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 0 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8

# --------


