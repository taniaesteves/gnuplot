reset
fontsize = 30
set term postscript enhanced color eps size 7,4 fontsize
set output "graphs/dio-extended/micro_times.eps"

set style data histograms
set style histogram rowstacked

set yrange [0.3:5.8]
set xrange [0:700]
set style fill solid  # solid color boxes

set lmargin 18
myBoxWidth = 0.8
set offsets 0,0,0.5-myBoxWidth/2.,0.5

set xlabel "{/:Bold {/:Italic time (minutes)}}" font ", fontsize"
set key  vertical height 1 width -2 maxrows 1 sample 2 font ", fontsize"
plot ARG1 using 2:0:(0):2:($0-myBoxWidth/2.):($0+myBoxWidth/2.):(1):ytic(1) with boxxy  lc rgbcolor "black" lw 2 ti "tracing",\
        "" using 3:0:($2):($2+$3):($0-myBoxWidth/2.):($0+myBoxWidth/2.):(4):ytic(1) with boxxy lt -1 lw 2 fs pattern 1 ti "parsing"