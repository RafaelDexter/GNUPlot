#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/08/14													   #
# last update : 2015/08/14													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :																   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
reset
set terminal pdfcairo enhanced color font "Times, 8" fontscale 0.5 background "#C0C0C0" size 9cm, 8cm
set output "dash.pdf"
set origin 0,0
set xrange [0:15]
set yrange [-5:13]
set bmargin 7
set title "Independent dashed lines (from 1 at 4 of dt)"
set multiplot
#
do for [i=1:4]{
	set style line i linetype i dt i lw 3
	set label sprintf("dashed line %d", i) at 0.5,13.5-i tc lt i  
	plot (x-2*i) ls i notitle
}
#
set xlabel "You will see three dashed and one solid lines if your current terminal setting permits it"
#
#show style line
unset multiplot
#
