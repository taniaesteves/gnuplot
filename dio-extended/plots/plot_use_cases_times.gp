#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced color eps size 10,2.5 fontsize
set output "graphs/use_cases_times.eps"

set multiplot layout 1,3

set style data histograms
set style histogram

set xtics font "NewsGotT, 24"
set ytics font "NewsGotT, 24"
unset ylabel
set style fill solid  # solid color boxes
# set lmargin 15
myBoxWidth = 0.7
set offsets 0,0,0.5-myBoxWidth/2.,0.5
set xlabel " " font "NewsGotT, 24"

set bmargin 5
set lmargin 10
set rmargin 1

unset key
set title "{/:Bold Elasticsearch}" font "NewsGotT, 30"
set yrange [-0.8:3.8]
set xrange [0:80]
set xtics 0,20,80
# x  y  xlow  xhigh  ylow  yhigh
plot ARG1 index 0 using 2:0:(0):2:($0-myBoxWidth/2.):($0+myBoxWidth/2.):(1):ytic(1) with boxxy  lc rgbcolor "black" lw 2 ti "average",\
       "" index 0 using 2:0:($2-$3):($2+$3):0:0:(1):ytic(1) with xyerrorbars  lc rgbcolor "red" lw 2 ti "standard deviation"


set xlabel "time (minutes)" font "NewsGotT, 30"
set title "{/:Bold Redis}" font "NewsGotT, 30"
set yrange [-0.8:3.8]
set xrange [0:120]
set xtics 0,30,120
# x  y  xlow  xhigh  ylow  yhigh
plot ARG1 index 1 using 2:0:(0):2:($0-myBoxWidth/2.):($0+myBoxWidth/2.):(1):ytic(1) with boxxy  lc rgbcolor "black" lw 2 ti "average",\
       "" index 1 using 2:0:($2-$3):($2+$3):0:0:(1):ytic(1) with xyerrorbars  lc rgbcolor "red" lw 2 ti "standard deviation"

set xlabel " " font "NewsGotT, 24"
set title "{/:Bold RocksDB}" font "NewsGotT, 30"
set yrange [-0.8:3.8]
set xrange [0:420]
set xtics 0,100,400
set key at screen 0.5, 0.05 center vertical height 1 width -2 maxrows 1 sample 2 font "NewsGotT, 26"
# x  y  xlow  xhigh  ylow  yhigh
plot ARG1 index 2 using 2:0:(0):2:($0-myBoxWidth/2.):($0+myBoxWidth/2.):(1):ytic(1) with boxxy  lc rgbcolor "black" lw 2 ti "average execution time",\
       "" index 2 using 2:0:($2-$3):($2+$3):0:0:(1):ytic(1) with xyerrorbars  lc rgbcolor "red" lw 2 ti "standard deviation"


