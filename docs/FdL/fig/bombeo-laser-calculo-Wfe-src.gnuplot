set xlabel 'nu'
set term postscript eps
set output 'bombeo-laser-calculo-Wfe.eps'
plot [5:25] exp(-(x-18)**2/0.2) t 'Ib(nu)', 1/(1+(x-19)**2/4) t 'sigma_fe(nu)'
