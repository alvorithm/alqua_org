Program EMADS2

var turno:array[0..1] of boolean;

process 0
begin
   while true
   begin
	while turno[1] do {nada};
	   turno[0]:=true;
	   <secci�n cr�tica>
	   turno[0]:=false;
	   <resto de c�digo>
   end;
end;

process 1
begin
   while true
   begin
	while turno[0] do {nada};
	   turno[1]:=true;
	   <secci�n cr�tica>
	   turno[1]:=false;
	   <resto de c�digo>
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
   
	