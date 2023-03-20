Program Peterson
var
   señal : array[0..1] of boolean;
   turno : 0..1;

procedure cero
begin
   repeat
	señal[0]:=true;
	turno:=1;
	while señal[1] and turno=1 do {nada};
	<seccion crítica>
	señal[0]:=false;
	<resto de código>
   forever
end;

procedure uno
begin
   repeat
	señal[1]:=true;
	turno:=0;
	while señal[0] and turno=0 do {nada};
	<seccion crítica>
	señal[1]:=false;
	<resto de código>
   forever
end;

begin
   turno:=0;
   señal[0]:=false;
   señal[1]:=false;
   par begin
	cero
	uno
   par end
end
	