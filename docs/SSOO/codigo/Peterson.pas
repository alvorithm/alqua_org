Program Peterson
var
   se�al : array[0..1] of boolean;
   turno : 0..1;

procedure cero
begin
   repeat
	se�al[0]:=true;
	turno:=1;
	while se�al[1] and turno=1 do {nada};
	<seccion cr�tica>
	se�al[0]:=false;
	<resto de c�digo>
   forever
end;

procedure uno
begin
   repeat
	se�al[1]:=true;
	turno:=0;
	while se�al[0] and turno=0 do {nada};
	<seccion cr�tica>
	se�al[1]:=false;
	<resto de c�digo>
   forever
end;

begin
   turno:=0;
   se�al[0]:=false;
   se�al[1]:=false;
   par begin
	cero
	uno
   par end
end
	