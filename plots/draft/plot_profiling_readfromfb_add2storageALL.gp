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

set multiplot layout 2,1

# x and y axis labels
set xlabel "Time" font "Helvetica, 18"
set ylabel ARG3 font "Helvetica, 18"

set yrange[0:90000]


# set title
set title "Detailed All (cont off) - ELK" font "Helvetica, 26"

plot "data/detailed_all_coff-elk-times.dat" index 0 using 1:2 ti "readFromRB" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "add2elk" with linespoints linestyle 2


# set title
set title "Detailed All (cont off) - FILE" font "Helvetica, 26"

# beforeSync2disk  1659661224.536298882  1  0
# afterSync2disk   1659661224.615996771  1  0
set arrow from 1659661224,0 to 1659661224,45000 nohead filled back lw 3 lc rgb "red"
set arrow from 1659661224,45000 to 1659661224,90000 nohead filled back lw 3 lc rgb "green"
plot "data/detailed_all_coff-file-times.dat" index 0 using 1:2 ti "readFromRB" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "add2disk" with linespoints linestyle 2

