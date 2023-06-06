#!/usr/bin/gnuplot -p

reset
fontsize = 16
set term postscript enhanced  color eps size 8,4 fontsize
set output "graphs/dio_stats_filters.eps"
set datafile separator ";"

set grid y
set style data histogram
set style histogram cluster errorbars
set style fill pattern border
set boxwidth 1


set format y '%.s %c'
# set yrange [0:100]

# set y2tics
# set format y2 '%.s %c'
# set y2range [0:100]

set key outside top center horizontal width 0.5

# set ylabel "CPU usage (%)"
# set y2label "Lost rate (%)"
# set xlabel "Throughput (operations per second)" font "Helvetica, fontsize"
# plot "data/dio_stats_filters.dat" using 2:3:xtic(1) ti col lc rgbcolor "#333333" lt 1 fs pattern 3, \
#     "" using 4:5 ti col lc rgbcolor "#555555" lt 1 fs pattern 3, \
#     "" using 6:7 ti col lc rgbcolor "#555555" lt 1 fs pattern 3, \
#     "" using 8:9 ti col lc rgbcolor "#555555" lt 1 fs pattern 3, \
#     "" using 10:11 ti col lc rgbcolor "#555555" lt 1 fs pattern 3

plot "data/dio_stats_filters.dat" using 2:3:xtic(1) notitle lc rgbcolor "#333333" lt 1 fs pattern 3, \
    161995.946 lw 4 ti "vanilla", \
    148939.476 lw 4 lt rgb "#145DA0"  ti "detailed"