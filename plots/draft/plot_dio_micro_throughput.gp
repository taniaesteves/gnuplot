#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced  color eps size 10,3 fontsize
set output "graphs/filebench_throughput_rw.eps"
set datafile separator ";"

set style data histograms
set style histogram errorbars gap 1 lw 4
set boxwidth 1 relative
set style fill solid 1.00 border -1


set ylabel "{/:Bold {/:Italic Operations per second}}" font ", 22"
set format y '%.s %c'
set grid ytics

set multiplot layout 1,4 margins 0.09,0.99,0.3,0.92 spacing 0.01,0.5

set xtics font ", 18"
set xtics rotate by 45 right

# set style line 2 lc rgb 'black' lt 1 lw 1
# set style line 2 lc rgb "#EDEBE4" lt 1 lw 2
# set style line 3 lc rgb "#A7ABA6" lt 1 lw 2

set style line 1 lt 1 lc rgb "green"

set xtics nomirror

set yrange [0:170000]

set bmargin 6
unset key

set rmargin 102
set xrange [-0.5:0.5]
set xlabel "{/:Bold Vanilla}" font ", 22" offset 0,19.1,1
plot newhistogram, \
      ARG1 index 0 using 2:3:xtic(1) notitle lc rgbcolor "black" lw 2 lt -1 fs pattern 0

unset key

unset ylabel
set ytics format ""

set xtics


set bmargin 6
set lmargin 19
set rmargin 74
set xrange [-0.5:3.5]
set xlabel "{/:Bold Strace}" font ", 22" offset 0,23.7,1
plot newhistogram, \
      ARG1 index 1 using 2:3:xtic(1) ti "File" lc rgbcolor "black" lw 2 lt -1 fs pattern 1

set bmargin 6
set lmargin 47
set rmargin 52
set xrange [-0.6:1.6]
set xlabel "{/:Bold Sysdig}" font ", 22" offset 0,23.8,1
plot newhistogram, \
      ARG1 index 2 using 2:3:xtic(1) ti "File" lc rgbcolor "black" lw 2 lt -1 fs pattern 1, \
      ARG1 index 3 using 2:3:xtic(1) ti "ES" lc rgbcolor "black" lw 2 lt -1 fs pattern 3

set key sample 2

set bmargin 6
set lmargin 69
set rmargin 1
set xrange [-0.5:4.5]
set xlabel "{/:Bold DIO}" font ", 22" offset 0,23.8,1
plot newhistogram, \
      ARG1 index 4 using 2:3:xtic(1) ti "File" lc rgbcolor "black" lw 2 lt -1 fs pattern 1, \
      ARG1 index 5 using 2:3:xtic(1) ti "ES" lc rgbcolor "black" lw 2 lt -1 fs pattern 3
