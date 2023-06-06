#!/usr/bin/gnuplot -p

reset

fontsize = 26
set term postscript enhanced  color eps size 13,3 fontsize
set datafile separator ","
# extract the columheaders from block 1 and point 1
# and store them in variables
# this will create some warnings which can be ignored
plot ARG1 u (TitleCol7=stringcolumn(7),1):0 every ::1:1:1:1
plot ARG1 u (TitleCol8=stringcolumn(8),1):0 every ::1:1:1:1
plot ARG1 u (TitleCol9=stringcolumn(9),1):0 every ::1:1:1:1
plot ARG1 u (TitleCol10=stringcolumn(10),1):0 every ::1:1:1:1


set output "graphs/dio_dstat_csv_mem.eps"

set lmargin 8

set ylabel "{/:Bold {/:Italic MEM Usage}}" font ", 26" offset 0,0
set xlabel "{/:Bold {/:Italic Time (H:M)}}" font ", 26"
set xdata time
set timefmt "%d-%m %H:%M:%S"
set format x "%H:%M"
set format y '%.s %c'
set xrange [*:*]

# unset key
set key outside sample 2 font ", 26"
plot ARG1 u 1:7 every ::2:1 w lp lw 3 lc rgbcolor "#42687C" lt -1 pi -4 pt 6 t TitleCol7, \
       '' u 1:8 every ::2:1 w lp lw 3 lc rgbcolor "#9C2706" lt -1 pi -5 pt 5 t TitleCol8, \
       '' u 1:9 every ::2:1 w lp lw 3 lc rgbcolor "#000000" lt -1 pi -3 pt 3 t TitleCol9, \
       '' u 1:10 every ::2:1 w lp lw 3 lc rgbcolor "#FFBF00" lt -1 pi -2 pt 2 t TitleCol10