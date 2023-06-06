#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 10,3 fontsize
set output "graphs/dio-extended/micro_rw_cpu.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid 1.0 border rgb 'black'
set boxwidth 0.6

set ylabel "{/:Bold {/:Italic CPU usage (%)}}" font ", 22"
set format y '%.s %c'
# set format y2 '%.s %c'
set grid ytics

set multiplot layout 1,5 margins 0.072,0.99,0.27,0.925 spacing 0.01,0.5

set yrange [0:100]
# set y2range [0:250000]

set ytics nomirror
set xtics nomirror rotate by 40 right

set bmargin 7.3
# -------------------------------------------------------------------

unset key

set rmargin 106
set xrange [-0.5:0.5]
set xlabel "{/:Bold Vanilla}" font ", 22" offset 0,17.5,1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 0 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 0 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 0 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 0 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

unset ylabel
set ytics format ""

set lmargin 16
set rmargin 83
set bmargin 7.3
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font ", 22" offset 0,21.8,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 1 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 1 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 1 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 1 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set xrange [-0.5:1.5]
set lmargin 39
set rmargin 70
set bmargin 7.3
unset key
set xlabel "{/:Bold Sysdig (File)}" font ", 22" offset 0,21.8,1
plot ARG1 index 2 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 2 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 2 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 2 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 2 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set lmargin 52
set rmargin 57
set bmargin 7.3
set xlabel "{/:Bold Sysdig (ES)}" font ", 22" offset 0,21.8,1
plot ARG1 index 3 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 3 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 3 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 3 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 3 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3


set lmargin 65
set rmargin 29
set xrange [-0.5:4.5]
set bmargin 7.3
set xlabel "{/:Bold DIO (File)}" font ", 22" offset 0,21.8,1
plot ARG1 index 4 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 4 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 4 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 4 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 4 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set lmargin 93
set rmargin 1
set xrange [-0.5:4.5]
unset key
# set y2tics
# set y2label "{/:Bold {/:Italic Throughput (ops/s)}}" font ", 22"
set bmargin 7.3
set key at screen 0.55, 0.035 center vertical height 1  maxrows 1 sample 2 font ", 22"
set xlabel "{/:Bold DIO (ES)}" font ", 22" offset 0,21.8,1
plot ARG1 index 5 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 5 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 5 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 5 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 5 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3
