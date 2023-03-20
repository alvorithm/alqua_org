program cenaFilosofos
var
   tenedor	  : array[1..4] of semaforoBinario; {número de filósofos}
   i		  : integer;
   habitacion : semaforoGeneral;
		

process filosofo(i)
begin
   while true do
   begin
	wait (habitacion);
	wait (tenedor[i]);
	wait (tenedor[(i+1) mod 4]);
	comer;
	signal (tenedor[i]);
	signal (tenedor[(i+1) mod 4]);
	signal (habitacion);
	pensar;
   end;
end;

begin
   habitacion = 3;
   for (i==1 to 4) do
	tenedor[i]==1;
   parbegin
     filosofo(1);
   .
   .
   .
     filosofo(4)
   parend
end;
