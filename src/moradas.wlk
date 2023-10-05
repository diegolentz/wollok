import rolando.*

object castillo {
	var property loot = [] // inventario castillo
	
	method guardar(artefactos){
		loot += artefactos
		return loot
	}
	method artefactoMasPoderoso(personaje) {
		return loot.max({artefacto => artefacto.poderBrinda(personaje)})
	}
}
