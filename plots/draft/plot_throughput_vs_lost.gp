#!/usr/bin/gnuplot -p

reset
fontsize = 16
set term postscript enhanced  color eps size 8,4 fontsize
set output "graphs/dio_rate_limiting.eps"
set datafile separator ";"

set grid y
set style data histogram
set style histogram rowstacked
set style fill pattern border
set boxwidth 0.5


set format y '%.s %c'
set yrange [0:100]

set y2tics
set format y2 '%.s %c'
set y2range [0:100]

set key outside top center horizontal width 0.5

set ylabel "CPU usage (%)"
set y2label "Lost rate (%)"
set xlabel "Throughput (operations per second)" font "Helvetica, fontsize"
plot ARG1 using 3:xtic(1) ti col axes x1y1 lc rgbcolor "#333333" lt 1 fs pattern 3, \
    "" using 4 ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
    "" using 5 ti col axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
    "" using 6 ti col axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
    "" using 7 ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
    "" using 2 ti col axes x1y2 with lines lw 4 lt rgb "#145DA0"