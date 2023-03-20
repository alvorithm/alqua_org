set xlabel 'm'
set ylabel 'tau/tc'
set term postscript eps
set output 'inestabilidad-oscilante.eps'
plot [x=0:6] [0:4] x**2/(4*(x-1)) t 'frontera de oscilación', x/4 t 'asíntota'