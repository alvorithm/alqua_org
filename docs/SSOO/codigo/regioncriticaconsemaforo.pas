program exclusion_mutua

var s:semaforo;

procedure P(i : integer)
begin
   repeat
	wait(s);
	<sección crítica>
	signal(s);
	<resto de código>
   forever
end;

begin
   s:=1;
   par begin
	P(1);
	P(2);
   par end
end;