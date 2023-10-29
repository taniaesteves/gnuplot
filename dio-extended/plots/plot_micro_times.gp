reset
fontsize = 30
set term postscript enhanced color eps size 7,4 fontsize
set output "graphs/micro_times.eps"

set style data histograms
set style histogram rowstacked

set multiplot layout 2,1 margins 0.18,0.99,0.17,0.99
set yrange [0.3:2.8]
set xrange [0:690]
set style fill solid  # solid color boxes


# set lmargin 25
myBoxWidth = 0.7
set offsets 0,0,0.5-myBoxWidth/2.,0.5

unset xtics
set ytics font "NewsGotT, fontsize"
set ylabel "{/:Bold {/:Italic Inline}}" font "NewsGotT, fontsize"
set key  vertical height 1 maxrows 1 sample 2 font "NewsGotT, fontsize"
plot ARG1 index 0 using 2:0:(0):2:($0-myBoxWidth/2.):($0+myBoxWidth/2.):(1):ytic(1) with boxxy  lt -1 lw 4 fs pattern 3 ti "tracing and parsing"

set xtics font "NewsGotT, fontsize"
set ylabel "{/:Bold {/:Italic Offline}}" font "NewsGotT, fontsize"
set xlabel "{/:Bold {/:Italic time (minutes)}}" font "NewsGotT, fontsize"
plot ARG1 index 1 using 2:0:(0):2:($0-myBoxWidth/2.):($0+myBoxWidth/2.):(1):ytic(1) with boxxy  lt -1 lw 4 fs pattern 1 ti "tracing",\
        "" index 1using 3:0:($2):($2+$3):($0-myBoxWidth/2.):($0+myBoxWidth/2.):(4):ytic(1) with boxxy lt -1 lw 4 fs pattern 8 ti "parsing"