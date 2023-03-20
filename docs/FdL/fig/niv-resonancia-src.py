from pyx import *
c = canvas.canvas()


filename = "niv-resonancia"
level1 = path.line(0,0,4,0)
subir = trafo.trafo(matrix=((1,0),(0,1)), vector=(0,2))
level2 = level1.transformed(subir)

c.stroke(level1)
c.stroke(level2)
TEX = text.texrunner()
niv1 = TEX.text(-0.3,0.1,'1',text.valign.top)
niv2 = TEX.text(-0.3,2.1,'2',text.valign.top)
c.insert(niv1)
c.insert(niv2)
from math import pi
g = graph.graphxy(xpos=4,ypos=3,width=2,  x=graph.linaxis(min=0, max=1, painter=None), y=graph.linaxis(painter=None,title=r"$g(\nu_0',\nu)$"))
g.plot(graph.function("y=1/(0.01 + (x- 0.4)^2)",title = r"$g(\nu_0',\nu)$"))
c.insert(g,trafo.rotate(-90,4,3))
c.text(2,2.2,r"$n_{2}$")
c.text(2,0.2,r"$n_{1}$")
c.writetofile(filename)

if __name__=='__main__':
    import os
    os.system('gv %s' % filename +'.eps') 
