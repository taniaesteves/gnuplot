#!/usr/bin/gnuplot -p

reset
fontsize = 20
set term postscript enhanced  color eps size 8,3 fontsize
set output "graphs/filebench_results.eps"
set datafile separator ";"

set style data histogram
set style histogram errorbars gap 2 lw 2
set boxwidth 1 relative
set style fill solid 1.00 border -1


set ylabel "{/:Bold {/:Italic Operations per second}}" font ", 22"
set format y '%.s %c'
set grid ytics

set multiplot layout 1,3 margins 0.09,0.99,0.12,0.92 spacing 0.01,0.5

set xtics font ", 18"
set xtics rotate by 45 right

# set style line 2 lc rgb 'black' lt 1 lw 1
# set style line 2 lc rgb "#EDEBE4" lt 1 lw 2
# set style line 3 lc rgb "#A7ABA6" lt 1 lw 2

set style line 1 lt 1 lc rgb "green"

set xtics nomirror

set xrange [-0.4:0.4]
set yrange [0:170000]
# set xrange [-1.5:*]

unset xtics
# set key right top center width 0.3 offset 0,-1
# set key vertical maxrows 3 width -4 sample 2
unset key


#plot ARG1 using 2:3:xtic(1) ti col  lw 2 lt -1 fs pattern 8

# plot ARG1 index 0 using 2:3:xtic(1) ti ""  lw 2 lt -1 fs pattern 8, \
#      newhistogram at 1, \
#      '' index 1 using 2:3:xtic(1) ti ""  lw 2 lt -1 fs pattern 8, \
#      newhistogram at 2, \
#      ''  index 2 using 2:3:xticlabels(1) ti "{/:Italic nopWriter}" lw 2  lt -1 fs pattern 2, \
#      ''  index 2 using 4:5:xticlabels(1) ti "{/:Italic fileWriter}" lw 2 lc rgb "#555555",\
#      ''  index 2 using 6:7:xticlabels(1) ti "{/:Italic elkWriter}" lw 2 lc rgb "#888888"
set key at screen 0.45, 0.05 center vertical height 1  maxrows 2


baseline=system("head -4 " . ARG1 . " | tail -1 | awk '{print $2}' | sed 's/;//g'")
baseline=baseline+0

set xlabel "{/:Bold nopWriter}" font ", 22" offset 0,19.1,1
plot baseline w lines ls 7 lw 4 title "vanilla", \
      newhistogram, \
      ARG1 index 1 using 2:3:xticlabels(1) ti col lc rgbcolor "black" lw 2 lt -1 fs pattern 3,\
      ''  index 1 using 4:5:xticlabels(1) ti col lw 2 lc rgb "#555555",\
      ''  index 1 using 6:7:xticlabels(1) ti col lc rgbcolor "black" lw 2 lt -1 fs pattern 10,\
      ''  index 1 using 8:9:xticlabels(1) ti col lc rgbcolor "black" lw 2  lt -1 fs pattern 1,\
      ''  index 1 using 10:11:xticlabels(1) ti col lc rgbcolor "black" lw 2  lt -1 fs pattern 5



unset key

unset ylabel
set ytics format ""

set xlabel "{/:Bold fileWriter}" font ", 22" offset 0,19.1,1
plot baseline w lines ls 7 lw 4 title "vanilla", \
      newhistogram, \
      ARG1 index 2 using 2:3:xticlabels(1) ti col lc rgbcolor "black" lw 2 lt -1 fs pattern 3,\
      ''  index 2 using 4:5:xticlabels(1) ti col lw 2 lc rgb "#555555",\
      ''  index 2 using 6:7:xticlabels(1) ti col lc rgbcolor "black" lw 2 lt -1 fs pattern 10,\
      ''  index 2 using 8:9:xticlabels(1) ti col lc rgbcolor "black" lw 2  lt -1 fs pattern 1,\
      ''  index 2 using 10:11:xticlabels(1) ti col lc rgbcolor "black" lw 2  lt -1 fs pattern 5





set xlabel "{/:Bold elasticsearchWriter}" font ", 22" offset 0,19.1,1
plot baseline w lines ls 7 lw 4 title "vanilla", \
      newhistogram, \
      ARG1 index 3 using 2:3:xticlabels(1) ti col lc rgbcolor "black" lw 2 lt -1 fs pattern 3,\
      ''  index 3 using 4:5:xticlabels(1) ti col lw 2 lc rgb "#555555",\
      ''  index 3 using 6:7:xticlabels(1) ti col lc rgbcolor "black" lw 2 lt -1 fs pattern 10,\
      ''  index 3 using 8:9:xticlabels(1) ti col lc rgbcolor "black" lw 2  lt -1 fs pattern 1,\
      ''  index 3 using 10:11:xticlabels(1) ti col lc rgbcolor "black" lw 2  lt -1 fs pattern 5

