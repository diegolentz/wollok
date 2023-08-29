// Poder definir cantidad de víveres que tiene (en porcentaje)  
// y un monto de reparaciones (en pesos) para la casa

// Saber si la casa tiene víveres suficientes
// casa.tieneViveresSuficientes() -> Booleano

// Saber si hay que hacer reparaciones
// casa.hayQueHacerReparaciones() -> Booleano

// Saber si la casa está en orden
// casa.estaEnOrden() -> Booleano

// Poder elegir una cuenta para los gastos de la casa
// OPCION 1: 3 OBJETOS CUENTAS
// casa.usarCuenta(cuentaCorriente)
// casa.usarCuenta(cuentaConGastos)


// OPCION 2: 1 OBJETO CUENTA QUE ENTIENDE 3 MENSAJES
// casa.usarCuenta(cuentaElegida) // cuentaElegida tiene 3 métodos

// Como estamos creando un modelo y no la realidad, no es necesario
// introducir un objeto que modele a las personas, se puede encargar 
// la casa, que es tan objeto como los otros.
// pepeYJulian.usarCuenta(cuentaCorriente)
// pepeYJulian.usarCuenta(cuentaConGastos)


// Generar un gasto por un importe determinado en la casa
// casa.gastar(1000)

object casa { 
	const viveres = 50 // porcentual
	var costoDeReparaciones = 0
	var cuenta
	
	method tieneViveresSuficientes() = viveres > 40

	method hayQueHacerReparaciones() = costoDeReparaciones > 0
	
	method estaEnOrden() = 
		not self.hayQueHacerReparaciones() 
		and self.tieneViveresSuficientes()
		
	method romper(monto) {
		costoDeReparaciones = costoDeReparaciones + monto
	}
	
	method usarCuenta(unaCuenta) {
		cuenta = unaCuenta
	}
	
	method gastar(importe) {
		// sacar plata de la cuenta que se esté usando
		cuenta.extraer(importe)
		// No saber qué método se va a ejecutar
		// Porque puede usar INDISTINTAMENTE cualquier objeto cuenta
		// Esto se conoce como POLIMORFISMO
		
		// Acá hay un solo mensaje, pero son varios los métodos (posibles) que puede ejecutar
	}
	
	method hacerMantenimiento(estrategiaDeAhorro) {
		// Si la lógica de mantenimiento depende de la estegia,
		// Lo mejor es delegar en ella.		
		estrategiaDeAhorro.mantenimiento(self)
	}
}

// OPCION 1: 3 OBJETOS CUENTAS
object cuentaCorriente {
	var saldo = 1000
	method depositar(importe) { saldo = saldo + importe }
	method extraer(importe) { saldo = saldo - importe }
}

object cuentaConGastos {
	var saldo = 0
	var costoDeOperacion = 0
	
	method costoDeOperacion(costo) { costoDeOperacion = costo }
	method saldo() = saldo
	
	method depositar(importe) { saldo = saldo + (importe - costoDeOperacion) }
	method extraer(importe) { saldo = saldo - importe }
}

object cuentaCombinada {
	method extraer(importe) { }
}


// OPCION 2: 1 OBJETO CUENTA QUE ENTIENDE 3 MENSAJES
object cuentaElegida {
	method depositarEnCuentaCorriente(importe) { }
	method depositarEnCuentaConGastos(importe) { }
	method depositarEnCuentaCombinada(importe) { }
}
// Para llegar a un solución con polimorfismo es necesario tener 
// varios objetos que entiendan el mismo mensaje.
// Acá se tiene un solo objeto con 3 métodos, por lo tanto no se puede logar.


// Menteniendo la casa
// Opción 1
// casa.hacerMantenimiento(minimo)
// casa.hacerMantenimiento(full)
// Se tiene un objeto por cada estrategia.

object minimo {
	method mantenimiento(unaCasa) { }
}

object full {
	method mantenimiento(unaCasa) { }
}


// Opción 2
// casa.mantenimientoMinimo()
// casa.mantenimientoFull()
// La casa es la que se encarga de saber cómo se hacen TODOS los mantenimientos
// "God Object" -> El objeto que sabe y hace de todo -> Esto es malo.
// "Cohesión" -> Hacer cosas específicas -> Cantidad de responsabilidades chicas
// Si aparecen nuevas casas, estaríamos tentados a duplicar lógica

// Opción 3
// mantenimiento.minimo(casa)
// mantenimiento.full(casa)
// Seguimos teniendo TODAS las estrategias en un solo objeto -> Ojo con la "cohesión"
// Al tener métodos distintos, estoy obligado a saber qué mantenimiento se desea hacer.
// |-> No hay posibilidad de polimorfismo -> Tendencia al if


object mentenimiento {
	method minimo() {
//		casa.asdkjalskdjlask() 
//      OJO que acá la casa está "hard codeada"
	}

	method minimo(unaCasa) {
		// hago la lógica correspondiente y delego en la casa
	}

	method full(unaCasa) {
		// hago la lógica correspondiente y delego en la casa
	}
}

// 3 y medio de formas de que un objeto conozca a otro:
// 1) Llamando al objeto globalmente (aka: "hard-codear")
// 2) Por un atributo (Por ejemplo, la casa y su cuenta)
// 3) Por parámetro en un mensaje (las cuentas y los importes)
// 4) Pedírselo a otro objeto (Por ejemplis, si la casa necesita el saldo de la cuenta, se lo pide a ella)