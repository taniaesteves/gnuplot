#!/usr/bin/gnuplot -p

reset
fontsize = 24
set term postscript enhanced color eps size 8,3.6 fontsize
set output "graphs/micro_sysdig_es_bs.eps"
set datafile separator ";"

set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.5

set multiplot

# Y axis
set grid ytics
set format y '%.s'
set yrange [0:240000000]
set ytics 0,40000000,240000000
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font "NewsGotT, 30" offset -0.2,-0.2
set ytics font "NewsGotT, 30"

# Y2 axis
set y2tics
set format y2 '%.s'
set y2range [0:180000]
set y2tics 0,30000,180000
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font "NewsGotT, 30" offset -0.2,0
set y2tics font "NewsGotT, 30"

# X axis
set xrange [-0.5:6.5]
set xtics nomirror
set format x "\n"     # xtic label empty line
set linetype 1 lc "black"
set linetype 2 lc rgb "#0078b1"
set xlabel "{/:Bold {/:Italic Batch size (events)}}" font "NewsGotT, 30" offset 0, 1.3, 0
set xtics font "NewsGotT, 30"


set bmargin 6
set lmargin 7
set rmargin 7

# -------------------------------------------------------------------

unset key

set key at screen 0.5, 0.08 center vertical height 0.8  maxrows 2 sample 2 font "NewsGotT, 30"
plot ARG1 index 0 using 4 ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 5 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     163842 axes x1y2 with lines lw 7 lt rgb "#000000" dashtype 2 notitle, \
     NaN with lines lw 7 lt rgb "#000000" dashtype 2 ti "throughput_{vanilla}", \
     ARG1 index 1 u 2 ti "throughput_{sysdig}" axes x1y2 with linesp ls 7 lw 7 pt 6, \
     ARG1 index 0 u 1:(0):3:2 w labels font "NewsGotT, 30" tc var offset 0,-1 notitle


# -------------------------------------------------------------------

set style histogram rowstacked  title offset 0,-1.2

unset ylabel
unset y2label
unset xlabel
unset y2tics
set boxwidth 0.5

set lmargin at screen 0.13  # left margin at 0.3
set rmargin at screen 0.5  # right margin at 0.7 in the screen
set bmargin at screen 0.39  # bottom margin at 0.4
set tmargin at screen 0.65  # top margin at 0.8


set object rectangle from screen 0.1,0.35 to screen 0.52,0.63 behind fillcolor rgb 'white' fillstyle solid noborder
unset key


# Y axis
set grid ytics
set format y '%.s'
set yrange[0:7000000]
set ytics 0,2000000,7000000
set ytics font "NewsGotT, 25"

# X axis
set xrange [-0.7:6.7]
set xtics nomirror font "NewsGotT, 25"
set format x "\n"     # xtic label empty line
set linetype 1 lc "black"
set linetype 2 lc rgb "#0078b1"


plot ARG1 index 0 using 4 ti "events_{complete}" lc rgbcolor "black" lw 2,\
     ARG1 index 0 using 5 ti "events_{incomplete}" lt -1 lw 2 fs pattern 1, \
     ARG1 index 0 u 1:(0):3:2 w labels font "NewsGotT, 30" tc var offset 0,-1 notitle