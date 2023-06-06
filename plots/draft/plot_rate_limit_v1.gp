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
#set yrange [0:100]j

set y2tics
set format y2 '%.s %c'
set y2range [0:100]

set bmargin 3


set ytics nomirror
set key outside top center horizontal width 0.5

set border 2+8


split=4
split2=8
dx = 0.125
dy = 0.03

do for [i=0:1] {
  set arrow 1+i from graph 0,graph i to first split-dx,graph i lt -1 nohead
  set arrow 3+i from first split+dx,graph i to split2-dx,graph i lt -1 nohead
  set arrow 5+i from first split2+dx,graph i to graph 1,graph i lt -1 nohead

  set arrow 7+i from first split-2*dx,graph i-dy to first split,graph i+dy lt -1  nohead
  set arrow 9+i from first split,graph i-dy to split+2*dx,graph i+dy lt -1  nohead

  set arrow 11+i from first split2-2*dx,graph i-dy to first split2,graph i+dy lt -1  nohead
  set arrow 13+i from first split2,graph i-dy to split2+2*dx,graph i+dy lt -1  nohead
}

# do for [i=0:1] {
#   set arrow 1+i from graph 0,graph i to first split2-dx,graph i lt -1 nohead
#   set arrow 3+i from first split2+dx,graph i to graph 1,graph i lt -1 nohead

#   set arrow 5+i from first split2-2*dx,graph i-dy to first split2,graph i+dy lt -1 nohead
#   set arrow 7+i from first split2,graph i-dy to split2+2*dx,graph i+dy lt -1 nohead
# }

set ylabel "Throughput (operations per second)"
set y2label "Lost events (%)"
set xlabel "EventRate"
plot ARG1 index 0 u 2:xtic(1) every ::0::(split-1) ti col axes x1y1  lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 0 u 4 every ::0::(split-1) ti col axes x1y1 lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 0 u 6 every ::0::(split-1) ti col axes x1y1 lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 0 u 8 every ::0::(split-1) ti col axes x1y1 lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 0 u 10 every ::0::(split-1) ti col axes x1y1 lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 0 u 12 every ::0::(split-1) ti col axes x1y1 lc rgbcolor "#dddddd" lt 1 fs pattern 3,\
        "" index 1 u ($0-1.18):4 every ::0::(split) ti "lost_{raw}" axes x1y2 with points pt 1 lw 4 lt rgb "#afaae0",\
        "" index 1 u ($0-1.063):6 every ::0::(split) ti "lost_{detailed}" axes x1y2 with points pt 2 lw 4 lt rgb "#fddcd5",\
        "" index 1 u ($0-0.935):8 every ::0::(split) ti "lost_{detailed\\\_all}" axes x1y2 with points pt 7 lw 4 lt rgb "#ffb5bf",\
        "" index 1 u ($0-0.805):10 every ::0::(split) ti "lost_{detailed\\\_all\\\_uhash}" axes x1y2 with points pt 3 lw 4 lt rgb "#ff8dbc",\
        "" index 1 u ($0-0.68):12 every ::0::(split) ti "lost_{detailed\\\_all\\\_khash}" axes x1y2 with points pt 5 lw 4 lt rgb "#5a4e7c", \
        newhistogram at split+1,\
        "" index 0 u 2:xtic(1) every ::(split+1)::(split2-1) notitle axes x1y1  lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 0 u 4:xtic(1) every ::(split+1)::(split2-1) notitle axes x1y1  lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 0 u 6:xtic(1) every ::(split+1)::(split2-1) notitle axes x1y1  lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 0 u 8:xtic(1) every ::(split+1)::(split2-1) notitle axes x1y1  lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 0 u 10:xtic(1) every ::(split+1)::(split2-1) notitle axes x1y1  lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 0 u 12:xtic(1) every ::(split+1)::(split2-1) notitle axes x1y1  lc rgbcolor "#dddddd" lt 1 fs pattern 3, \
        "" index 1 u (split+2+$0-1.18):4 every ::(split+1)::(split2-1) notitle axes x1y2 with points pt 1 lw 4 lt rgb "#afaae0",\
        "" index 1 u (split+2+$0-1.063):6 every ::(split+1)::(split2-1) notitle axes x1y2 with points pt 2 lw 4 lt rgb "#fddcd5",\
        "" index 1 u (split+2+$0-0.935):8 every ::(split+1)::(split2-1) notitle axes x1y2 with points pt 7 lw 4 lt rgb "#ffb5bf",\
        "" index 1 u (split+2+$0-0.805):10 every ::(split+1)::(split2-1) notitle axes x1y2 with points pt 3 lw 4 lt rgb "#ff8dbc",\
        "" index 1 u (split+2+$0-0.68):12 every ::(split+1)::(split2-1) notitle axes x1y2 with points pt 5 lw 4 lt rgb "#5a4e7c", \
        newhistogram at split2+1,\
        "" index 0 u 2:xtic(1) every ::split2 notitle axes x1y1  lc rgbcolor "#333333" lt 1 fs pattern 3, \
        "" index 0 u 4:xtic(1) every ::split2 notitle axes x1y1  lc rgbcolor "#555555" lt 1 fs pattern 3, \
        "" index 0 u 6:xtic(1) every ::split2 notitle axes x1y1  lc rgbcolor "#888888" lt 1 fs pattern 3, \
        "" index 0 u 8:xtic(1) every ::split2 notitle axes x1y1  lc rgbcolor "#cccccc" lt 1 fs pattern 3, \
        "" index 0 u 10:xtic(1) every ::split2 notitle axes x1y1  lc rgbcolor "#eeeeee" lt 1 fs pattern 3, \
        "" index 0 u 12:xtic(1) every ::split2 notitle axes x1y1  lc rgbcolor "#dddddd" lt 1 fs pattern 3, \
        "" index 1 u (split2+2+$0-1.18):4 every ::(split2) notitle axes x1y2 with points pt 1 lw 4 lt rgb "#afaae0",\
        "" index 1 u (split2+2+$0-1.063):6 every ::(split2) notitle axes x1y2 with points pt 2 lw 4 lt rgb "#fddcd5",\
        "" index 1 u (split2+2+$0-0.935):8 every ::(split2) notitle axes x1y2 with points pt 7 lw 4 lt rgb "#ffb5bf",\
        "" index 1 u (split2+2+$0-0.805):10 every ::(split2) notitle axes x1y2 with points pt 3 lw 4 lt rgb "#ff8dbc",\
        "" index 1 u (split2+2+$0-0.68):12 every ::(split2) notitle axes x1y2 with points pt 5 lw 4 lt rgb "#5a4e7c", \

        # "" index 1 u ($0-1.18):4 every ::split2 ti "lost_{raw}" axes x1y2 with points pt 7 lw 4 lt rgb "#800000",\
        # "" index 1 u ($0-1.063):6 every ::split2 ti "lost_{detailed}" axes x1y2 with points pt 7 lw 4 lt rgb "#808000",\
        # "" index 1 u ($0-0.935):8 every ::split2 ti "lost_{detailed\\\_all}" axes x1y2 with points pt 7 lw 4 lt rgb "#008000",\
        # "" index 1 u ($0-0.805):10 every ::split2 ti "lost_{detailed\\\_all\\\_uhash}" axes x1y2 with points pt 7 lw 4 lt rgb "#008080",\
        # "" index 1 u ($0-0.68):12 every ::split2 ti "lost_{detailed\\\_all\\\_khash}" axes x1y2 with points pt 7 lw 4 lt rgb "#145DA0"