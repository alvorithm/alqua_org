set xlabel 'nu'
set term postscript eps
set output 'bombeo-destello-calculo-Wfe.eps'
plot [5:25] exp(-(x-16)**2/25) t 'Ib(nu)', 1/(1+(x-18)**2/0.1) t 'sigma_fe(nu)'
