program exclusion_mutua

var s:semaforo;

procedure P(i : integer)
begin
   repeat
	wait(s);
	<secci�n cr�tica>
	signal(s);
	<resto de c�digo>
   forever
end;

begin
   s:=1;
   par begin
	P(1);
	P(2);
   par end
end;