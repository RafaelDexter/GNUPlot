#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/08/14													   #
# last update : 2015/08/14													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :																   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
set terminal pdfcairo enhanced color font "Times, 8" fontscale 0.5 background "#C0C0C0" size 8cm, 8cm
set output "solid_lines_dot.pdf"
#
set origin 0,0
set xrange [0:15]
set yrange [-5:13]
set bmargin 7
#
# set key {inside | outside} or {lmargin | rmargin | tmargin | bmargin} or {at <position>}
# 			{left | right | center} {top | bottom |center}
# 			{vertical | horizontal} {Left | Right}
# 			{(no)opaque}
# 			{(no)reverse} {(no)invert}
# 			{samplen <sample_lenght>} {spacing <vertical_spacing>}
# 			{width <width_increment>} {height <height_increment>}
# 			{(no)box  {linestyle <styele> | linetype <type> | linewidth <width> } }
# 			.... pg 130
# 			samplen = comprimento da linha = <sample_lenght>*???
# 			spacing = espaçamento veertical = <vertical_spacing> ?? ps
#			<width_increment> = é um número de larguras de caracteres a ser
#			adicionado ou subtraído do comprimento da string. Isso é útil apenas
#			quando você está colocando uma caixa em torno da key e você
#			estiver usando caracteres de controle no texto. 
set key center top vertical Left invert samplen 4 spacing 1.0 width 1 height 0.5 box lt 2
#unset ytics
#unset xtics
#
set title "Independent lines (from 1 at 15 of lt) and colors styles"
unset colorbox
set multiplot
#
# set linetype from 1 at 15
# Using "Do" command
# 	Syntax:
# 		do for < interaction - spec> {
# 			< commands>
# 		}
#
do for [i=1:15]{
	set style line i linetype i pt i
	set label sprintf("set style line %d", i) at 0.5,13.5-i # tc rgb "#??????"
	plot (x-i) ls i title sprintf("x-%d", i) #
}
#
set xlabel "You will only see solid lines if your current terminal setting permits it"
#
#show style line
unset multiplot
#
