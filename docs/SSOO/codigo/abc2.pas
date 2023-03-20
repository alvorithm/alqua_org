program Ejabc2
var
   a,b,c	 : semaforoBinario;
   coontador :  integer;
procedure PA
begin
   while true do
	wait(a)
	if contador mod 2 = 0 then
	begin
	   printf("Soy A");
	   signal(b);
	end;
      else
	Begin
	   printf("A");
	   signal(c);
	end;
end;
procedure PB
begin
   while true do
	wait(b)
	if contador mod 2 =0 then
	begin
	   printf("Soy B");
	   signal(c);
	end;
      else
	Begin
	   printf("B");
	   signal(a);
	end;
end;
procedure PC
begin
   while true do
	wait(c)
	contador = contador +1
	if contador mod 2 = 0 then
	Begin
	   printf("C");
	   signal (a);
	end;
      else
	Begin
	   printf("C");
	   signal(b);
	end;
end;
begin
   a=1;
   b=0;
   c=0;
   contador = 0;
   parBegin
   PA;
   PB;
   PC;
   parend
end;