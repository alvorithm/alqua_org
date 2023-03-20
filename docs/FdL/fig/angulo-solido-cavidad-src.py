#!/usr/bin/python
# 
# File: angulo-solido-cavidad-src.py
# Author: Alvaro Tejero Cantero <alvaro@antalia.com>
# License: GNU General Public License Version 2 (GPLv2), incorporated herein by
# reference
# Id: $Id$
#


from pyx import *
import math
import sys
script_name = sys.argv[0]
output_name = ".".join(script_name.split(".")[:-1])[:-4] + ".eps"

l = 5.
a = 1.
fe = 1.2

escal = trafo.trafo().scaled(fe)
escal2 = trafo.trafo().scaled(fe,fe,0,a)

c = canvas.canvas()
b = box.rect(0,0,l,a, relcenter=(0.5,0.5))

diag1 = path.line(0,0,fe*l,fe*a)
a1=180*math.atan(a/l)/math.pi
a2 = -a1
diag1.append(path.arcn(l/2,a/2,fe*l/2,a1,a2))
diag2 = path.line(0,a,l,0).transformed(escal2)
c.text(fe*l,a/2, r'$\Delta\Omega$')
c.text(l/2,a/16, r'$l$')
c.text(0.1,a/4, r'$a$')
c.stroke(b.path(centerradius=0.02))
c.stroke(diag1, canvas.linestyle.dashed)
c.stroke(diag2, canvas.linestyle.dashed)
c.writetofile(output_name)

if __name__ == '__main__':
    import os
    os.system('gv %s' % output_name)
    
