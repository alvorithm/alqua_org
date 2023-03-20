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

leyenda = graph.key(pos='tr')
from math import exp, sqrt,log
def rel(x): return sqrt(x/(log(exp(x)+1)-log(2))-1)
g = graph.graphxy(width=6,
                  x=graph.linaxis(min=0, max=15 ,title=r"$\alpha(\nu_0) x=\ln {I(\nu_0,x) \over I(\nu_0,0)}$"),
                  y=graph.linaxis(title=r"$\delta \nu \over \Delta \nu$", min=0, max=1))
g.plot(graph.function("y=rel(x)", context=locals()))
g.finish()
g.writetofile(output_name)

if __name__=='__main__':
    import os
    os.system('gv %s' % output_name) 
