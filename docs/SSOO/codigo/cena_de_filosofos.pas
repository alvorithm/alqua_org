program cenaFilosofos
var
   tenedor : array[1..4] of semaforoBinario; {número de filósofos}
   i	     : integer;

process filosofo(i:integer)
begin
   while true do
   begin
	wait (tenedor[i]);
	wait (tenedor[(i+1) mod 4]);
	comer;
	signal (tenedor[i]);
	signal (tenedor[(i+1) mod 4]);
	pensar;
   end;
end;

begin
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
