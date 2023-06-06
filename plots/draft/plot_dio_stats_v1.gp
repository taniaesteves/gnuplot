#!/usr/bin/gnuplot -p

reset
fontsize = 16
set term postscript enhanced color eps size 8,3 fontsize
set output "graphs/dio_stats.eps"
set datafile separator ";"


set style data histogram
set style histogram rowstacked
box_wd = 0.3
set boxwidth box_wd
set style fill solid

set ylabel "{/:Bold {/:Italic Number of events}}" font ", 18"
set format y '%.s %c'
set grid ytics

set xtics font ", 18"
set xtics rotate by 45 right

set style line 2 lc rgb 'black' lt 1 lw 1
set style line 2 lc rgb "#EDEBE4" lt 1 lw 2
set style line 3 lc rgb "#A7ABA6" lt 1 lw 2

set xrange [-0.4:5]
set yrange [0:270000000]

set multiplot layout 1,2 margins 0.08,0.99,0.40,0.98 spacing 0.01,0.5

unset key

# set xlabel "{/:Bold {/:Italic (a) } DIO with elasticSearchWriter driver}" font ", 22"
# plot ARG1 using (($2-$4)) ti "#Calls" lc rgb "#555555", \
#      '' using 4 ti "#EventPaths"  lt -1 fs pattern 3, \
#      newhistogram at 0.3, \
#           ARG1 using 16:xtic(1) ti "#Returned" lt -1 fs pattern 2,\
#      newhistogram at 0.6, \
#           ARG1 using 12 ti "#Incomplete" lt -1 fs pattern 9
#      # newhistogram at 6, \
#      #      ARG1 using 12:xtic(1) ti "col" lt -1 fs pattern 5
# # plot ARG1 using (($2-$4)) ti "#Calls" lc rgb "#555555", \
# #      '' using 4 ti "#event\\\_paths"  lt -1 fs pattern 3, \
# #      '' using ($0):($2-$4):3 with errorbars notitle lw 2 lt 1 lc black, \
# #      '' using ($0):($2):5 with errorbars notitle lw 2 lt 1 lc black, \
# #      newhistogram at box_wd, \
# #      '' using 16:xtic(1) ti "#Returned"  lt -1 fs pattern 2, \
# #      '' using 14 ti "#Lost" lw 1 lt -1 fs pattern 9, \
# #      '' using ($0+0.4):($16):17 with errorbars notitle lw 2 lt 1 lc black, \
# #      '' using ($0+0.4):($16 + $6 + $14):15 with errorbars notitle lw 2 lt 1 lc black,\

# unset ylabel
# # unset ytics
# set key right top center width 0.3
# set ytics format ""
# set xlabel "{/:Bold {/:Italic (b) } DIO with fileWriter driver}" font ", 22"
# plot ARG2 using (($2-$4)) ti "#Calls" lc rgb "#555555", \
#      '' using 4 ti "#EventPaths"  lt -1 fs pattern 3, \
#      newhistogram at 0.3, \
#           ARG2 using 16:xtic(1) ti "#Returned" lt -1 fs pattern 2,\
#      newhistogram at 0.6, \
#           ARG2 using 12 ti "#Incomplete" lt -1 fs pattern 9
# # plot newhistogram at 0, \
# #           ARG2 using (($2-$4)) ti "#Calls" lc rgb "#555555", \
# #           '' using 4 ti "#event\\\_paths"  lt -1 fs pattern 2, \
# #      newhistogram at 1, \
# #           ARG2 using 16 ti col lt -1 fs pattern 3,\
# #           '' using 12 ti col lt -1 fs pattern 2
# # plot ARG2 using (($2-$4)) ti "#Calls" lc rgb "#555555", \
# #      '' using 4 ti "#EventPath"  lt -1 fs pattern 3, \
# #      '' using ($0):($2-$4):3 with errorbars notitle lw 2 lt 1 lc black, \
# #      '' using ($0):($2):5 with errorbars notitle lw 2 lt 1 lc black, \
# #      newhistogram at box_wd, \
# #      '' using 16:xtic(1) ti "#Returned"  lt -1 fs pattern 2, \
# #      '' using 14 ti "#Lost" lw 1 lt -1 fs pattern 9, \
# #      '' using ($0+0.4):($16):17 with errorbars notitle lw 2 lt 1 lc black, \
# #      '' using ($0+0.4):($16 + $6 + $14):15 with errorbars notitle lw 2 lt 1 lc black,\
# #      newhistogram at 0.8, \
# #      '' using 12:xtic(1) ti "#Incomplete"  lt -1 fs pattern 2, \


#      #'' using 6 ti col  lt -1 fs pattern 5, \
#      # '' using ($0-0.7):($16 + $6):7 with errorbars notitle lw 2 lt 1, \
#      #'' using ($0-0.7):(($16) + .1):16 with labels notitle offset 0,0.73 font ", 12"





# -------------------------------------------------------------------

set xlabel "{/:Bold {/:Italic (a) } DIO with elasticSearchWriter driver}" font ", 22"
plot ARG1 using 2 ti "#Calls" lc rgb "#555555", \
     '' using 4 ti "#EventPaths"  lt -1 fs pattern 3, \
     newhistogram at 0.3, \
          ARG1 using 20:xtic(1) ti "#Returned" lt -1 fs pattern 2,\
          ARG1 using 22 notitle lt -1 fs pattern 3,\
     newhistogram at 0.6, \
          ARG1 using 12 ti "#Incomplete" lt -1 fs pattern 9,\
          ARG1 using 14 notitle lt -1 fs pattern 3

set yrange [0:270000000]

unset ylabel
set key right top center width 0.3 sample 2
set ytics format ""
set xlabel "{/:Bold {/:Italic (b) } DIO with fileWriter driver}" font ", 22"
plot ARG2 using 2 ti "#Calls" lc rgb "#555555", \
     '' using 4 notitle  lt -1 fs pattern 3, \
     newhistogram at 0.3, \
          ARG2 using 20:xtic(1) ti "#Returned" lt -1 fs pattern 2,\
          ARG2 using 22 notitle lt -1 fs pattern 3,\
     newhistogram at 0.6, \
          ARG2 using 12 ti "#Incomplete" lt -1 fs pattern 9,\
          ARG2 using 14 ti "#EventPaths" lt -1 fs pattern 3