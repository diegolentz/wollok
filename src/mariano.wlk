import golosinas.*

object mariano {
	const golosinas = #{}
	const golosinasDeseadas = #{"chupetin","bombon"}	
	const gustosDeseados = #{"frutilla","vainilla","chocolate"}
	
	
	
	method golosinas(){return golosinas}
	method comprar(unaGolosina){golosinas.add(unaGolosina)}
	method desechar(unaGolosina){golosinas.remove(unaGolosina)}
	method probarGolosinas(){golosinas.forEach({prob => prob.mordisco()})}
	method hayGolosinaSinTACC(){return golosinas.any({tac => tac.libreGluten()})}
	method preciosCuidados(){return golosinas.all({gol => gol.precio() < 10})}
	method golosinaDeSabor(unSabor){return golosinas.find({ sab => sab.gusto() == unSabor})}
	method golosinasDeSabor(unSabor){return golosinas.filter({ sab => sab.gusto() == unSabor})}
	method sabores() {return golosinas.map({ golosina => golosina.gusto() }).asSet()}
	method golosinaMasCara(){return golosinas.max({max => max.precio()})}
	method pesoGolosina(){return golosinas.sum({pes => pes.peso()})}
	
	 method golosinasFaltantes(golosinasFaltantes) {
        return golosinasFaltantes.difference(golosinas)	
    }
    method gustosFaltantes(gustosFaltantes) {
        return gustosFaltantes.filter({ gustosDeseado => !self.tieneGolosinaDeSabor(gustosDeseado) })	
    }
    
    method tieneGolosinaDeSabor(gusto) {
        return golosinas.any({ golosina => golosina.gusto() == gusto })
    }
    
    //-------------------------
   method baniar(gol) {
		var nuevaGolosina = new GolosinaBaniada(golosina=gol)
		golosinas.remove(gol) //si no está esta línea no tiene efecto alguno
		golosinas.add(nuevaGolosina)
	}
}