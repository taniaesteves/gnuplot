#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced  color eps size 8,3 fontsize
set output "graphs/dio_dstat_cpu.eps"
set datafile separator ";"

set grid y
set style data histograms
set style histogram rowstacked title offset 0,-0.8
set style fill solid
set boxwidth 0.5


set format y '%.s %c'
set yrange [0:100]

# set y2tics
# set format y2 '%.s %c'
# set y2range [0:100]

set bmargin 3

set multiplot layout 1,4 margins 0.1,0.99,0.35,0.90 spacing 0.01,0.5
set xtics nomirror
set xtics rotate by 35 right

set ylabel "CPU usage (%)"
unset key
# set xrange [-0.5:0.5]
set xlabel "{/:Bold vanilla}" font ", 22" offset 0,17,1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 0 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 0 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 0 u 5 ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 0 u 6 ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

# set xrange [-1:5]
unset ylabel
set ytics format ""
set xlabel "{/:Bold nopWriter}" font ", 22" offset 0,21.5,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 1 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 1 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 1 u 5 ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 1 u 6 ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set xlabel "{/:Bold fileWriter}" font ", 22" offset 0,21.5,1
plot ARG1 index 2 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 2 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 2 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 2 u 5 ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 2 u 6 ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set key at screen 0.5, 0.03 center vertical height 1  maxrows 1
set xlabel "{/:Bold elasticsearchWriter}" font ", 22" offset 0,21.5,1
plot ARG1 index 3 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 3 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 3 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 3 u 5 ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 3 u 6 ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

