Program EMADS1

var turno:0..1;

process 0
begin
   <bucle infinito en donde el proceso 0 comprueba la variable turno>
   <es decir, si no es su turno de ejecuci�n, no realiza nada.>
   <En caso contrario ejecutar� la secci�n cr�tica y da el paso al>
   <siguiente proceso.>
   while true
   begin
	while turno<>0 do {nada};
	   <secci�n cr�tica>
	   turno:=1;
	   <resto de c�digo>
   end;
end;

process 1
begin
   while true
   begin
	while turno<>1 do {nada};
	   <secci�n cr�tica>
	   turno:=0;
	   <resto de c�digo>
   end;
end;
   
begin
   turno:=0;
   parbegin
      process0;
      process1;
   parend;
end;
   
	