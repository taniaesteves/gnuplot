#!/usr/bin/gnuplot -p

reset
fontsize = 24
set term postscript enhanced color eps size 5.5,4 fontsize
set output "graphs/dio-extended/micro_sysdig_es_bs.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.7

set multiplot

# Y axis
set grid ytics
set format y '%.s'
set yrange [0:240000000]
set ytics 0,40000000,240000000
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font ", 24" offset 0.5,0

# Y2 axis
set y2tics
set format y2 '%.s'
set y2range [0:180000]
set y2tics 0,30000,180000
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font ", 24" offset -1,0

# X axis
set xrange [-0.5:6.5]
set xtics nomirror
set xlabel "{/:Bold {/:Italic Batch size (events)}}" font ", 24"


set bmargin 5.5
set lmargin 6
set rmargin 6

# -------------------------------------------------------------------

unset key

set key at screen 0.49, 0.05 center vertical height 1 width -2 maxrows 2 sample 2 font ", 24"
plot ARG1 index 0 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     161768.075 axes x1y2 with lines lw 7 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 7 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{sysdig}" axes x1y2 with linesp ls 7 lw 7 pt 6


# -------------------------------------------------------------------

set style histogram rowstacked  title offset 0,-1.2

unset ylabel
unset y2label
unset xlabel
unset y2tics
set boxwidth 0.5

set lmargin at screen 0.17  # left margin at 0.3
set rmargin at screen 0.58  # right margin at 0.7 in the screen
set bmargin at screen 0.36  # bottom margin at 0.4
set tmargin at screen 0.58  # top margin at 0.8


set object rectangle from screen 0.12,0.25 to screen 0.60,0.63 behind fillcolor rgb 'white' fillstyle solid noborder
unset key


# Y axis
set grid ytics
set format y '%.s'
set yrange[0:7000000]
set ytics 0,2000000,7000000

# X axis
set xrange [-0.7:6.7]

set xtics nomirror


plot ARG1 index 0 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1