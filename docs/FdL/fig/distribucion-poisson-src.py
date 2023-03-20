#!/usr/bin/python
# 
# File: distribucion-poisson-src.py
# Author: Robert Jordens <jordens@debian.org>
# License: GNU General Public License Version 2 (GPLv2), incorporated herein by
# reference
# Id: $Id$
#
#

import sys
import string
from math import *
from pyx import *

script_name = sys.argv[0]
output_name = ".".join(script_name.split(".")[:-1])[:-4] + ".eps"
#output_name = string.join(string.split(script_name, ".")[:-1], ".") + ".eps" 
        # smart generation of output
width = 10
minx = 1
maxx = 15
a = 2

text.set(mode="latex")

fac = lambda x: reduce(lambda a, b: a * b, range(1, int(x + 1))) # factorial

g = graph.graphxy(width = width, key = graph.key(pos = "tr"),
        x = graph.linaxis(min = minx, max = maxx, title = r"$n$"),
        y = graph.linaxis(min = 0, title = r"$\left|c_n(\alpha)\right|^2$"))

g.plot(graph.function("y=exp(-abs(a)^2)*abs(a)^(2*x)/fac(x)", 
        points = maxx - minx, # only draw integer points
        title = r"$\left|c_n(\alpha)\right|^2= \
                \exp\left(-|\alpha|^2\right)\frac{|\alpha|^{2n}}{n!}$, \
                $\alpha=2$",
        context = locals()), # to import fac
        style = graph.symbol(size = "0.1 cm")) # use little crosses

g.writetofile(output_name)

