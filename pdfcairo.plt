#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/08/14													   #
# last update : 2015/08/14													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :																   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
clear
set decimalsign "," # Para gráficos em potuguês.
# SET TERMINAL PDFCAIRO
# Syntax
# set term pdfcairo 
#	{{no}enhanced} {mono|color}
#	{font <font>} {fontscale <scale>}
#	{linewidth <lw>} {rounded|butt|square} {dashlength <dl>}
#	{background <rgbcolor>}
#	{size <XX>{unit},<YY>{unit}}
#
# Este terminal suporta um modo de texto melhorado, que permite fonte e outros comandos de formatação (subscritos, sobrescritos, etc.) para ser 
# incorporado em rótulos e outras cadeias de texto. A sintaxe modo de texto "enhanced" é compartilhada com outros tipos de terminal gnuplot.
#
# EXEMPLOS
#
# 
#set terminal pdfcairo enhanced font "" size 8.1cm,5.73cm
#set output "simple_1.pdf"

set terminal pdfcairo enhanced font "Cabin" size 8.1cm,5.73cm
set output "exemplo_1.pdf"
set title "Normal Distribution Function"
plot [-3:3][0:1] norm(x)
#
#set title "Inverse Error Function"
#plot [-1:1] inverf(x)
#
#	
#set title "Inverse Normal Distribution Function"
#plot [0:1] invnorm(x)
