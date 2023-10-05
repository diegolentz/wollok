import mensajeros.*
object brooklyn {

	method dejarPasar(mensajero) {
		return mensajero.peso() < 1000
	}
}
// object matrix
object matrix {
	method dejarPasar(mensajero){
		return mensajero.puedeLlamar()
	}
}

