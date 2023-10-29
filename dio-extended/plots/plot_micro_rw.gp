#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 8,3 fontsize
set output "graphs/micro_rw.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.6

set multiplot layout 1,5 margins 0.068,1,0.27,0.925 spacing 0.01,0.5

# Y axis
set grid ytics
set format y '%.s'
set yrange [0:240000000]
set ytics 0,40000000,240000000
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font "NewsGotT, 22" offset 0.2,-1

# Y2 axis
set format y2 '%.s'
set y2range [0:180000]
set y2tics 0,30000,180000


# X axis
set xtics nomirror rotate by 40 right font "NewsGotT, 21"

set bmargin 10
# -------------------------------------------------------------------

unset key
unset y2label
set y2tics format "" font "NewsGotT, 22"
set ytics font "NewsGotT, 22"

set rmargin 71
set bmargin 10
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font "NewsGotT, 22" offset 0,19.3,1
plot ARG1 index 0 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     163842 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 4 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6

unset ylabel
set ytics format "" font "NewsGotT, 22"

set xrange [-0.5:1.5]
set lmargin 26
set rmargin 59
set bmargin 10
unset key
set xlabel "{/:Bold Sysdig (File)}" font "NewsGotT, 22" offset 0,19.3,1
plot ARG1 index 2 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 2 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     163842 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 4 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 3 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6

set lmargin 38
set rmargin 47
set bmargin 10
set xlabel "{/:Bold Sysdig (ES)}" font "NewsGotT, 22" offset 0,19.3,1
plot ARG1 index 4 using 2:xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 4 using 3 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     163842 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 4 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 5 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6




set lmargin 50
set rmargin 27
set xrange [-0.5:4.5]
set bmargin 10
set xlabel "{/:Bold DIO (File)}" font "NewsGotT, 22" offset 0,19.3,1
plot ARG1 index 6 using ($32-$14):xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 6 using 14 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1,\
     ARG1 index 6 using 20 ti "events_{lost}" lt -1 lw 2 fs pattern 8, \
     163842 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 4 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 7 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6


set lmargin 70
set rmargin 6.8
set xrange [-0.5:4.5]

# Y2 axis
set y2tics font "NewsGotT, 22"
set format y2 '%.s'
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font "NewsGotT, 22" offset -0.5,0

set key at screen 0.5, 0.06 center vertical height 0.5  maxrows 2 sample 1.5 font "NewsGotT, 21"

set bmargin 10
set xlabel "{/:Bold DIO (ES)}" font "NewsGotT, 22" offset 0,19.3,1
plot ARG1 index 8 using ($32-$14):xtic(1) ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 8 using 14 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1,\
     ARG1 index 8 using 20 ti "events_{lost}" lt -1 lw 2 fs pattern 8, \
     163842 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 4 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 9 u 2 ti "throughput_{tracer}" axes x1y2 with linesp ls 7 lw 4 pt 6











