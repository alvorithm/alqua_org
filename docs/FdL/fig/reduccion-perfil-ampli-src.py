from pyx import *
c = canvas.canvas()


filename = "reduccion-perfil-ampli"
leyenda = graph.key(pos='tr')
from math import exp
g = graph.graphxy(width=7,
                  x=graph.linaxis(min=0, max=3, title=r"$\nu$"),
                  y=graph.linaxis(title=r"$g(\nu_0,\nu)$", min=0),
                  y2=graph.linaxis(title=r"$\alpha_T(\nu)$",min=1,max=exp(1/0.02)),
                  key=leyenda)
g.plot(graph.function("y=1/(0.02+(x-1)^2)",title=r"luminiscencia"))
g.plot(graph.function("y2=(1/(0.02+(1)^2))*exp(1/(0.02+(x-1)^2))",title=r"amplificaci\'on", points=1000))
g.finish()
g.writetofile(filename)

if __name__=='__main__':
    import os
    os.system('gv %s' % filename +'.eps') 
