#-------------------------------------------------------#
# created     : 201/05/08				#
# last update : 201/05/08				#
# author      : Rafael Dexter <dexter.nba@gmail.com>	#
# notes       :						#
#-------------------------------------------------------#
clear
#SET TERMINAL
#set terminal pdfcairo enhanced font "Times" size 8.1cm,5.73cm
#set output "simple_1.pdf"
#
#set terminal svg size 600,400 dynamic enhanced fname 'arial'  fsize 10 mousing name "simple_1" butt dashlength 1.0 
#set output "simple_1.svg"
#
set terminal pdf enhanced font "Times" size 8.1cm,5.73cm
set output "simple_2.pdf"
#
set key inside left top vertical Right noreverse enhanced autotitle box lt black linewidth 1.000
#
set samples 50, 50
set title "Simple Plots" 
set title  font ",20" norotate
plot [-10:10] sin(x),atan(x),cos(atan(x))
#
#Comandos
#overwirte
#clear = O comando clear apaga a tela ou a saída do do dispositivo de corrente, conforme especificado por "set output".
#set output = Este comando redireciona a exibição para o arquivo especificado ou dispositivo.
#set terminal = Use "set terminal" para dizer ao gnuplot que tipo de saída deve gerar. Abreiação do comando "set term"
