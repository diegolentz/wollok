import config.*
import cultivos.*
import wollok.game.*

class regador{
	const property position = game.center()
	const property image = "aspersor.png"
	
	
	method regarCultivosAlrededor() {
		self.cultivosAlrededor().forEach({ cultivo => cultivo.regada()})
	}

	// obtengo la lista de posiciones y hago un map para obtener el objeto en esa posicion
	method cultivosAlrededor() = self.posicionesAlrededor().flatMap({ posicion => game.getObjectsIn(posicion)})
	
	//meto en una lista los laterales y luego las esquinas
	method laterales() = [ position.up(1), position.left(1), position.down(1), position.right(1) ]
	method esquinas() = [ position.up(1).left(1), position.up(1).right(1), position.down(1).left(1), position.down(1).right(1) ]
	
	//obtengo todas las coordenadas, ahora puedo aplicar flatmap
	method posicionesAlrededor() = self.laterales() + self.esquinas()
	
}
