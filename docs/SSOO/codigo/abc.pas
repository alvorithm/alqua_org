program Ejabc
var
   a,b,c  : semaforoBinario;

procedure PA
begin
   while true do
	begin
	   wait(a);
	   printf("Soy A");
	   signal(b);
	end;
end;
procedure PB
begin
   while true do
	begin
	   wait(b);
	   printf("Soy B");
	   signal(c);
	end;
end;
procedure PC
begin
   while true do
	begin
	   wait(c);
	   printf("Soy C");
	   signal(a);
	end;
end;

begin
   
   a=1;
   b=0;
   c=0;
   
   parBegin
   PA;
   PB;
   PC;
   parend
end;