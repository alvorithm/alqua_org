set xlabel "tau"
set ylabel "I(tau)"
plot [x=0:20] exp(-sqrt(2)*x)*sinh(sqrt(1)*x) title "alfa=sqrt(2), I0=1"
replot 0.5*exp(-0.3*x)*sin(sqrt(1-0.09)*x) title "alfa=0.3, I0=0.5"
replot x*exp(-x) title "alfa=1"

set term postscript eps
#usar epslatex en el futuro para corregir el aspecto de los textos.
set output "circuito-amortiguado.eps"
replot
