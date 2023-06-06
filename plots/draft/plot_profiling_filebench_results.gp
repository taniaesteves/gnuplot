#!/usr/bin/gnuplot -p

reset
fontsize = 12
set term postscript enhanced eps fontsize
set output "graphs/profiling_filebench.eps"
set style fill solid 1.0 border rgb 'grey30'
set style histogram errorbars gap 2 lw 3
set style data histogram
set grid ytics
set yrange [0:*]
set datafile separator ";"

set title "Filebench results" font "Helvetica, 26"

set multiplot layout 2,1 margins 0.12,0.98,0.20,0.90 spacing 0,0
unset xtics
unset xlabel
set ylabel "operations per second"
plot "data/profiling_filebench.dat" index 1 using 2:3:xtic(1) ti col lt 1 fs pattern 3, \
                                ''  index 1 using 4:5:xtic(1) ti col lt 1 fs pattern 9, \
                                ''  index 1 using ($0-0.1):($2) ti col smooth unique with lines ls 1, \
                                ''  index 1 using ($0+0.1):($4) ti col smooth unique with lines ls 2

set xtics
set xlabel "Setups"
set xtics rotate by -45
unset title
unset key

set ylabel "{/Symbol m}s per operation"  offset -3.8,0.0
plot "data/profiling_filebench.dat" index 5 using ($2*1000):3:xtic(1) ti col lt 1 fs pattern 3, \
                                ''  index 5 using ($4*1000):5 ti col lt 1 fs pattern 9, \
                                ''  index 5 using ($0-0.1):($2*1000) ti col  smooth unique  with lines ls 1, \
                                ''  index 5 using ($0+0.1):($4*1000) ti col smooth unique  with lines ls 2, \