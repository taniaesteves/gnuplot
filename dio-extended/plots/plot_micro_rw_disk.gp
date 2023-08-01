#!/usr/bin/gnuplot -p

reset
fontsize=20
set term postscript enhanced color eps size 6,2.5 fontsize
set output "graphs/micro_rw_disk.eps"
set datafile separator ";"

set style data histogram
set style histogram
set style fill solid 1.0 border rgb 'black'
set boxwidth 1

set ylabel "{/:Bold {/:Italic Trace size (GiB)}}" font ", 22"
set format y "%.b"
set grid ytics

# set multiplot layout 1,2 margins 0.05,0.99,0.27,0.93
set multiplot layout 1,3 margins 0.05,0.99,0.32,0.93

set yrange [0:200]
set ytics 0, 25, 200
set ytics nomirror

set xtics nomirror rotate by 40 right
unset key

# -------------------------------------------------------------------

set lmargin 7
set rmargin 45
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font ", 22" offset 0,20,1
plot ARG1 index 1 u 2:xtic(1) ti col lc rgbcolor "black" lw 2

unset ylabel
set ytics format ""

set lmargin 28
set rmargin 33
set xrange [-0.5:1.5]
set xlabel "{/:Bold Sysdig (File)}" font ", 22" offset 0,20,1
plot ARG1 index 2 u 2:xtic(1) ti col lc rgbcolor "black" lw 2

set lmargin 40
set xrange [-0.5:4.5]
set xlabel "{/:Bold DIO (File)}" font ", 22" offset 0,20,1
plot ARG1 index 4 u 2:xtic(1) ti col lc rgbcolor "black" lw 2
