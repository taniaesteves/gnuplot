#!/usr/bin/gnuplot -p

reset
fontsize = 22
set term postscript enhanced color eps size 12,5 fontsize
set output "graphs/micro_dio_es_rt.eps"
set datafile separator ";"

set style data histograms
set style histogram rowstacked  title offset 0,0.8
set style fill solid
set boxwidth 0.8

set multiplot

# --------------------

# Y axis
set ylabel "{/:Bold {/:Italic Number of events (Millions)}}" font "NewsGotT, 30" offset -0.8,-1,0
set format y '%.s'
set grid ytics
set ytics nomirror font "NewsGotT, 30"
set yrange[0:240000000]
set ytics 0,40000000,240000000

# Y2 axis
set y2label "{/:Bold {/:Italic Throughput (Kops/s)}}" font "NewsGotT, 30" offset 1,0
set format y2 '%.s'
set y2tics font "NewsGotT, 30"
set y2range[0:180000]
set y2tics 0,30000,180000

# X axis
set xlabel "{/:Bold {/:Italic Event generation rate (ops/s)}}" font "NewsGotT, 30" offset 0,-3.2,0
set xtics nomirror
set xrange [-1.5:*]
set xtics font "NewsGotT, 30"
set xtics rotate by 35 right

set tmargin 0.7
set lmargin 8
set rmargin 8.5
set bmargin 13.5

set key at screen 0.5, 0.03 center vertical maxrows 1  sample 2 font "NewsGotT, 30"

plot newhistogram "{/:Bold 25K}" font "NewsGotT, 30" at 1, \
        ARG1 index 0 using ($32-$14) ti "events_{complete}"  lc rgbcolor "black",\
        ARG1 index 0 using 14 ti "events_{incomplete}" lt -1 fs pattern 1,\
        ARG1 index 0 using 20 ti "events_{lost}" lt -1 fs pattern 8, \
        ARG1 index 8 using ($0+0):2:3:xtic(1) axes x1y2 w lp ls 7 lw 4 ti "throughput", \
     newhistogram "{/:Bold 50K}" font "NewsGotT, 30" at 8, \
        ARG1 index 5 using ($32-$14) ti ""  lc rgbcolor "black",\
        ARG1 index 5 using 14 ti "" lt -1 fs pattern 1,\
        ARG1 index 5 using 20 ti "" lt -1 fs pattern 8, \
        ARG1 index 13 using ($0+7):2:xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \
     newhistogram "{/:Bold 100K}" font "NewsGotT, 30" at 16, \
        ARG1 index 6 using ($32-$14) ti ""  lc rgbcolor "black",\
        ARG1 index 6 using 14 ti "" lt -1 fs pattern 1,\
        ARG1 index 6 using 20 ti "" lt -1 fs pattern 8, \
        ARG1 index 14 using ($0+15):2:xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \
     newhistogram "{/:Bold no limit}" font "NewsGotT, 30" at 24, \
        ARG1 index 7 using ($32-$14) ti ""  lc rgbcolor "black",\
        ARG1 index 7 using 14 ti "" lt -1 fs pattern 1,\
        ARG1 index 7 using 20 ti "" lt -1 fs pattern 8, \
        ARG1 index 15 using ($0+23):2:xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \

# --------------------

set style histogram rowstacked  title offset 0,-1.2

# Y axis
unset ylabel
set yrange[0:75]
set ytics 0,25,75
unset format y

# Y2 axis
unset y2label
set y2range[0:75]
set y2tics 0,25,75
unset format y2

# X axis
unset xlabel
unset xtics


set lmargin at screen 0.10
set rmargin at screen 0.465
set bmargin at screen 0.7
set tmargin at screen 0.94

set object rectangle from screen 0.07,0.65 to screen 0.52,0.95 behind fillcolor rgb 'white' fillstyle solid noborder
unset key

plot newhistogram "30K" font "NewsGotT, 30" at 1, \
        ARG1 index 1 using (($32-$14)/1000000) ti ""  lc rgbcolor "black",\
        ARG1 index 1 using ($14/1000000) ti "" lt -1 fs pattern 1, \
        ARG1 index 1 using ($20/1000000) ti "" lt -1 fs pattern 8, \
        ARG1 index 9 using ($0):($2/1000):xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \
     newhistogram "35K" font "NewsGotT, 30" at 8, \
        ARG1 index 2 using (($32-$14)/1000000) ti ""  lc rgbcolor "black", \
        ARG1 index 2 using ($14/1000000) ti "" lt -1 fs pattern 1, \
        ARG1 index 2 using ($20/1000000) ti "" lt -1 fs pattern 8, \
        ARG1 index 10 using ($0+7):($2/1000):xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \
     newhistogram "40K" font "NewsGotT, 30" at 16, \
        ARG1 index 3 using (($32-$14)/1000000) ti ""  lc rgbcolor "black",\
        ARG1 index 3 using ($14/1000000) ti "" lt -1 fs pattern 1,\
        ARG1 index 3 using ($20/1000000) ti "" lt -1 fs pattern 8, \
        ARG1 index 11 using ($0+15):($2/1000):xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \
     newhistogram "45K" font "NewsGotT, 30" at 24, \
        ARG1 index 4 using (($32-$14)/1000000) ti ""  lc rgbcolor "black",\
        ARG1 index 4 using ($14/1000000) ti "" lt -1 fs pattern 1,\
        ARG1 index 4 using ($20/1000000) ti "" lt -1 fs pattern 8, \
        ARG1 index 12 using ($0+23):($2/1000):xtic(1) axes x1y2 w lp ls 7 lw 4 notitle, \

