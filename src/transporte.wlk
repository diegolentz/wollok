

object bicicleta {

	method peso() {
		return 1
	}
}
object camion {
	var property acoplados = 2

	method peso() {
		return acoplados * 500
	}

	method acoplados(cantAcoplados) {
		acoplados = cantAcoplados
	}
}

