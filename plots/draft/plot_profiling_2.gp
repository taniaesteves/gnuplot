#!/usr/bin/gnuplot -p


reset
# clear

set t pdfcairo size 22cm,14cm

# Output file name
set output "graphs/".ARG1


# set datafile separator ";"


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

# set style data histogram
# set style histogram cluster gap 1

# # Type of graph
# # set xdata time
# # set style data lines

# # No xtics, but we do want labels, and do not mirror tics (ie show at top)
# set xtics format "" nomirror
# set xtics rotate by 75 right

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
# set xrange [10990961:10990998]

# set timefmt "%s"
# set format x "%H:%M:%S"

# Actually do the plot; use cols 2-4 from the file; linecolor gives the color,
# linewidth 0 removes the outline of the column
# plot ARG2 using 1:2 title ARG3 lc rgb 'green'
# plot ARG2 using 1:2:xtics(1) title ARG4 with lines lt rgb "#404242"
# plot ARG2 with linespoints linestyle 1

first_valc1=system("awk 'FNR == 2 {print $1}' data/submitted_events_ordered.dat")

y(x) = a*x + b
fit y(x) ARG2 index 0 using (($1-first_valc1)):($2/1024) via a, b

f(x) = c*x + d
fit f(x) ARG2 index 1 using (($1-first_valc1)):($2/1024) via c, d

plot ARG2 index 0 using (($1-first_valc1)):($2/1024) ti "calls" with linespoints linestyle 1, \
      ''  index 1 using (($1-first_valc1)):($2/1024) ti "submitted" with linespoints linestyle 2, \
      ''  index 2 using (($1-first_valc1)):($2/1024) ti "lost" with linespoints linestyle 3, \
     y(x) ti "" linecolor '#111111' linewidth 2 linetype 1 dt 2, \
     f(x) ti "" linecolor '#999999' linewidth 2 linetype 1 dt 2