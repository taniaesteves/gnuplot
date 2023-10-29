#!/usr/bin/gnuplot -p

reset
fontsize=26
set term postscript enhanced color eps size 10,2.5 fontsize
set output "graphs/bdb_times.eps"
set datafile separator ";"

set style data histograms
set style histogram errorbars gap 2 lw 3
set style fill solid
set boxwidth 1


set multiplot layout 1,4 margins screen 0.065,0.99,0.12,0.9 spacing 0.01, 0.05

# Y axis
set yrange [0:70]
set ylabel "{/:Bold {/:Italic Elapsed time (mins)}}" font "NewsGotT, 30" offset 0.7,0
set ytics nomirror font "NewsGotT,28"
set grid y

# X axis
set xrange [-0.35:0.35]
unset xtics

# Key
set key at screen 0.5, 0.05 center vertical height 1  maxrows 1 sample 2  width 2 font "NewsGotT, 28"


set title "{/:Bold Load-16GiB}" font "NewsGotT, 28" offset 0,-0.9
plot ARG1 every ::0::0 using 2:3 ti columnhead(2) lc rgbcolor "black" lw 3,\
    ARG1 every ::0::0 using 4:5 ti columnhead(4) lt -1 lw 3 fs pattern 1, \
    ARG1 every ::0::0 using 6:7 ti columnhead(6) lt -1 lw 3 fs pattern 8

unset ylabel
set ytics format ""
unset key
set title "{/:Bold Run-16GiB}" font "NewsGotT, 28"
plot ARG1 every ::1::1 using 2:3 ti columnhead(2) lc rgbcolor "black" lw 3,\
    ARG1 every ::1::1 using 4:5 ti columnhead(4) lt -1 lw 3 fs pattern 1, \
    ARG1 every ::1::1 using 6:7 ti columnhead(6) lt -1 lw 3 fs pattern 8

set title "{/:Bold Load-32GiB}" font "NewsGotT, 28"
plot ARG1 every ::2::2 using 2:3 ti columnhead(2) lc rgbcolor "black" lw 3,\
    ARG1 every ::2::2 using 4:5 ti columnhead(4) lt -1 lw 3 fs pattern 1, \
    ARG1 every ::2::2 using 6:7 ti columnhead(6) lt -1 lw 3 fs pattern 8

set title "{/:Bold Run-32GiB}" font "NewsGotT, 28"
plot ARG1 every ::3::3 using 2:3 ti columnhead(2) lc rgbcolor "black" lw 3,\
    ARG1 every ::3::3 using 4:5 ti columnhead(4) lt -1 lw 3 fs pattern 1, \
    ARG1 every ::3::3 using 6:7 ti columnhead(6) lt -1 lw 3 fs pattern 8

unset multiplot