#!/usr/bin/python
from pyx import *
import sys
c = canvas.canvas()
from math import exp
filename = "amort-critico"
leyenda = graph.key(pos='tr')
g = graph.graphxy(width=7, x=graph.linaxis(min=0, max=5, title=r"$\tau$"), y=graph.linaxis(min=0, max=0.5, title=r"$I(\tau)$"), key=leyenda)
def myfun(x): return x*exp(-x)
g.plot(graph.function("y=myfun(x)",title=r"$\alpha=1$",context=locals()),)
g.finish()
tpx, tpy = g.pos(.9,-0.1)
g.text(tpx,tpy,r"$\tau_p$")
tix, tiy = g.pos(1.9,-0.1)
g.text(tix,tiy,r"$\tau_i$")
Ipx,Ipy = g.pos(0.1,myfun(1))
g.text(Ipx,Ipy,r"$I_p$")
Iix,Iiy = g.pos(0.1,myfun(2))
g.text(Iix,Iiy,r"$I_i$")
g.writetofile(filename)

#Por hacer: incorporar marcas de seguimiento para los pares de puntos

if __name__=='__main__':
    import os
    os.system('gv %s' % filename +'.eps') 
