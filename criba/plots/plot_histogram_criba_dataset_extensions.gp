#!/usr/bin/gnuplot -p

reset

font="NewsGotT"
fontsize=30
set term postscript enhanced  color eps size 6,5 fontsize

# Output file name
set output "graphs/dataset_extensions.eps"

set datafile separator ";"

set lmargin 7
set rmargin 0.2
set tmargin 0.5
set bmargin 7

set xtics rotate by 55 right out nomirror font "NewsGotT, fontsize" offset 0.5,0
set ytics font "NewsGotT, fontsize"

# set yrange[0:3000]
# set ytics 0,500,3000

# set format y '%.1s'
set ylabel "{/:Bold {/:Italic Number of files (K)}}" font "NewsGotT, fontsize" offset 1.5,0
set xlabel "{/:Bold {/:Italic Extension}}" font "NewsGotT, 32" offset 0,0.5

set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram rowstacked gap 1
set style fill pattern border -1
set boxwidth 0.8
set xtics format ""
set grid ytics
set key reverse Left inside font "NewsGotT, fontsize"

unset key
plot ARG1 using (($2)/1000):xtic(1) title col lt -1 lw 2 fs pattern 9