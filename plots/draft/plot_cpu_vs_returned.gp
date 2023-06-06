#!/usr/bin/gnuplot -p

reset
fontsize = 16
set term postscript enhanced  color eps size 8,3 fontsize
set output "graphs/dio_cpu_vs_returned.eps"
set datafile separator ";"

set grid y
set style data histograms
set style histogram rowstacked title offset 0,-0.8
set style fill pattern border
set boxwidth 0.5


set format y '%.s %c'
set yrange [0:100]

set y2tics
set format y2 '%.s %c'
set y2range [0:100]

set bmargin 3


set key outside top center horizontal width 0.5

set ylabel "CPU usage (%)"
set y2label "Returned rate (%)"
plot newhistogram "raw", \
        ARG1 index 0 u 3:xtic(1) ti col axes x1y1 lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 0 u 4 ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 0 u 5 ti col axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 0 u 6 ti col axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 0 u 7 ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 0 u 2 ti col axes x1y2 with linesp pt 7 lw 4 lt rgb "#145DA0", \
    newhistogram "detailed", \
        ARG1 index 1 u 3:xtic(1) notitle axes x1y1 lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 1 u 4 notitle axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 1 u 5 notitle axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 1 u 6 notitle axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 1 u 7 notitle axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3,\
        "" index 1 u ($0+4):2 notitle axes x1y2 with linesp pt 7 lw 4 lt rgb "#145DA0", \
    newhistogram "detailed\\\_all", \
        ARG1 index 2 u 3:xtic(1) notitle axes x1y1 lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 2 u 4 notitle axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 2 u 5 notitle axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 2 u 6 notitle axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 2 u 7 notitle axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 2 u ($0+9):2 notitle axes x1y2 with linesp pt 7 lw 4 lt rgb "#145DA0",\
 97
