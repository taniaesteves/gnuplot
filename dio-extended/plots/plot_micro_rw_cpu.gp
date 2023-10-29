#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 8,3 fontsize
set output "graphs/micro_rw_cpu.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid 1.0 border rgb 'black'
set boxwidth 0.6

set ylabel "{/:Bold {/:Italic CPU usage (%)}}" font "NewsGotT, 22" offset 1, 0
set format y '%.s %c'
set grid ytics

# set multiplot layout 1,5 margins 0.072,0.99,0.27,0.925 spacing 0.01,0.5
set multiplot layout 1,5 margins 0.07,0.99,0.27,0.925 spacing 0.01,0.5

set yrange [0:100]
# set y2range [0:250000]

set ytics nomirror
set xtics nomirror rotate by 40 right  font "NewsGotT, 21"

set bmargin 9
# -------------------------------------------------------------------

unset key
set ytics font "NewsGotT, 22"

set rmargin 85
set xrange [-0.5:0.5]
set xlabel "{/:Bold Vanilla}" font "NewsGotT, 22" offset 0,16,1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 0 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 0 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 0 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 0 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

unset ylabel
set ytics format "" font "NewsGotT, 22"

set lmargin 12
set rmargin 65
set bmargin 9
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 1 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 1 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 1 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 1 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set xrange [-0.6:1.6]
set lmargin 32
set rmargin 54
set bmargin 9
unset key
set xlabel "{/:Bold Sysdig (File)}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 2 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 2 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 2 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 2 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 2 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set lmargin 43
set rmargin 43
set bmargin 9
set xlabel "{/:Bold Sysdig (ES)}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 3 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 3 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 3 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 3 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 3 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3


set lmargin 54
set rmargin 22
set xrange [-0.5:4.5]
set bmargin 9
set xlabel "{/:Bold DIO (File)}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 4 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 4 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 4 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 4 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 4 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3

set lmargin 75
set rmargin 1
set xrange [-0.5:4.5]
unset key
# set y2tics
# set y2label "{/:Bold {/:Italic Throughput (ops/s)}}" font "NewsGotT, 22"
set bmargin 9
set key at screen 0.55, 0.035 center vertical height 1  maxrows 1 sample 2 font "NewsGotT, 22"
set xlabel "{/:Bold DIO (ES)}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 5 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 5 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1, \
    "" index 5 u 4 ti col axes x1y1 lw 2 lt -1 fs pattern 8, \
    "" index 5 u 5 ti col axes x1y1 lw 2 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" index 5 u 6 ti col axes x1y1 lw 2 lc rgbcolor "#eeeeee" lt 1 fs pattern 3
