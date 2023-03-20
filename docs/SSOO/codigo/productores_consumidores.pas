program prod_consum_sem
type
   dato =  ....
var
   buffer				 : array[capacidad] of dato;
   puedeProducir,puedeConsumir : Semaforo_General;
   pmutex,cmutex			 : SemaforoBinario;
   ent,sal				 : 1..capacidad;

procedure productorX
var
   pDato : dato;
begin
   while true do
   begin
	wait(puedePrducir); {comprobamos que podemos producir}
	pDato:=producir(); {producimos}
	wait(pmutex);
	buffer[ent]:=dato; {hay que llegar aquí en exclusión mutua para que no
				  haya conflictos. Por eso hay antes un semáforo binario}
	ent:=(ent mod capacidad)+1; {aquí está la idea de buffer circular}
	signal(pmutex); {liberamos la sección crítica}
	signal(puedeConsumir); {hacemos esto porque por cada elemento que deje en el buffer
					habrá un consumidor que lo pueda consumir y eso ha de quedar reflejado}
   end;
end; { productorX }

procedure consumidorZ
var
   cDato : dato
begin
   while true do
   begin
	wait(puedeConsumir); {sólo si hay datos en el buffer podremos consumir,
				    en caso contrario, nos quedaremos bloqueados}
	wait(cmutex);
	cDato:=buffer[sal]; {consumimos en exclusión mutua}
	sal:=(sal mod capacidad)+1; {dejamos la variable sal al siguiente slot del buffer}
	signal(cmutex);  {habilitamos de nuevo el que se pueda consumir}
	signal(puedeProducir); {nuevos productores podrán aprovechar el hueco dejado}
	consumir(cDato); {consumimos el datos propiamente}
   end;
end; { consumidorZ }

begin
   ent:=1;
   sal:=1;
   signal(cmutex);
   signal(pmutex);
   puedeConsumir:=0;
   for(i=1 to capacidad)do 
	signal(puedeProducir);  {por cada slot, habilitamos un proceso productor}
   par begin
	Productor1
	.
	Productorn
	Consumidor1
	.
	Consumidorn
   par end;
end;
