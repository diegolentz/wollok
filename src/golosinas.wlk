import mariano.*
class Bombon {
		var property precio = 5
		var property peso = 15
		const property gusto = "frutilla"
		const property libreGluten = false
		
		method mordisco(){peso = peso *0.8 - 1}
}

class BombonDuro inherits Bombon {
	override method mordisco(){
		peso = peso * 0.9
	}
}

class Caramelo {
	var peso = 5
	var gusto = "frutilla"
	
	method precio() {
		return 1
	}
	
	method peso() {
		return peso
	}
	
	method mordisco() {
		peso -= 1 
	}	
	method gusto() {
		return gusto
	}
	
	method libreGluten() {
		return true
	}
}

class CarameloCorazonChocolate inherits Caramelo {
	
	override method mordisco() {
		super()
		gusto = "chocolate"	
	}
}

class Alfajor{
		var property precio = 1
		var property peso = 5
		const property gusto = "chocolote"
		const property libreGluten = true
		
		method mordisco(){peso = peso *0.8}
		
}
class Chupetin{
		var property precio = 2
		var property peso = 7
		const property gusto = "naranja"
		const property libreGluten = true
		
		method mordisco(){if (peso < 2){peso = peso * 0.9}}
}
class Oblea{
		var property precio = 5
		var property peso = 250
		const property gusto = "vainilla"
		const property libreGluten = false		
		
		method mordisco() {
			if (peso >= 70) {
				peso = peso * 0.5
				} else { 
					peso = peso * 0.75
					peso = peso - (peso * 0.25)
				}
			}	
}
class ObleaCrujiente inherits Oblea {
		var mordiscos = 0
	
		override method mordisco() {
			super()
			mordiscos += 1
			if(mordiscos <= 3) {
	            peso -= 3			
			}
		} 
}
object heladera{
	var property humedad = 1
}
class Chocolatin{
		var property precio = pesoInicial * 0.5
		const property gusto = "chocolate"
		const property libreGluten = false
		var comido = 0
		var property pesoInicial = 0
		
		method peso(){return (pesoInicial - comido).max(0)} 
		method mordisco(){comido += 2}
		
		
}
class ChocolatinVip inherits Chocolatin{

	method humedad() {return heladera.humedad()}
	
	override method peso(){
		return super()*(1 + self.humedad())
	}
}
class ChocolatinPremiun inherits ChocolatinVip{
	override method humedad(){
		return super()/2
	}
}

class GolosinaBaniada {
	var golosina
	var pesoBanio = 4
		
	method precio() {
		return golosina.precio() + 2;
	}
	
	method peso() {
		return golosina.peso() + pesoBanio;
	}
	
	method mordisco() {
		golosina.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() {
		return golosina.gusto()
	}
	
	method libreGluten() {
		return golosina.libreGluten()
	}	
}
class Tutifruti{
		var property peso = 5
		const property libreGluten = true
		const gusto = ["frutilla", "chocolate", "naranja"]
		var gustoActual = 0

		method precio() { return (if(self.libreGluten()) 7 else 10) }
				
		method mordisco() { 
			gustoActual += 1
			if (gustoActual == 3) { gustoActual = 0 }
			}	
		method gusto2() { return gusto.get(gustoActual) }
		
}

