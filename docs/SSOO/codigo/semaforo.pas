type semaforo: record
   contador	: entero;
   cola	: list of proceso;
end;		

var s: semaforo;

wait(s);
   s.contador:=s.contador -1;
   if s.contador < 0
	then begin
	   poner este proceso en cola
	   bloquear este proceso
	end

signal(s);
   s.contador := s.contador +1;
   if s.contador <=0
	then begin
	   quitar proceso P de la cola
	   poner proceso P en la cola de preparados
	end;