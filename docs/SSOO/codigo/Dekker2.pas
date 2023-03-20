Program EMADS2

var turno:array[0..1] of boolean;

process 0
begin
   while true
   begin
	while turno[1] do {nada};
	   turno[0]:=true;
	   <sección crítica>
	   turno[0]:=false;
	   <resto de código>
   end;
end;

process 1
begin
   while true
   begin
	while turno[0] do {nada};
	   turno[1]:=true;
	   <sección crítica>
	   turno[1]:=false;
	   <resto de código>
   end;
end;
   
begin
   turno[0]:= false;
   turno[1]:= false;
   parbegin
      process0;
      process1;
   parend;
end;
   
	