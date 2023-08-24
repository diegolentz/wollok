import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.schedule(2000, { game.stop() })
	}
}

object silvestre { 

	method image() = "silvestre.png"

	method position() = game.at(pepita.position().x().max(3 ),0)
	
	method teEncontro(ave){
		game.say(ave,"fuiste...")
		game.onTick(2000,"PERDER",{game.stop()})
	}

}
