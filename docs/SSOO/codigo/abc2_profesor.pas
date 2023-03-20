program Ejabc2_profesor
var
   a,b,c,d : semaforoBinario;
   turno : 0..1;
   
procedure PA
begin
   while true do
	begin
	   wait(a)
	   while turno<>0 do {nada};
	   printf("SoyA");
	   turno:=1;
	   signal(c);
	end; 
end; { PA }

procedure PB
begin
   while true do
	wait(b)
	while turno<>1 do {nada};
	begin
	   printf("Soy B");
	   turno:=0;
	   signal(d);
	end;
end; { PB }


procedure PC
begin
   while true do
	begin
	   wait(c)
	   wait(d)
	   printf("C");
	   if turno=0 then
		turno = 1
	   else
		turno = 0

		signal(a);
	   signal(b);
	end;
end;

Begin
   
   a=1;
   b=1;
   c=0;
   d=0;
   turno = 0;
   
   parBegin
   PA;
   PB;
   PC;
   parend
end;