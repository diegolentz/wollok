import hector.*
import wollok.game.*


class maiz {
	const property position
	var property adulto = false
	var evolucion = "baby"
	var property precio = 150
	
	method image() = "corn_" + evolucion + ".png"
	
	method estaListo() = self.adulto()

	method regada() {
		adulto = true
		evolucion = "adult"
	}
}


class trigo {
	const property position
	var property evolucion = 0
	const property max = 3
	var property precio = 100
	
	method image() = "wheat_" + evolucion + ".png"
	
	
	method regada(){
		evolucion += 1
		if(evolucion > max){
			evolucion = 0
		}		
	}
	method estaListo() = return  evolucion >= 2
}


class tomaco {
	var property position
	var property adulto = false
	var evolucion = "_baby"
	var property precio = 80
	
	method image() = "tomaco" + evolucion + ".png"
	
	method estaListo() = self.adulto()
	
	method regada(){
		adulto = true
		evolucion = "_adult"
		position = if (position.y() < 14){
			 position.up(1)}
			  else {game.at(position.y(),0)
		  		    //game.at(position.x(),8)	
	  		    	}
	}
	
	
	
	
}
