#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-#
# created     : 2015/08/12												       #
# last update : 2015/08/12												       #
# author      : Rafael Dexter <dexter.nba@gmail.com>			       		   #
# notes       : GNUPlot 5.0.1												   #
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-#
#set style line N lt { Nº | <colorspec>} lc <colorspec> lw Nº pt Nº ps Nº
#Ex:
#ser style line lc rgb "black"  lw 1.800 dashtype solid pt 12 ps 0.8 poi 0
# 
# Todas as linhas já são, por padrão "dashtype" até que você especifique o
# contrário. Você pode mudar o padrão para uma linha em particular usando o
# comando "set linetype", deste modo você afeta todos os comandos sobsequentes,
# ou você pode incluir incluir o pontilhado desejado como parte do plot ou outro
# comando.
#
# dashtype Nº | "patter" | sNº ou eNº
#
#<colorspec>
#rgbcolor "colorname" # e.g. "blue"
#rgbcolor "0xRRGGBB" # string containing hexadecimal constant
#
#FT=1
#if (FT == 1){
	set terminal pdfcairo enhanced color font "Times, 6" size 8.4cm, 5.94cm
	set output "format.pdf"
	set style line 1 lt 7 lw 1 pt 3  ps 0.5
	set style line 2 pt 12 lw 1.8 ps 0.8 lc rgb "green"
	set style line 3 pt 12 lw 1.8 ps 0.8 lc rgb "blue"
	set style line 4 pt 12 lw 1.8 ps 0.8 lc rgb "black"
	set output "format.pdf"
#}
#
#if (FT == 2){
#	set terminal png enhanced
#	set output "template.png"
#	set style line 1 pt 6  lc rgb "red"     lw 1.8 ps 2.0
#	set style line 2 pt 12 lc rgb "blue"    lw 1.8 ps 2.0
#}
#
show style line
plot besj0(x) ls 1, \
	besj1(x)ls 2, \
	besy0(x) ls 4
