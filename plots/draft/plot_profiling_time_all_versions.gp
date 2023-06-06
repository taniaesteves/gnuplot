#!/usr/bin/gnuplot -p

reset

set t pdfcairo enhanced size 60cm,40cm font "Helvetica, 14"

# Output file name
set output "graphs/".ARG1

# Type of graph
set xdata time
set style data lines

# No xtics, but we do want labels, and do not mirror tics (ie show at top)
set xtics format "" nomirror
set xtics rotate by 75 right

# y tic marks plus grid lines
set grid ytics

set timefmt "%s"
set format x "%H:%M:%S"
set format y '%.0s%cB'


set key default
set key box
set key right top font "Helvetica, 14"

set style line 1 \
    linecolor rgb '#111111' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 0.4
set style line 2 \
    linecolor rgb '#2d61c0' \
    linetype 1 linewidth 2 \
    pointtype 3 pointsize 0.4
set style line 3 \
    linecolor rgb '#820814' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 0.4

print "Done"

# set multiplot layout 6,3

set multiplot layout 6,2

# set multiplot layout 4,1

# x and y axis labels
set xlabel "Time" font "Helvetica, 18"



set yrange [0:31457280]

# # ---- 1st graph



# # set title
# set title "raw - File" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r2/cataio_file_profiling_raw_4c.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r2/cataio_file_profiling_raw_4c.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r2/cataio_file_profiling_raw_4c.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 2nd graph

# # set title
# set title "raw - ELK" font "Helvetica, 26"
# unset ylabel

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r2/cataio_1ES_profiling_raw_4c.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r2/cataio_1ES_profiling_raw_4c.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r2/cataio_1ES_profiling_raw_4c.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 3rd graph

# # set title
# set title "Raw - NULL" font "Helvetica, 26"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r2/cataio_null_profiling_raw_4c.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r2/cataio_null_profiling_raw_4c.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r2/cataio_null_profiling_raw_4c.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 3rd graph

# # set title
# set title "Raw - NONE" font "Helvetica, 26"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r2/cataio_none_profiling_raw_4c.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r2/cataio_none_profiling_raw_4c.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r2/cataio_none_profiling_raw_4c.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2




# ---- 1st graph

set title "raw - Nop - no lock" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# ---- 1st graph

set title "raw - NULL" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_null_profiling_raw.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_null_profiling_raw.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_null_profiling_raw.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# ---- 1st graph

set title "raw - NONE" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_none_profiling_raw.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_none_profiling_raw.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_none_profiling_raw.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# ---- 1st graph

set title "raw - Nop 1 ms" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1ms.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1ms.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1ms.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# ---- 1st graph

set title "raw - Nop 1 us" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1us.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1us.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1us.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# ---- 1st graph

set title "raw - Nop 100 ns" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_100ns.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_100ns.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_100ns.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# ---- 1st graph

set title "raw - Nop 1 ns" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1ns.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1ns.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_1ns.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


set title "raw - Nop 0 ns" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_0ns.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_0ns.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_0ns.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


set title "raw - Nop 0 ns SEM LOCKs" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_nolock.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_nolock.dat" index 1 using 1:2 via c, d

plot "data/nop_profiling_times_r1/t01_dio_nop_profiling_raw_nolock.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # set title
# set title "raw - None" font "Helvetica, 26"
# unset ylabel

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t01_dio_none_profiling_raw.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t01_dio_none_profiling_raw.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t01_dio_none_profiling_raw.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# ---- 2nd graph

# set title
set title "raw - NULL" font "Helvetica, 26"
set ylabel "Bytes/second" font "Helvetica, 15"

y(x) = a*x + b
fit y(x) "data/profiling_times_r1/t01_dio_null_profiling_raw.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/profiling_times_r1/t01_dio_null_profiling_raw.dat" index 1 using 1:2 via c, d

plot "data/profiling_times_r1/t01_dio_null_profiling_raw.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# ---- 3rd graph

# set title
set title "raw - ELK" font "Helvetica, 26"
unset ylabel

y(x) = a*x + b
fit y(x) "data/profiling_times_r1/t01_dio_1ES_profiling_raw.dat" index 0 using 1:2 via a, b

f(x) = c*x + d
fit f(x) "data/profiling_times_r1/t01_dio_1ES_profiling_raw.dat" index 1 using 1:2 via c, d

plot "data/profiling_times_r1/t01_dio_1ES_profiling_raw.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
      ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
      ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
     y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
     f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2



# # ---- 4th graph

# # set title
# set title "detailed - None" font "Helvetica, 26"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t02_dio_none_profiling_detailed.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t02_dio_none_profiling_detailed.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t02_dio_none_profiling_detailed.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 5th graph

# # set title
# set title "detailed - NULL" font "Helvetica, 26"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t02_dio_null_profiling_detailed.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t02_dio_null_profiling_detailed.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t02_dio_null_profiling_detailed.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 6th graph

# # set title
# set title "detailed - ELK" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t02_dio_1ES_profiling_detailed.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t02_dio_1ES_profiling_detailed.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t02_dio_1ES_profiling_detailed.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 7th graph

# # set title
# set title "detailed+paths - None" font "Helvetica, 26"
# unset ylabel

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t03_dio_none_profiling_detailed_paths.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t03_dio_none_profiling_detailed_paths.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t03_dio_none_profiling_detailed_paths.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 8th graph

# # set title
# set title "detailed+paths - NULL" font "Helvetica, 26"
# unset ylabel

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t03_dio_null_profiling_detailed_paths.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t03_dio_null_profiling_detailed_paths.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t03_dio_null_profiling_detailed_paths.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 9th graph

# # set title
# set title "detailed+paths - ELK" font "Helvetica, 26"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t03_dio_1ES_profiling_detailed_paths.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t03_dio_1ES_profiling_detailed_paths.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t03_dio_1ES_profiling_detailed_paths.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 10th graph

# # set title
# set title "detailed+all - None" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t04_dio_none_profiling_detailed_all.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t04_dio_none_profiling_detailed_all.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t04_dio_none_profiling_detailed_all.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 11th graph

# # set title
# set title "detailed+all - NULL" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t04_dio_null_profiling_detailed_all.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t04_dio_null_profiling_detailed_all.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t04_dio_null_profiling_detailed_all.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 12th graph

# # set title
# set title "detailed+all - ELK" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t04_dio_1ES_profiling_detailed_all.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t04_dio_1ES_profiling_detailed_all.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t04_dio_1ES_profiling_detailed_all.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 13th graph

# # set title
# set title "detailed+all+plain - None" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t05_dio_none_profiling_detailed_all_plain.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t05_dio_none_profiling_detailed_all_plain.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t05_dio_none_profiling_detailed_all_plain.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 14th graph

# # set title
# set title "detailed+all+plain - NULL" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t05_dio_null_profiling_detailed_all_plain.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t05_dio_null_profiling_detailed_all_plain.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t05_dio_null_profiling_detailed_all_plain.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2

# # ---- 15th graph

# # set title
# set title "detailed+all+plain - ELK" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t05_dio_1ES_profiling_detailed_all_plain.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t05_dio_1ES_profiling_detailed_all_plain.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t05_dio_1ES_profiling_detailed_all_plain.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 16th graph

# # set title
# set title "detailed+all+khash - None" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t06_dio_none_profiling_detailed_all_khash.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t06_dio_none_profiling_detailed_all_khash.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t06_dio_none_profiling_detailed_all_khash.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 17th graph

# # set title
# set title "detailed+all+khash - NULL" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t06_dio_null_profiling_detailed_all_khash.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t06_dio_null_profiling_detailed_all_khash.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t06_dio_null_profiling_detailed_all_khash.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2


# # ---- 18th graph

# # set title
# set title "detailed+all+khash - ELK" font "Helvetica, 26"
# set ylabel "Bytes/second" font "Helvetica, 15"

# y(x) = a*x + b
# fit y(x) "data/profiling_times_r1/t06_dio_1ES_profiling_detailed_all_khash.dat" index 0 using 1:2 via a, b

# f(x) = c*x + d
# fit f(x) "data/profiling_times_r1/t06_dio_1ES_profiling_detailed_all_khash.dat" index 1 using 1:2 via c, d

# plot "data/profiling_times_r1/t06_dio_1ES_profiling_detailed_all_khash.dat" index 0 using 1:2 ti "calls-size" with linespoints linestyle 1 , \
#       ''  index 1 using 1:2 ti "submitted-size" with linespoints linestyle 2 , \
#       ''  index 2 using 1:2 ti "lost-size" with linespoints linestyle 3 , \
#      y(x) ti "" linecolor '#111111' linewidth 3 linetype 1 dt 2, \
#      f(x) ti "" linecolor '#2d61c0' linewidth 3 linetype 1 dt 2