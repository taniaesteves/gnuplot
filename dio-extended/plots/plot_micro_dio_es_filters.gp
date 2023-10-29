#!/usr/bin/gnuplot -p

reset
fontsize = 24
set term postscript enhanced color eps size 8,3.6 fontsize
set output "graphs/micro_dio_es_filters.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.5

# Y axis
set grid ytics
set ytics nomirror
set format y '%.s'
set yrange [0:240000000]
set ytics 0,40000000,240000000
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font "NewsGotT, 30" offset -1.5, -2.5
set ytics font "NewsGotT, 30"

# Y2 axis
set y2tics
set grid y2tics
set format y2 '%.s'
set y2range [0:180000]
set y2tics 0,30000,180000
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font "NewsGotT, 30" offset 1, -1
set y2tics font "NewsGotT, 30"

# X axis
set xtics nomirror  rotate by 35 right
set xrange [-1:5]
set xtics font "NewsGotT, 30"

set bmargin 10
set lmargin 9
set rmargin 9
# -------------------------------------------------------------------

set key at screen 0.5, 0.07 center vertical height 0.8 maxrows 2 sample 2 font "NewsGotT, 30"
plot ARG1 index 0 using ($32-$14):xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 14 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1,\
     ARG1 index 0 using 20 ti "events_{lost}" lt -1 lw 2 fs pattern 8, \
     161768.075 axes x1y2 with lines lw 6 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 6 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{DIO}" axes x1y2 with linesp ls 7 lw 6 pt 6
