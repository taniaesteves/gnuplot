#!/usr/bin/gnuplot -p

reset

set t pdfcairo size 18cm,7cm

# Output file name
set output "graphs/".ARG1

# set datafile separator ";"

# Type of graph
set xdata time
set style data lines

# Visual details -- solid fill, 0.5 transparency
# set style histogram cluster gap 1
# set style fill solid 0.5
# set boxwidth 0.9

# No xtics, but we do want labels, and do not mirror tics (ie show at top)
set xtics format "" nomirror font ", 15"
# set xtics rotate by 75 right
set ytics font ", 15"

# y tic marks plus grid lines
set grid ytics

# Control the look of the error bars
# set style histogram errorbars linewidth 1
# set errorbars linecolor black
# set bars front

# Define some custom colours using RGB; can also use standard names ("blue")
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";

#The legend ('key') -- single data set does not need one
unset key

# y axis label and range -- no details needed for x axis
set ylabel ARG3 font ", 18"

# myTimeFmt = "%d.%m.%Y %H:%M"


set timefmt "%s"
set format x "%H:%M"
set xlabel "time (Hh:Mm)" font ", 18"

set yrange [0.7:3.6]
set xrange [1669734000:1669734900]


# set object 2 circle front at 0,0 size char 1 fillcolor rgb "black" lw 1
# set label '1' at 1669734330,3.15 left offset char 0,0 point pointtype 7 pointsize 2 lc rgb 'black' tc rgb "white"


set macro
# labelMacro(i,x,y,l) = sprintf('set obj %d rectangle at %f,%f size char 0,0; set label %d at %f,%f "%s" front center', i, x, y, l, i, x, y, l)
labelMacro(i,x,y,l) = sprintf('set obj %d circle fillcolor rgb "black" at %f,%f size char strlen("%s"), char 1; set label %d at %f,%f "%s" front center tc rgb "black"', i, x, y, l, i, x, y, l)

label1 = labelMacro(1, 1669734330, 3.15, "1")
label2 = labelMacro(2, 1669734395, 0.83, "2")
label3 = labelMacro(3, 1669734465, 2.95, "3")
label4 = labelMacro(4, 1669734539, 0.83, "4")
@label1; @label2; @label3; @label4;


set object 1 rectangle from graph 0.3333,2 to graph 0.6666,-2
set object 1 fillstyle noborder fillcolor "light-gray"
set object 1 behind



# Actually do the plot; use cols 2-4 from the file; linecolor gives the color,
# linewidth 0 removes the outline of the column
# plot ARG2 using 1:2 title "Latency 999th" with filledcurves y1=800 lt rgb "#404242"
plot ARG2 using 1:($2/1000) title "Latency 99th" with lines lt rgb "#404242"


