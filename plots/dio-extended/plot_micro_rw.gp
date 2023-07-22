#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 10,3 fontsize
set output "graphs/dio-extended/micro_rw.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.6

set multiplot layout 1,5 margins 0.05,1,0.27,0.925 spacing 0.01,0.5

# Y axis
set grid ytics
set format y '%.s'
set yrange [0:240000000]
set ytics 0,40000000,240000000
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font ", 22" offset 0.5,0

# Y2 axis
set format y2 '%.s'
set y2range [0:180000]
set y2tics 0,30000,180000


# X axis
set xtics nomirror rotate by 40 right

set bmargin 7.3
# -------------------------------------------------------------------

unset key
unset y2label
set y2tics format ""

set rmargin 90
set bmargin 7.3
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font ", 22" offset 0,21.8,1
plot ARG1 index 0 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6

unset ylabel
set ytics format ""

set xrange [-0.5:1.5]
set lmargin 31
set rmargin 77
set bmargin 7.3
unset key
set xlabel "{/:Bold Sysdig (File)}" font ", 22" offset 0,21.8,1
plot ARG1 index 2 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 2 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 3 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6

set lmargin 44
set rmargin 64
set bmargin 7.3
set xlabel "{/:Bold Sysdig (ES)}" font ", 22" offset 0,21.8,1
plot ARG1 index 4 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 4 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 5 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6




set lmargin 57
set rmargin 35
set xrange [-0.5:4.5]
set bmargin 7.3
set xlabel "{/:Bold DIO (File)}" font ", 22" offset 0,21.8,1
plot ARG1 index 6 using ($32-$14):xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 6 using 14 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1,\
     ARG1 index 6 using 20 ti "events_{lost}" lt -1 lw 2 fs pattern 8, \
     161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 7 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6


set lmargin 86
set rmargin 6
set xrange [-0.5:4.5]

# Y2 axis
set y2tics
set format y2 '%.s'
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font ", 22" offset -1,0

set key at screen 0.45, 0.035 center vertical height 1  maxrows 1 sample 2 font ", 22"

set bmargin 7.3
set xlabel "{/:Bold DIO (ES)}" font ", 22" offset 0,21.8,1
plot ARG1 index 8 using ($32-$14):xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 8 using 14 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1,\
     ARG1 index 8 using 20 ti "events_{lost}" lt -1 lw 2 fs pattern 8, \
     161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 9 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6











