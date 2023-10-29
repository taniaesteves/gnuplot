#!/usr/bin/gnuplot -p

reset
fontsize=20
set term postscript enhanced color eps size 3.5,3 fontsize
set output "graphs/micro_rw_es_size.eps"
set datafile separator ";"

set style data histogram
set style histogram
set style fill solid
set style fill solid 1.0 border rgb 'black'
set boxwidth 1

set ylabel "{/:Bold {/:Italic Index size (GiB)}}" font "NewsGotT, 22"
# set format y '%.s %c'
set format y "%.b"
set grid ytics

set multiplot layout 1,2 margins 0.05,0.99,0.45,0.93

set yrange [0:13]
#set ytics 0,5,13 nomirror
set xtics nomirror rotate by 45 right font "NewsGotT, 21"
set ytics font "NewsGotT, 22"
# set bmargin 7.3
# -------------------------------------------------------------------

unset key


set lmargin 6
set rmargin 25
# set bmargin 7.3
set xrange [-0.5:1.5]
set xlabel "{/:Bold Sysdig (ES)}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2


unset ylabel
set ytics format "" font "NewsGotT, 22"
set lmargin 18
set xrange [-0.5:4.5]
unset key
# set bmargin 7.3
set xlabel "{/:Bold DIO (ES)}" font "NewsGotT, 22" offset 0,20.2,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2
