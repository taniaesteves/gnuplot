#!/usr/bin/gnuplot -p

reset
fontsize = 12
set term postscript enhanced eps size 9.5,4 fontsize
set output "graphs/filebench_results.eps"
set style fill solid 1.0 border rgb 'grey30'
set style histogram errorbars gap 2 lw 3
set style data histogram
set grid ytics
set yrange [0:*]
set datafile separator ";"

set title "Filebench results" font "Helvetica, 26"

set format y '%.s %c'

unset key
set multiplot layout 2,1 margins 0.05,0.98,0.25,0.90 spacing 0,0
unset xtics
unset xlabel
set ylabel "operations per second"
plot ARG1 index 4 using 2:3:xtic(1) lt 1 fs pattern 9, \
      ''  index 4 using 2 smooth unique notitle with lines ls 1, \
      ''  index 4 using 0:($2 + .1):2 with labels notitle offset 0,0.73

set xtics
set xlabel "Setups"
set xtics rotate by -45
unset title
unset key

set ylabel "{/Symbol m}s per operation"  offset -2,0.0
plot ARG1 index 5 using ($2*1000):3:xtic(1) lt 1 fs pattern 7, \
      ''  index 5 using ($2*1000) smooth unique notitle with lines ls 1, \
      ''  index 5 using 0:(($2*1000) + .1):2 with labels notitle offset 0,0.73