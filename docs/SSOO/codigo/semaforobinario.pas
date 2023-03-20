type semaforo: record
   valor	: 0..1;
   cola	: list of proceso;
end;		

var s: semaforo;

wait(s);

   if s.valor = 1 then
	s.valor = 0;
   else begin
	   poner este proceso en cola
	   bloquear este proceso
   end;
end;


signal(s);

   if s.cola está vacía
	s.valor = 1;
   else begin
	   quitar proceso P de la cola
	   poner proceso P en la cola de preparados
   end;
end;