#!/usr/bin/gnuplot -p

reset
fontsize = 16
set term postscript enhanced  color eps size 8,3 fontsize
set output "graphs/dio_rate_limit.eps"
set datafile separator ";"

set grid y
set style data histograms
set style histogram title offset 0,-0.8
set style fill pattern border
set boxwidth 0.8


set format y '%.s %c'
set yrange [0:175000]

set y2tics
set format y2 '%.s %c'
set y2range [0:100]

set bmargin 6


set ytics nomirror
set xtics nomirror

set multiplot
set key vertical maxrows 2 width -6 sample 2
set key at graph 1.08, graph -0.18

#set border 2+8


# split=4
# split2=8
# dx = 0.125
# dy = 0.03

# do for [i=0:1] {
#   set arrow 1+i from graph 0,graph i to first split-dx,graph i lt -1 nohead
#   set arrow 3+i from first split+dx,graph i to split2-dx,graph i lt -1 nohead
#   set arrow 5+i from first split2+dx,graph i to graph 1,graph i lt -1 nohead

#   set arrow 7+i from first split-2*dx,graph i-dy to first split,graph i+dy lt -1  nohead
#   set arrow 9+i from first split,graph i-dy to split+2*dx,graph i+dy lt -1  nohead

#   set arrow 11+i from first split2-2*dx,graph i-dy to first split2,graph i+dy lt -1  nohead
#   set arrow 13+i from first split2,graph i-dy to split2+2*dx,graph i+dy lt -1  nohead
# }

# # do for [i=0:1] {
# #   set arrow 1+i from graph 0,graph i to first split2-dx,graph i lt -1 nohead
# #   set arrow 3+i from first split2+dx,graph i to graph 1,graph i lt -1 nohead

# #   set arrow 5+i from first split2-2*dx,graph i-dy to first split2,graph i+dy lt -1 nohead
# #   set arrow 7+i from first split2,graph i-dy to split2+2*dx,graph i+dy lt -1 nohead
# # }



set ytics 0,25000,250000

set ylabel "Throughput (operations per second)"
set y2label "Lost events (%)"
set xlabel "EventRate (operations per second)" font "Helvetica, fontsize"
plot ARG1 index 0 u 2:xtic(1)  ti col axes x1y1  lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 0 u 4  ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 0 u 6  ti col axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 0 u 8  ti col axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 0 u 10  ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 0 u 12  ti col axes x1y1 lc rgbcolor "#dddddd" lt 1 fs pattern 3,\
        "" index 1 u ($0-1.18):2 ti "lost_{raw}" axes x1y2 with points pt 1 lw 4 lt rgb "#afaae0",\
        "" index 1 u ($0-1.063):4 ti "lost_{detailed}" axes x1y2 with points pt 2 lw 4 lt rgb "#fddcd5",\
        "" index 1 u ($0-0.935):6 ti "lost_{detailed\\\_all}" axes x1y2 with points pt 7 lw 4 lt rgb "#ffb5bf",\
        "" index 1 u ($0-0.805):8 ti "lost_{detailed\\\_all\\\_uhash}" axes x1y2 with points pt 3 lw 4 lt rgb "#ff8dbc",\
        "" index 1 u ($0-0.68):10 ti "lost_{detailed\\\_all\\\_khash}" axes x1y2 with points pt 5 lw 4 lt rgb "#5a4e7c", \

unset ylabel
unset y2label
unset xlabel


set lmargin at screen 0.12  # left margin at 0.3
set rmargin at screen 0.35  # right margin at 0.7 in the screen
set bmargin at screen 0.65  # bottom margin at 0.4
set tmargin at screen 0.93  # top margin at 0.8


set object rectangle from screen 0.09,0.6 to screen 0.385,0.95 behind fillcolor rgb 'white' fillstyle solid noborder
unset key

set yrange[0:25]
set ytics 0,5,25

set y2range[0:100]

unset format y

plot ARG1 index 2 u ($2/1000):xtic(1)  ti col axes x1y1  lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 2 u ($4/1000)  ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 2 u ($6/1000)  ti col axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 2 u ($8/1000)  ti col axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 2 u ($10/1000)  ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 2 u ($12/1000)  ti col axes x1y1 lc rgbcolor "#dddddd" lt 1 fs pattern 3,\
        "" index 3 u ($0-1.18):2 ti "lost_{raw}" axes x1y2 with points pt 1 lw 2 lt rgb "#afaae0",\
        "" index 3 u ($0-1.063):4 ti "lost_{detailed}" axes x1y2 with points pt 2 lw 2 lt rgb "#fddcd5",\
        "" index 3 u ($0-0.935):6 ti "lost_{detailed\\\_all}" axes x1y2 with points pt 7 lw 2 lt rgb "#ffb5bf",\
        "" index 3 u ($0-0.805):8 ti "lost_{detailed\\\_all\\\_uhash}" axes x1y2 with points pt 3 lw 2 lt rgb "#ff8dbc",\
        "" index 3 u ($0-0.68):10 ti "lost_{detailed\\\_all\\\_khash}" axes x1y2 with points pt 5 lw 2 lt rgb "#5a4e7c"
