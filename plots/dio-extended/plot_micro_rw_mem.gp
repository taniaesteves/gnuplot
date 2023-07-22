#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 10,3 fontsize
set output "graphs/dio-extended/micro_rw_mem.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set style fill solid 1.0 border rgb 'black'
set boxwidth 0.6

set ylabel "{/:Bold {/:Italic Memory usage (GiB)}}" font ", 22" offset -0.5,0
# set format y '%.s %c'
set format y "%.b"
set grid ytics

set multiplot layout 1,5 margins 0.05,0.99,0.27,0.925 spacing 0.01,0.5

# set yrange [0:16]
set yrange [0:17179869184]
set ytics 0,4294967296,17179869184
# set y2range [0:250000]

set ytics nomirror
set xtics nomirror rotate by 40 right

set bmargin 7.3
# -------------------------------------------------------------------

unset key

set rmargin 108
set xrange [-0.5:0.5]
set xlabel "{/:Bold Vanilla}" font ", 22" offset 0,17.5,1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 0 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 0 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8

unset ylabel
set ytics format ""

set lmargin 13
set rmargin 85
set bmargin 7.3
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font ", 22" offset 0,21.8,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 1 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 1 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8

set xrange [-0.5:1.5]
set lmargin 36
set rmargin 72
set bmargin 7.3
unset key
set xlabel "{/:Bold Sysdig (File)}" font ", 22" offset 0,21.8,1
plot ARG1 index 2 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 2 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 2 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8

set lmargin 49
set rmargin 59
set bmargin 7.3
set xlabel "{/:Bold Sysdig (ES)}" font ", 22" offset 0,21.8,1
plot ARG1 index 3 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 3 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 3 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8


set lmargin 62
set rmargin 30
set xrange [-0.5:4.5]
set bmargin 7.3
set xlabel "{/:Bold DIO (File)}" font ", 22" offset 0,21.8,1
plot ARG1 index 4 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 4 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 4 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8

set lmargin 91
set rmargin 1
set xrange [-0.5:4.5]
unset key
# set y2tics
# set y2label "{/:Bold {/:Italic Throughput (ops/s)}}" font ", 22"
set bmargin 7.3
set key at screen 0.55, 0.035 center vertical height 1  maxrows 1 sample 2 font ", 22"
set xlabel "{/:Bold DIO (ES)}" font ", 22" offset 0,21.8,1
plot ARG1 index 5 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 5 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 5 u 5 ti col axes x1y1 lw 2 lt -1 fs pattern 8
