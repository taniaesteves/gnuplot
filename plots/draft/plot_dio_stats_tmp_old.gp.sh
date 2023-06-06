#!/usr/bin/gnuplot -p

reset
fontsize = 18
set term postscript enhanced color eps size 8,3 fontsize
set output "graphs/dio_filters.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.5

set ylabel "{/:Bold {/:Italic Number of events}}" font ", 22"
set format y '%.s %c'
set format y2 '%.s %c'
set grid ytics

set multiplot layout 1,2 margins 0.09,0.91,0.32,0.97 spacing 0.01,0.5

set xrange [-0.5:4.5]
set yrange [0:270000000]
set y2range [0:270000]

set ytics nomirror
set xtics nomirror rotate by 45 right

# -------------------------------------------------------------------

unset key
set xlabel "{/:Bold {/:Italic (a) } detailed setup with elasticSearchWriter}" font ", 22" offset 0,1,1
plot 161756 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     ARG1 using ($32-$14):xtic(1) ti "#savedComplete" lc rgb "#444444",\
     ARG1 using 14 ti "#savedIncomplete" lt -1 fs pattern 2,\
     ARG1 using 20 ti "#lost" lt -1 fs pattern 8, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "vanilla", \
     ARG1 index 1 u 2 ti "detailed" axes x1y2 with linesp pt 6 lw 4 lt rgb "#003366"


unset ylabel
set ytics format ""
set y2tics
set y2label "{/:Bold {/:Italic Throughput (ops/s)}}" font ", 22"

set xlabel "{/:Bold {/:Italic (b) } detailed setup with fileWriter}" font ", 22" offset 0,1,1
set key vertical maxrows 3 width -4 sample 2
plot 161756 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     ARG2 using ($32-$14):xtic(1) ti "#savedComplete" lc rgb "#444444",\
     ARG2 using 14 ti "#savedIncomplete" lt -1 fs pattern 2,\
     ARG2 using 20 ti "#lost" lt -1 fs pattern 8, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "vanilla", \
     ARG2 index 1 u 2 ti "detailed" axes x1y2 with linesp pt 6 lw 4 lt rgb "#003366"