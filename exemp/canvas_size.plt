#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/05/09													   #
# last update : 2015/05/09													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :	Exemplo canvas_size											   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
clear
set decimalsign "," # Para gráficos em potuguês.

# set term <terminal type> size <XX>, <YY>
#
# controla o tamanho da tela da saida do arquivo. Por padrão, o plot vai encher esta tela.
#
# set size <XX>, <YY>
#
# Dimensiona o plot em relação ao tamanho da tela. Valores de escala inferior a 1 fará com que o plot não preencha toda a tela. Valores de maior
# escala de 1 fará com que apenas uma parte do plot  na tela. Atenção, esteja ciente de que a fixação de valores de escala maior que 1 pode causar
# problemas em alguns tipos de terminais.
# EXEMPLO
#
set size 0.5, 0.5
set terminal pdfcairo size 600, 400
set output "canvas_size.pdf"
plot "data.dat" with lines
