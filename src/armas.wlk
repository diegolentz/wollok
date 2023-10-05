import rolando.*
import moradas.*

object espada {
	var estaNew = true
	
	method poderBrinda(personaje){
		return personaje.poderBase() * self.usos()
	}
	
	method usos(){
		return if (estaNew) 1 else 0.5
	}
	
	method usar(personaje){
		estaNew = false
	}
}

object collar {
	const puntos = 3	
	var vecesUso = 0
		
	method poderBrinda(personaje){
		return  puntos + self.usos(personaje)
	}
	method usos(personaje){
		return if(personaje.poderBase() > 6) vecesUso else 0
	}
	method usar(personaje){
		vecesUso += 1
	}	
}
	
object armadura {
	const poder = 6
	
	method poderBrinda(personaje){
		return 	poder	
	}
	method usar(personaje){
		
	}	
}

object libro {
	var property hechizos = []
	
	//esto quedaria mejor con una clase, pero tratandose de objetos lo resolvi asi
	
	method agregarHechizo(maldicion){
		hechizos.add(maldicion)
	}
	
	method poderBrinda(personaje) = if(self.quedanHechizos()) self.hechizoActual().poderBrinda(personaje) else 0
			
	method usar(personaje){
		if(self.quedanHechizos()){
			hechizos.remove(self.hechizoActual())
		}
	}
	method quedanHechizos() {
		return not hechizos.isEmpty()
	}
	method hechizoActual() {
		return hechizos.head()
	}
}

object bendicion{
	const poder = 4
	
	method poderBrinda(personaje){
		return poder
	}
}

object invisibilidad{
	method poderBrinda(personaje){
		return personaje.poderBase()
	}
}

object invocacion{
	method poderBrinda(personaje){
		return castillo.artefactoMasPoderoso(personaje).poderBrinda(personaje)
	}
}
