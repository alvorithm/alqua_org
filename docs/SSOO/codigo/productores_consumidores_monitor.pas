program m_prod_cons

const
   capacidad = ...
var		 
   b1	: monitor
begin	
   buffer:array[1..capacidad] of dato;
   ent,sal:(1..capacidad);
   cuenta:(0..capacidad);
   puedeProducir,puedeConsumir:condition;
   
procedure mdepositor(pDato dato){público}
begin
   if(cuenta=capacidad) then puedeProducir.wait; {se bloquea el proceso que intenta producir}
   buffer[ent]:=pDato;
   ent:=(ent mod capacidad)+1;
   cuenta:=cuenta +1;
   puedeConsiumir.signal;
end; { mdepositor }

procedure mconsumir(var cDato	: dato){público}
begin
   if cuenta=0 then puedeConsumir.wait;
   cDato:=buffer[sal];
   sal:=(sal mod capacidad)+1;
   cuenta:=cuenta -1;
   puedeProducir.signal;
end; { mconsumir }
{inicialización}
ent:=1;
sal:=1;
cuenta:=0;

end;{m_prod_cons}
