#!/usr/bin/gnuplot -p


reset
clear

set t pdfcairo size 22cm,14cm

# Output file name
set output "graphs/".ARG1


set datafile separator ";"


# # If we don't use columnhead, the first line of the data file
# # will confuse gnuplot, which will leave gaps in the plot.
# set key top left outside horizontal autotitle columnhead

# set xtics rotate by 90 offset 0,-5 out nomirror
# set ytics out nomirror

# set style fill solid border -1
# # Make the histogram boxes half the width of their slots.
# set boxwidth 0.5 relative


# # Select histogram mode.
# set style data histograms
# # Select a row-stacked histogram.
# set style histogram rowstacked

# Type of graph
set xdata time
set style data lines

# No xtics, but we do want labels, and do not mirror tics (ie show at top)
set xtics format "" nomirror
set xtics rotate by 75 right

# # Visual details -- solid fill, 0.5 transparency
# set style histogram cluster gap 1
# set style fill solid 0.5
# set boxwidth 0.9

# # No xtics, but we do want labels, and do not mirror tics (ie show at top)
# set xtics format "" nomirror
# set xtics rotate by 75 right

# # y tic marks plus grid lines
# set grid ytics

# # Control the look of the error bars
# set style histogram errorbars linewidth 1
# set errorbars linecolor black
# set bars front

# # Define some custom colours using RGB; can also use standard names ("blue")
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";

# #The legend ('key') -- single data set does not need one
# unset key

# y axis label and range -- no details needed for x axis
set ylabel ARG3
# set yrange [0:100]

set timefmt "%s"
set format x "%H:%M:%S"

# Actually do the plot; use cols 2-4 from the file; linecolor gives the color,
# linewidth 0 removes the outline of the column
# plot ARG2 using 1:2 title ARG3 lc rgb 'green'
plot ARG2 using 1:2 title ARG4 with lines lt rgb "#404242"

