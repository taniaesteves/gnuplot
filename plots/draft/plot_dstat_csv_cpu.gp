#!/usr/bin/gnuplot -p

reset

fontsize = 26
set term postscript enhanced  color eps size 13,3 fontsize
set datafile separator ","
# extract the columheaders from block 1 and point 1
# and store them in variables
# this will create some warnings which can be ignored
plot ARG1 u (TitleCol2=stringcolumn(2),1):0 every ::1:1:1:1
plot ARG1 u (TitleCol3=stringcolumn(3),1):0 every ::1:1:1:1
plot ARG1 u (TitleCol4=stringcolumn(4),1):0 every ::1:1:1:1


set output "graphs/dio_dstat_csv_cpu.eps"

set lmargin 6

set ylabel "{/:Bold {/:Italic CPU Usage (%)}}" font ", 26" offset 2,0
set xlabel "{/:Bold {/:Italic Time (H:M)}}" font ", 26"
set xdata time
set timefmt "%d-%m %H:%M:%S"
set format x "%H:%M"
set xrange [*:*]

# unset key
set key outside sample 2 font ", 26"
plot ARG1 u 1:2 every ::2:1 w lp lw 3 lc rgbcolor "#42687C" lt -1 pi -4 pt 6 t TitleCol2, \
       '' u 1:3 every ::2:1 w lp lw 3 lc rgbcolor "#9C2706" lt -1 pi -5 pt 5 t TitleCol3, \
	   '' u 1:4 every ::2:1 w lp lw 3 lc rgbcolor "#000000" lt -1 pi -3 pt 3 t TitleCol4