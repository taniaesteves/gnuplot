#!/usr/bin/gnuplot -p

reset

fontsize=22
set term postscript enhanced  color eps size 6,4 fontsize

# Output file name
set output "graphs/criba/dataset_extensions.eps"

set datafile separator ";"

# unset key
# Make the x axis labels easier to read.
set xtics rotate by 45 right out nomirror

# Select histogram data
# set style data histogram
# Give the bars a plain fill pattern, and draw a solid line around them.
# set style fill solid border


set ylabel "Number of files" font "Helvetica, fontsize"
set xlabel "Size" font "Helvetica, fontsize"

# set style histogram clustered
# plot for [COL=2:5] ARG1 using COL:xticlabels(1) title columnheader

set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram rowstacked gap 1
set style fill pattern border -1
set boxwidth 0.8
set xtics format ""
set grid ytics
set key reverse Left inside


# plot ARG1 using 2:xtic(1) title col ls 2,    \
#      ARG1 using 3 title col ls 2,     \
#      ARG1 using 4 title col ls 2,   \
#      ARG1 using 5 title col ls 2, \
#      ARG1 using 6 title col ls 2

unset key
set xlabel "Extension" font "Helvetica, fontsize"
plot ARG1 using 2:xtic(1) title col  lt 0 fs pattern 3