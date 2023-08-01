#!/usr/bin/gnuplot -p

reset
fontsize = 24
set term postscript enhanced  color eps size 10,6 fontsize
set output "graphs/ffunctions_latencies.eps"
set datafile separator ";"

set style data histograms
set style histogram cluster gap 1
set style fill solid 1.0 border rgb 'black'
set boxwidth 0.9

set style histogram errorbars linewidth 4
set errorbars linecolor rgb 'red' lw 4

# Y axis
set grid y
# set yrange [0:*]
set ylabel "{/:Bold {/:Italic Avg latency (ms)}}" font ", 28"

# X axis
set xtics nomirror rotate by 45 right
set xlabel "{/:Bold {/:Italic Test}}" font ", 28"# offset 0,0.7,0

set tmargin 2
set key outside top horizontal Left reverse offset 7,0
plot ARG1 u 2:3:xtic(1) ti "default\\\_functions" lc rgbcolor "black" lw 2,\
    "" u 4:5 ti "my\\\_functions" lc rgbcolor "white" lw 2

# --------


