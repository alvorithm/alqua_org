Program EMADSF

var
   se�al : [0..1] of boolean;
turno	   : 0..1;   
   
process cero
begin
   while true do
   begin
	se�al[0]:=true;
	while se�al[1] do
	begin
	   if (turno=1) then
	   begin
		se�al[0]:=false;
		while turno=1 do {nada};
		se�al[0]=true;
	   end
	end
	<seccion cr�tica>
	turno:=1;
	se�al[0]:=false;
	<resto de c�digo>
   end;
end;

process uno
begin
   while true do
   begin
	se�al[1]:=true;
	while se�al[0] do
	   begin
		if (turno=0) then;
	   begin
		se�al[1]:=false;
		while turno=0 do {nada};
		   se�al[1]:=true;
	   end;
	end;
	<regi�n cr�tica>
	turno:=0;
	se�al[1]:=false;
	<resto de c�digo>
   end;
end;
   
begin
   turno:=0;
   se�al[0]:=false;
   se�al[1]:=false;
   parbegin
      process cero;
      process uno;
   parend;
end;
   
	