#!/usr/bin/gnuplot -p

reset

set t pdfcairo size 22cm,14cm

# Output file name
set output "graphs/".ARG1

#set datafile separator ";"

# Type of graph
set style data histogram

# Visual details -- solid fill, 0.5 transparency
set style histogram cluster gap 1
set style fill solid 0.5
set boxwidth 0.9

# No xtics, but we do want labels, and do not mirror tics (ie show at top)
set xtics format "" nomirror
set xtics rotate by 75 right

# y tic marks plus grid lines
set grid ytics

# Control the look of the error bars
set style histogram errorbars linewidth 1
set errorbars linecolor black
set bars front

# Define some custom colours using RGB; can also use standard names ("blue")
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";

#The legend ('key') -- single data set does not need one
unset key

# y axis label and range -- no details needed for x axis
set ylabel ARG3
# set yrange [0:100]

# Actually do the plot; use cols 2-4 from the file; linecolor gives the color,
# linewidth 0 removes the outline of the column
plot ARG2 using 2:3:4:xtic(1) title "Operations per seconds" linecolor rgb skyblue linewidth 0, "" using 2 smooth csplines notitle with lines ls 1
