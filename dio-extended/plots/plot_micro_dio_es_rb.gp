#!/usr/bin/gnuplot -p

reset
fontsize = 24
set term postscript enhanced color eps size  5.5,4  fontsize
set output "graphs/micro_dio_es_rb.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.7

# Y axis
set grid ytics
set ytics nomirror
set format y '%.s'
set yrange [0:240000000]
set ytics 0,40000000,240000000
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font ", 28" offset 0, 0
set ytics font ", 30"

# Y2 axis
set y2tics
set grid y2tics
set format y2 '%.s'
set y2range [0:180000]
set y2tics 0,30000,180000
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font ", 28" offset -0.5,0
set y2tics font ", 30"

# X axis
set xtics nomirror
set xrange [-0.5:5.5]
set format x "\n"     # xtic label empty line
set linetype 1 lc "black"
set linetype 2 lc rgb "#0078b1"
set xlabel "{/:Bold {/:Italic RingBuffer size (MiB)}}" font ", 28" offset 0,0.9,0

set bmargin 6
set lmargin 6.5
set rmargin 6.5

# -------------------------------------------------------------------
set key at screen 0.5, 0.06 center vertical height 1 width -5 maxrows 2 sample 2 font ", 27"
plot ARG1 using ($34-$16) ti "events_{complete}" lc rgbcolor "black" lw 2, \
     ARG1 using 16 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1,\
     ARG1 using 22 ti "events_{lost}" lt -1 lw 2 fs pattern 8, \
     163842 axes x1y2 with lines lw 7 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 7 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{DIO}" axes x1y2 with linesp ls 7 lw 7 pt 6, \
     ARG1 u 1:(0):3:2 w labels font ", 30" tc var offset 0,-1 notitle

