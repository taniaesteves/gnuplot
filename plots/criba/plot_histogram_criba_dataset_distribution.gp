#!/usr/bin/gnuplot -p

reset

font="Helvetica"
fontsize=28
set term postscript enhanced  color eps size 6,5 fontsize

# Output file name
set output "graphs/criba/dataset_distribution.eps"

set datafile separator ";"

set lmargin 5.5
set rmargin 0.5
set tmargin 0.5

set format y '%.s %c'
set yrange[0: 6500]
set ylabel "{/:Bold {/:Italic Number of files}}" font ", fontsize" offset 1,0

set xtics format ""
set xtics rotate by 55 right out nomirror
set xlabel "{/:Bold {/:Italic Size}}" font ", fontsize" offset 0,1


set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram rowstacked gap 1
set style fill pattern border -1
set boxwidth 0.8
set grid ytics
set key reverse Left inside


plot ARG1 using 2:xtic(1) title col ls 2,    \
     ARG1 using 3 title col ls 2,     \
     ARG1 using 4 title col ls 2,   \
     ARG1 using 5 title col ls 2, \
     ARG1 using 6 title col ls 2
