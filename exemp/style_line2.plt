#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/08/14													   #
# last update : 2015/08/14													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :																   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
set terminal pdfcairo enhanced color font "Times, 8" fontscale 0.5 background "#C0C0C0" size 8cm, 8cm
set output "style_line2.pdf"
#
set style line 1  lc rgb "red"     lw 3.000 dt 2 pt 2 ps default pi 0
set style line 2  lc rgb "orange"  lw 2.000 dt 2 pt 2 ps default pi 0
set style line 3  lc rgb "yellow"  lw 3.000 dt 2 pt 2 ps default pi 0
set style line 4  lc rgb "green"   lw 2.000 dt 2 pt 2 ps default pi 0
set offsets 0.05, 0.05, 0, 0
set pointintervalbox 1.5 # point interval box
set style data linespoints 
set style function linespoints
unset xtics
unset ytics
set title "The pointinterval property also works with character point symbols" 
set xrange [ -0.500000 : 3.30000 ] noreverse nowriteback
set yrange [ -1.00000 : 1.40000 ] noreverse nowriteback
set bmargin  6
unset colorbox
i = 8
myencoding = "utf8"
x = 3.3
## Last datafile plotted: "+"
plot '+' using 1:(cos(x-1.))  with line lt -1 lw 1 title 'lw 1', \
'+' using 1:(cos(x))     lt -1 pi -4 pt "C" title 'pi -4', \
'+' using 1:(cos(x-.8))  lt -1 pi -3 pt "D" title 'pi -3 pt "D"', \
'+' using 1:(cos(x-.2))  lt -1 pi -6 pt "✠" tc rgb "blue" title 'pi -6 tc rgb "blue"', \
'+' using 1:(cos(x-.4))  lt -1 pi -3 pt "✲" title 'pi -3', \
'+' using 1:(cos(x-.6))  lt -1 pi -5 pt "☺" title 'pi -5', \
'+' using 1:(cos(x+.2))  with line lt -1 lw 2 title 'lw 2'
