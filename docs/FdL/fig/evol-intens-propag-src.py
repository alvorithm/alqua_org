#!/usr/bin/python
# 
# File: evol-intens-propag-src.py
# Author: Alvaro Tejero Cantero <alvaro@antalia.com>
# License: GNU General Public License Version 2 (GPLv2), incorporated herein by
# reference
# Id: $Id$
#


from pyx import *
import sys
script_name = sys.argv[0]
output_name = ".".join(script_name.split(".")[:-1])[:-4] + ".eps"

c = canvas.canvas()
filename = "evol-intens-propag"
leyenda = graph.key(pos='tr')
g = graph.graphxy(width=7, x=graph.linaxis(min=0, max=1, title=r"$x$"), y=graph.linaxis(min=0, max=30, title=r"$I_\nu(x)$"), key=leyenda)
g.plot(graph.function("y=15*exp(x)",title=r"$ {{n_2} \over {g_2}} > {{n_1} \over {g_1}} $"))
g.plot(graph.function("y=15*exp(-4*x)",title=r"${{n_2} \over {g_2}} < {{n_1} \over {g_1}} $"))
g.finish()
I0x, I0y = g.pos(0-.1, 15)
g.text(I0x,I0y,r"$I(0)$")
g.writetofile(output_name)

if __name__=='__main__':
    import os
    os.system('gv %s' % output_name) 
