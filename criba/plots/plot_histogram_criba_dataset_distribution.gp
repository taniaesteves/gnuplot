#!/usr/bin/gnuplot -p

reset

font="Helvetica"
fontsize=30
set term postscript enhanced  color eps size 6,5 fontsize

# Output file name
set output "graphs/dataset_distribution.eps"

set datafile separator ";"

set lmargin 5.5
set rmargin 0.5
set tmargin 0.5

# set format y '%.s %c'
set yrange[0: 6.5]
set ylabel "{/:Bold {/:Italic Number of files (K)}}" font "NewsGotT, fontsize" offset 0.5,0
set ytics font "NewsGotT, fontsize"

set xtics format "" font "NewsGotT, fontsize"
set xtics rotate by 55 right out nomirror
set xlabel "{/:Bold {/:Italic Size}}" font "NewsGotT, fontsize" offset 0,1


set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram rowstacked gap 1
set style fill pattern border -1
set boxwidth 0.8
set grid ytics
set key reverse Left inside font "NewsGotT, fontsize"


plot ARG1 using (($2)/1000):xtic(1) title col ls 2,    \
     ARG1 using (($3)/1000) title col ls 2,     \
     ARG1 using (($4)/1000) title col ls 2,   \
     ARG1 using (($5)/1000) title col ls 2, \
     ARG1 using (($6)/1000) title col ls 2
