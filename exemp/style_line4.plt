#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
# created     : 2015/08/14													   #
# last update : 2015/08/14													   #
# author      : Rafael Dexter <dexter.nba@gmail.com>						   #
# notes       :																   #
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
set terminal pdfcairo enhanced color font "Times, 8" fontscale 0.5 background "#C0C0C0" size 8cm, 8cm
set output "style_line4.pdf"
set label 1 "arrowstyle 1:" at -520.000, -100.000, 0.00000 right norotate back nopoint
set label 2 "arrowstyle 2:" at -520.000, -110.000, 0.00000 right norotate back nopoint
set label 3 "arrowstyle 3:" at -520.000, -120.000, 0.00000 right norotate back nopoint
set label 4 "arrowstyle 4:" at -520.000, -130.000, 0.00000 right norotate back nopoint
set label 5 "arrowstyle 5:" at -520.000, -140.000, 0.00000 right norotate back nopoint
set label 6 "arrowstyle 6:" at -520.000, -150.000, 0.00000 right norotate back nopoint
set label 7 "arrowstyle 7:" at -520.000, -160.000, 0.00000 right norotate back nopoint
set label 8 "arrowstyle 8:" at -520.000, -170.000, 0.00000 right norotate back nopoint
set arrow 1 from -500.000, -100.000, 0.00000 to 500.000, -100.000, 0.00000 head back filled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 size screen  0.025,30.000,45.000
set arrow 2 from -500.000, -110.000, 0.00000 to 500.000, -110.000, 0.00000 head back nofilled linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,90.000
set arrow 3 from -500.000, -120.000, 0.00000 to 500.000, -120.000, 0.00000 head back filled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,45.000
set arrow 4 from -500.000, -130.000, 0.00000 to 500.000, -130.000, 0.00000 head back filled linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,90.000
set arrow 5 from -500.000, -140.000, 0.00000 to 500.000, -140.000, 0.00000 heads back filled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,135.000
set arrow 6 from -500.000, -150.000, 0.00000 to 500.000, -150.000, 0.00000 head back empty linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,135.000
set arrow 7 from -500.000, -160.000, 0.00000 to 500.000, -160.000, 0.00000 nohead back nofilled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1
set arrow 8 from -500.000, -170.000, 0.00000 to 500.000, -170.000, 0.00000 heads back nofilled linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.008,90.000,90.000
set style line 1  linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 pointtype 7 pointsize 0.500 pointinterval 0
set style line 2  linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 pointtype 7 pointsize 0.500 pointinterval 0
set style arrow 1 head back filled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 size screen  0.025,30.000,45.000
set style arrow 2 head back nofilled linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,90.000
set style arrow 3 head back filled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,45.000
set style arrow 4 head back filled linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,90.000
set style arrow 5 heads back filled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,135.000
set style arrow 6 head back empty linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.030,15.000,135.000
set style arrow 7 nohead back nofilled linecolor rgb "dark-violet"  linewidth 2.000 dashtype 1
set style arrow 8 heads back nofilled linecolor rgb "skyblue"  linewidth 2.000 dashtype 1 size screen  0.008,90.000,90.000
set xtics border in scale 0,0 mirror norotate  autojustify
set ytics border in scale 0,0 mirror norotate  autojustify
set ztics border in scale 0,0 nomirror norotate  autojustify
set cbtics border in scale 0,0 mirror norotate  autojustify
set rtics axis in scale 0,0 nomirror norotate  autojustify
set paxis 1 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 1 tics autofreq  rangelimit
set paxis 2 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 2 tics autofreq  rangelimit
set paxis 3 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 3 tics autofreq  rangelimit
set paxis 4 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 4 tics autofreq  rangelimit
set paxis 5 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 5 tics autofreq  rangelimit
set paxis 6 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 6 tics autofreq  rangelimit
set paxis 7 tics border in scale 0,0 nomirror norotate  autojustify
set paxis 7 tics autofreq  rangelimit
set title "Top: plot with vectors arrowstyle 1, Bottom: explicit arrows" 
set xrange [ -1000.00 : 1000.00 ] noreverse nowriteback
set yrange [ -178.000 : 86.0000 ] noreverse nowriteback
i = 8
myencoding = "utf8"
x = 3.3
## Last datafile plotted: "arrowstyle.dat"
plot 'data.dat' using 1:2:(0):3 notitle with vectors arrowstyle 3
