font-family = 'Serif'
font-size = 1.10em
font-weight = 300
font-color = black

function handler(e)
	if (e.class == 'ncl' and e.type == 'presentation' and e.action=='start') then
		print("PULSE EL BOTON ROJO DEL CONTROL") io.flush()
		exibeTexto("PULSE EL BOTON ROJO DEL CONTROL")
	end
end
function exibeTexto(texto)
	canvas:attrFont(font-family, font-size, font-weight)
	canvas:attrColor(font-color)
	canvas:drawText(0,0, texto)
	canvas:flush()
end
event.register(handler)
