#!/usr/bin/gnuplot -p

reset
fontsize=20
set term postscript enhanced color eps size 4,2.5 fontsize
set output "graphs/micro_rw_es_size.eps"
set datafile separator ";"

set style data histogram
set style histogram
set style fill solid
set style fill solid 1.0 border rgb 'black'
set boxwidth 1

set ylabel "{/:Bold {/:Italic Index size (GiB)}}" font ", 22"
# set format y '%.s %c'
set format y "%.b"
set grid ytics

set multiplot layout 1,2 margins 0.05,0.99,0.32,0.93

set yrange [0:13]
#set ytics 0,5,13 nomirror
set xtics nomirror rotate by 40 right

# set bmargin 7.3
# -------------------------------------------------------------------

unset key


set lmargin 6
set rmargin 30
# set bmargin 7.3
set xrange [-0.5:1.5]
set xlabel "{/:Bold Sysdig (ES)}" font ", 22" offset 0,20,1
plot ARG1 index 0 u 2:xtic(1) ti col lc rgbcolor "black" lw 2


unset ylabel
set ytics format ""
set lmargin 19
set xrange [-0.5:4.5]
unset key
# set bmargin 7.3
set xlabel "{/:Bold DIO (ES)}" font ", 22" offset 0,20,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2
