Program EMADS4

var turno:array[0..1] of boolean;

process 0
begin
   while true do
   begin
	turno[0]:=true;
	while turno[1] do
	   begin
		turno[0]:=false;
		delay(random)
		turno[0]:=true;
	   end
	<seccion cr�tica>
	turno[0]:=false;
	<resto de c�digo>
   end;
end;

process 1
begin
   while true
   begin
	turno[1]:=true;
	while turno[0] do;
	  begin
	     turno[1]:=false;
	     delay(random)
	     turno[1]:=true;
	  end;
	<regi�n cr�tica>
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
   
	