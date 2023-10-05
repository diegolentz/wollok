import armas.*
import moradas.*
import erethia.*

object rolando {
	const property artefactos = #{} //lo que tengo encima
	var property capacidad = 2
	var property historial = []
	var todo = [] //todo el inventario
	var property poderBase = 5
	
	method recolectar(artefacto){
		if(artefactos.size() < capacidad){
			artefactos.add(artefacto)		
		}
		historial.add(artefacto)//fuera del if asi lo atrapa el historial
	}
	
	method castilloLoot () {
		castillo.guardar(artefactos)
		artefactos.clear()
		return castillo.loot()//cuando guarda retorna el inventario del castillo
	}
	
	method queTengo (){
		var encima=[] //tengo qe convertir a lista, uso aux
			encima = artefactos.asList()//capturo lo que tengo y sumo lo del castillo
			 todo = castillo.loot() + encima//suma de castillo y lo qe tengo encima
		return todo
	}
	
	method loTengo(objeto) {
		return(self.queTengo().contains(objeto))//utilizo que tengo para actualizar items
	}
	
	method poderItem(artefacto){
		return poderBase + artefacto.poderBrinda(self)
	}
	
	method poderDePelea(){
		return poderBase + self.poderArtefactos()
	}
	method poderArtefactos() {
		//TODO: Código autogenerado 
		return artefactos.sum({artefacto => artefacto.poderBrinda(self)})
	}
	method batalla(){
		artefactos.forEach({artefacto => artefacto.usar(self)})
		poderBase += 1
	}
	method artefactoMasPoderoso(){
		return castillo.artefactoMasPoderoso(self)
	}
	method puedeVencer(villano) {
		return villano.poderBase() < self.poderDePelea()
	}
	method puedeConquistar(villano) {
    	if (villano.poderBase() < self.poderDePelea()) { 
    	return villano.morada() }else{
    		return 0
    	}
	}
	method espoderoso(){
		return erethia.enemigos().all({habitante => self.puedeVencer(habitante)})
	}
	
	method tieneArtefactoFatal(villano){
		return artefactos.any({ artefacto => self.esFatal(artefacto, villano)})	
	}
	
	method esFatal(artefacto, villano){
		return self.poderItem(artefacto) > villano.poderBase()	
	}
}