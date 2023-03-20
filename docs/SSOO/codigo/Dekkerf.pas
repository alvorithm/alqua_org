Program EMADSF

var
   señal : [0..1] of boolean;
turno	   : 0..1;   
   
process cero
begin
   while true do
   begin
	señal[0]:=true;
	while señal[1] do
	begin
	   if (turno=1) then
	   begin
		señal[0]:=false;
		while turno=1 do {nada};
		señal[0]=true;
	   end
	end
	<seccion crítica>
	turno:=1;
	señal[0]:=false;
	<resto de código>
   end;
end;

process uno
begin
   while true do
   begin
	señal[1]:=true;
	while señal[0] do
	   begin
		if (turno=0) then;
	   begin
		señal[1]:=false;
		while turno=0 do {nada};
		   señal[1]:=true;
	   end;
	end;
	<región crítica>
	turno:=0;
	señal[1]:=false;
	<resto de código>
   end;
end;
   
begin
   turno:=0;
   señal[0]:=false;
   señal[1]:=false;
   parbegin
      process cero;
      process uno;
   parend;
end;
   
	