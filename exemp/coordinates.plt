#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/08/14													   #
# last update : 2015/08/14													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :																   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
clear
set decimalsign "," # Para gráficos em potuguês.

# Os comandos "set arrow", "set key", "set label" e "set object" permitem você desenhar algo em uma posição arbitrária do gráfico. Esta posição é
# especificada pela sintaxe:
#
#	{<system>} <x>, {<system>} <y> {,{<system>} <z>}
#
# Cada <system> pode ser "first", "second", "graph", "screen", ou "character".
# "first" coloca as coordenadas x, y ou z no sistema definido pelos eixos esquerdo e inferior;
# "second" coloca no sistema definidas pelos eixos x2, y2 (cima e direita);
# "graph" especifica a área dentro dos eixos - 0,0 é inferior esquerdo e 1,1 é superior direito;
# "screen" especifica a área da tela (a área inteira - não apenas a parte selecionada pelo "set size") com 0,0 e 1,1 idem ao anterior;
# "character" dá a posição em larguras e alturas de caracteres a partir do canto inferior esquerdo da área da tela ("screen 0,0 "). Suas coordenadas
# dependem da escolha do tamanho da fonte;
#
#EXEMPLO
#
set terminal pdfcairo #size 600, 400
set output "coordinates.pdf"
#set logscale x
set arrow from  0.5, -0.5 to  0.5, 0.0 nohead
set arrow to 1,2 ls 5
plot sin(x)**2 lt 2 lw 2 title "sin^2(x)"
