#!/usr/bin/gnuplot -p

clear
reset

set terminal svg size 750,180 enhanced background rgb 'white' fname ',22' lw 1
set output "rocksdb-dio.svg"


# Type of graph
set xdata time
set style data lines

set xtics format "" nomirror font ", 15"
set ytics font ", 15"


set border lw 1.25

set tics scale 0.4
set grid ytics


# Define some custom colours using RGB; can also use standard names ("blue")
red         = "#FF0000"
green       = "#00FF00"
blue        = "#0000FF"
skyblue     = "#87CEEB"
dark_grey   = "#404040"
light_grey  = "#C5C5C5"
set style line 1 linecolor rgb dark_grey lt 1 lw 1.25

#The legend ('key') -- single data set does not need one
unset key

set ytics offset 0.7 font ",20"
set ytics ("0" 0, "1.0" 1, "1.5" 1.5, "2.0" 2, "2.5" 2.5, "3.0" 3, "3.5" 3.5)

set timefmt "%s"
set format x "%H:%M"
set xtics offset 0,0.6 font ",18"

set yrange [0.7:3.6]
set xrange [1669734000:1669734900]


# set object 2 circle front at 0,0 size char 1 fillcolor rgb "black" lw 1
# set label '1' at 1669734330,3.15 left offset char 0,0 point pointtype 7 pointsize 2 lc rgb 'black' tc rgb "white"


set macro
labelMacro(i,x,y,l) = sprintf('set obj %d circle fillcolor rgb "black" at %f,%f size char strlen("%s"), char 1; set label %d at %f,%f "%s" front center tc rgb "black"', i, x, y, l, i, x, y, l)

set label 5 '{/:Bold Latency (ms)}' front center at screen 0.017, 0.58 rotate by 90 font ", 23"
set label 6 '{/:Bold Time (HH:MM)}' front center at screen 0.54, 0.055 font ", 20"


set object 1 rectangle from graph 0.3333,2 to graph 0.6666,-2
set object 1 fillstyle noborder fillcolor "#C5C5C5"
set object 1 behind


set object 2 circle at scr 0.415, 0.87 size 16 fc rgb "black" front fill solid lw 1.5
set label 7 '{/:Bold 1}' front at scr 0.407, 0.867 font ", 22" textcolor "white"
set object 3 circle at scr 0.475, 0.283 size 16 fc rgb "black" front fill solid lw 1.5
set label 8 '{/:Bold 2}' front at scr 0.467, 0.28 font ", 22" textcolor "white"
set object 4 circle at scr 0.553, 0.83 size 16 fc rgb "black" front fill solid lw 1.5
set label 9 '{/:Bold 3}' front at scr 0.545, 0.827 font ", 22" textcolor "white"
set object 5 circle at scr 0.625, 0.283 size 16 fc rgb "black" front fill solid lw 1.5
set label 10 '{/:Bold 4}' front at scr 0.617, 0.28 font ", 22" textcolor "white"




set tmargin at screen 0.95; set bmargin at screen 0.24
set lmargin at screen 0.09; set rmargin at screen 0.98


# Actually do the plot; use cols 2-4 from the file; linecolor gives the color,
plot ARG1 using 1:($2/1000) notitle with lines ls 1
