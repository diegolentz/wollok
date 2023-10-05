import wollok.game.*
import cultivos.*

object hector {
	var property position = new Position(x = 3, y = 3)
	const property image = "player.png"
	var property oro = 0
	const property cultivos = []
	
	method puedeCultivar(){
		return game.colliders(self).isEmpty()
	}
	
	method sembrarMaiz() {
		if(self.puedeCultivar()){
			game.addVisual(new maiz(position = position))
			
		}
	}
	
	method sembrarTrigo(){
		if(self.puedeCultivar()){
			game.addVisual(new trigo(position = position))
		}
	}
	 	
	method sembrarTomaco(){
		if(self.puedeCultivar()){
			game.addVisual(new tomaco(position = position))
		}
	}
	
	method regar(){
		if(game.colliders(self).isEmpty()){
			game.say(self,"no hay nada para regar")
		}else game.uniqueCollider(self).regada()
	}
	
	method regada(){
		game.say(self,"guarda las llantas")
	}
	
	method cosechar(){
		const cultivo = (game.uniqueCollider(self))
		if (game.colliders(self).isEmpty()) {
			game.say(self, "No hay que cosechar iluso")
		} else if (cultivo.estaListo()) {
			game.removeVisual(game.uniqueCollider(self))
			cultivos.add(cultivo)
		}
	}
	method vender(){
		oro += cultivos.sum({cult => cult.precio()})
		cultivos.clear()
	}
	method informe() {
		var size = cultivos.size()
		game.say(self, "tengo " + oro + " oro y "+size+" plantas para vender")
	}
}