import extras.*
import wollok.game.*
import comidas.*

object pepita {

	var property energia = 100
	var property position = game.origin()
	var nodama = false

	method image() {
		return if (self.estaEnElNido()) {
			 "pepita-grande.png" 
		}else if (self.Silvestre() || self.nodama()  ) {
			 "pepita-gris.png" 
		}else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
	    if (not self.nodama()) {
	        self.vola(position.distance(nuevaPosicion))
	        position = nuevaPosicion
	    } else {
	        game.say(self, "no doy más")
	       	 game.onTick(10000,"fin del juego",{game.stop()}) 
	    }
	    
	    game.onTick(8000,"gravedad",{self.gravedad()})
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method Silvestre(){
		return position == silvestre.position()
	}
	
	method nodama() {
		return energia <= 0
		
	}
	method gravedad(){
		position = game.at(position.x() , 0.max(position.y() - 1))
	}
}
