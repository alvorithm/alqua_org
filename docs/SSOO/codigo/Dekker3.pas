Program EMADS3

var turno:array[0..1] of boolean;

process 0
begin
   while true
   begin
	turno[0]:=true;
	while turno[1] do {nada};
	   <sección crítica>
	   turno[0]:=false;
	   <resto de código>
   end;
end;

process 1
begin
   while true
   begin
	turno[1]:=true;
	while turno[0] do {nada};
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
   
	