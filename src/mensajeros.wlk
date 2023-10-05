// Mensajeros de pelicula, primera parte
import destinos.*
import transporte.*
import paquete.*

object roberto {
	const peso = 90
	var property transporte = camion

	method peso() {
		return peso + transporte.peso()
	}

	method puedeLlamar(){
		return false
	}
}

// object chuck 

object chukNorris {
	const peso = 900
	
	method peso() {
		return peso 
	}
	
	method puedeLlamar(){
		return true
	}
}
// object neo {}
object neo {
	const peso = 0
	var credito = false
	
	method peso() {
		return peso 
	}
	
	method puedeLlamar(){
		return credito
	}
	method recarga(){
		credito = true
	}	
	
}


