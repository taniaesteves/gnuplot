#!/usr/bin/gnuplot -p

reset

set t pdfcairo enhanced size 38cm,24cm font "Helvetica, 14"

# Output file name
set output "pdfs/".ARG1

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
set format y '%.0s%cB'


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

print "Done"

set multiplot

# x and y axis labels
set xlabel "Time" font "Helvetica, 18"
set ylabel ARG3 font "Helvetica, 18"

# set title
set title ARG4 font "Helvetica, 26"

set yrange [0:26214400]

y(x) = a*x + b
fit y(x) ARG2 index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) ARG2 index 1 using 1:2 via c, d

plot ARG2 index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2