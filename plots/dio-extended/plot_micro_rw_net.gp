#!/usr/bin/gnuplot -p

reset
fontsize = 18
set term postscript enhanced color eps size 4,2.5 fontsize
set output "graphs/dio-extended/micro_rw_net.eps"
set datafile separator ";"

set style data histogram
set style histogram cluster
set style fill solid
set style fill solid 1.0 border rgb 'black'
set boxwidth 1

set ylabel "{/:Bold {/:Italic Network usage (MiB/sec)}}" font ", 18" offset 0,0
# set format y '%.s %c'
set format y "%.b"
set grid ytics

set multiplot layout 1,2 margins 0.072,0.99,0.27,0.9 spacing 0.01,0.5

set yrange [0:20971520]
set ytics 0,5242880,20971520 nomirror
set xtics nomirror rotate by 40 right

set bmargin 7.3
# -------------------------------------------------------------------

unset key


set lmargin 6
set rmargin 34
set bmargin 7.3
set xlabel "{/:Bold Sysdig (ES)}" font ", 18" offset 0,20.2,1
plot ARG1 index 3 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 3 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1


unset ylabel
set ytics format ""
set lmargin 20
set xrange [-0.5:4.5]
unset key
set bmargin 7.3
set key at screen 0.55, 0.035 center vertical height 1  maxrows 1 sample 2 font ", 22"
set xlabel "{/:Bold DIO (ES)}" font ", 18" offset 0,20.2,1
plot ARG1 index 5 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 5 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1
