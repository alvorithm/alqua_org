{implementaci�n de un monitor}
wait_signal:monitor
begin
   ocupado:boolean;
   libre:condition;
procedure mwait
begin
   if ocupado then libre.wait;
   ocupado:=true;
end; { mwait }

procedure msignal
begin
   ocupado:=false;
   libre.signal;
end; { msignal }
{cuerpo del monitor}
ocupado:=false;
end;


process uno
[...]
wait_signal.mwait
<secci�n cr�tica>>
waitsignal.wsignal
[...]


process dos
[...]
wait_signal.mwait
<secci�n cr�tica>
wait_signal.msignal
[...]

   
   
   