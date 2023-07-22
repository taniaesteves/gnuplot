#!/usr/bin/gnuplot -p

reset

font="Helvetica"
fontsize=28
set term postscript enhanced  color eps size 6,5 fontsize

# Output file name
set output "graphs/criba/dataset_extensions.eps"

set datafile separator ";"

set lmargin 6
set rmargin 0.2
set tmargin 0.5

set xtics rotate by 55 right out nomirror

set format y '%.s %c'
set ylabel "{/:Bold {/:Italic Number of files}}" font ", fontsize" offset 1.5,0
set xlabel "{/:Bold {/:Italic Extension}}" font ", fontsize" offset 0,1

set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram rowstacked gap 1
set style fill pattern border -1
set boxwidth 0.8
set xtics format ""
set grid ytics
set key reverse Left inside

unset key
plot ARG1 using 2:xtic(1) title col lt -1 lw 2 fs pattern 9