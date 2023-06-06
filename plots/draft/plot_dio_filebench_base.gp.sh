#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 10,3 fontsize
set output "graphs/dio_filebench_base.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.5

set ylabel "{/:Bold {/:Italic Number of events}}" font ", 22"
set format y '%.s %c'
set format y2 '%.s %c'
set grid ytics

set multiplot layout 1,3 margins 0.072,0.92,0.35,0.91 spacing 0.01,0.5

set xrange [-0.5:4.5]
set yrange [0:250000000]
set y2range [0:250000]

set ytics nomirror
set xtics nomirror rotate by 30 right

# -------------------------------------------------------------------

unset key
set xlabel "{/:Bold nopWriter}" font ", 22" offset 0,20.5,1
plot 161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     ARG1 using ($32-$14):xtic(1) ti "#savedComp." lc rgbcolor "black" lw 2,\
     ARG1 using 14 ti "#savedIncomp." lt -1 lw 2 fs pattern 1,\
     ARG1 using 20 ti "#lost" lt -1 lw 2 fs pattern 8, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput\\\_vanilla", \
     ARG1 index 1 u 2 ti "throughput\\\_detailed" axes x1y2 with linesp ls 7 lw 4 pt 6

unset ylabel
set ytics format ""
# set key vertical maxrows 3 width -4 sample 2


set xlabel "{/:Bold fileWriter}" font ", 22" offset 0,20.5,1
plot 161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     ARG2 using ($32-$14):xtic(1) ti "#savedComp." lc rgbcolor "black" lw 2,\
     ARG2 using 14 ti "#savedIncomp." lt -1 lw 2 fs pattern 1,\
     ARG2 using 20 ti "#lost" lt -1 lw 2 fs pattern 8, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput\\\_vanilla", \
     ARG2 index 1 u 2 ti "throughput\\\_detailed" axes x1y2 with linesp ls 7 lw 4 pt 6

unset key
set y2tics
set y2label "{/:Bold {/:Italic Throughput (ops/s)}}" font ", 22"

set key at screen 0.45, 0.035 center vertical height 1  maxrows 1 sample 2
set xlabel "{/:Bold elasticsearchWriter}" font ", 22" offset 0,20.5,1
plot 161768.075 axes x1y2 with lines lw 3 lt rgb "#000000" dashtype 2 notitle, \
     ARG3 using ($32-$14):xtic(1) ti "#savedComp." lc rgbcolor "black" lw 2,\
     ARG3 using 14 ti "#savedIncomp." lt -1 lw 2 fs pattern 1,\
     ARG3 using 20 ti "#lost" lt -1 lw 2 fs pattern 8, \
     NaN with lines lw 3 lt rgb "#000000" dashtype 2 ti "throughput\\\_vanilla", \
     ARG3 index 1 u 2 ti "throughput\\\_detailed" axes x1y2 with linesp ls 7 lw 4 pt 6

     # w lines ls 7 lw 4


# t00\\\_vanilla; 161768.075; 451.67;











