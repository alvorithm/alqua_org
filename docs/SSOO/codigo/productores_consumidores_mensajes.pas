program prod_cons_mensj

type
   mensaje =  record...;

const
   capacidad = ...;
   nulo	 = ...; {mensaje vac�o}

var
   i : integer

process productorX
var
   pmsj : mensaje
begin
   while true do
   begin
	receive(puedeProducir,pmsj);
	pmsj:=producir();
	send(puedeConsumir,pmsj);
	<resto de c�digo>
   end;
end;
process consumidorZ
var
   cmsj : mensaje;
begin
   while true do
   begin
	receive(puedeConsumir,cmsj);
	consumir(cmsj);
	send(puedeProducir,cmsj);
	<resto de c�digo>
   end;
end;

{proceso general}
begin
   crear_buzon(puedeProducir);
   crear_buzon(puedeConsumir);
   for i:=1 to capacidad do:
	send(puedeProducir,nulo); {inicializamos a nulo}
   
   initiate
   productor1
   [...]
   productorn
   consumir1
   [...]
   consumidorn
end;
end;
