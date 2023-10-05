import destinos.*
import mensajeros.*

object paquete {
	var pago = false
	var destino = brooklyn

	method pagar() {
		pago = true
	}

	method estaPago() {
		return pago
	}

	method destino(lugar) {
		destino = lugar
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
}

object paquetito {
	 
	 method precio(){
 		return 0
	}
	
	method puedeSerEntregadoPor(mensajero) {
		return true
	}	
	
}

object paqueton {
	const destinos = [matrix,brooklyn]
	var property paquete = 50
	var property dest = 100
	var pagando = 0
	
	method precio(){
		return paquete + destinos.size()*dest
	}
	method pagar(valor){
			pagando += valor
	}
	method estaPago(){
		return pagando >= self.precio()
	}
	method puedeSerEntregadoPor(mensajero) {
		return self.estaPago() && self.pasaLugares(mensajero) 
	}
	method pasaLugares(mensajero) {
		//TODO: Código autogenerado 
		return destinos.all{x=>x.dejarPasar(mensajero)}
	}	
	
	
	
	
	
	
	
	
	
	
	
}