#!/usr/bin/gnuplot -p

reset

set t pdfcairo enhanced size 38cm,24cm font "Helvetica, 14"

# Output file name
set output "graphs/".ARG1

# Type of graph
set xdata time
set style data lines

# No xtics, but we do want labels, and do not mirror tics (ie show at top)
set xtics format "" nomirror
set xtics rotate by 75 right

# y tic marks plus grid lines
set grid ytics

set timefmt "%s"
set format x "%H:%M:%S"
# set format y '%.0s%cB'


set key default
set key box
set key right top font "Helvetica, 14"

set style line 1 \
    linecolor rgb '#111111' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 0.8
set style line 2 \
    linecolor rgb '#2d61c0' \
    linetype 1 linewidth 2 \
    pointtype 3 pointsize 0.8
set style line 3 \
    linecolor rgb '#820814' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 0.8

set multiplot

# x and y axis labels
set xlabel "Time" font "Helvetica, 18"
set ylabel ARG3 font "Helvetica, 18"

# set title
set title ARG4 font "Helvetica, 26"

set yrange[0:90000]
set arrow from 1659625282,0 to 1659625282,90000 nohead filled back lw 3 lc rgb "red"
set arrow from 1659625285,0 to 1659625285,90000 nohead filled back lw 3 lc rgb "green"

plot ARG2 index 0 using 1:2 ti "readFromRB" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "add2disk" with linespoints linestyle 2