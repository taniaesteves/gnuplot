#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 4,2.5 fontsize
set output "graphs/micro_rw_net.eps"
set datafile separator ";"

set style data histogram
set style histogram cluster
set style fill solid
set style fill solid 1.0 border rgb 'black'
set boxwidth 1

set ylabel "{/:Bold {/:Italic Network usage (MiB/sec)}}" font "NewsGotT, 20" offset 0,-0.7
# set format y '%.s %c'
set format y "%.b"
set grid ytics

set multiplot layout 1,2 margins 0.072,0.99,0.27,0.925 spacing 0.01,0.5

set yrange [0:20971520]
set ytics 0,5242880,20971520 nomirror
set xtics nomirror rotate by 40 right font "NewsGotT, 21"
set ytics font "NewsGotT, 22"
set bmargin 8
# -------------------------------------------------------------------

unset key


set lmargin 6
set rmargin 29
set bmargin 8.5
set xlabel "{/:Bold Sysdig (ES)}" font "NewsGotT, 20" offset 0,17.3,1
plot ARG1 index 3 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 3 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1


unset ylabel
set ytics format ""
set lmargin 20
set xrange [-0.5:4.5]
unset key
set bmargin 8.5
set key at screen 0.5, 0.035 center vertical height 1  maxrows 1 sample 2 font "NewsGotT, 20"
set xlabel "{/:Bold DIO (ES)}" font "NewsGotT, 20" offset 0,17.3,1
plot ARG1 index 5 u 2:xtic(1) ti col lc rgbcolor "black" lw 2,\
    "" index 5 u 3 ti col axes x1y1 lw 2 lt -1 fs pattern 1
