import mensajeros.*
import paquete.*


object mensajeria {
	const  mensajeros = []
	const enviado = []
	const pendiente = []
	const varios = []
	
	method contratar(mensajero){
		mensajeros.add(mensajero)
	}
	
	method despedir(mensajero){
		mensajeros.remove(mensajero)
	}
	method despedirTodos(){
		mensajeros.clear()
	}
	method esGrande(){
		return mensajeros.size() > 2
	}
	
	
	
	
	method entregaPrimero(){
		return paquete.puedeSerEntregadoPor(mensajeros.first())
		
	}
	method pesoUltimo(){
		return mensajeros.last().peso()
		
	}
	method mensajeros() {
 		return mensajeros
	}
	method enviados() {
 		return enviado
	}
	method pendientes(algo) {
 		pendiente.add(algo)
	}
	method pendientes() {
 		return pendiente
	}
	method varios(algo) {
 		 varios.add(algo)
	}
	
	
	
	
	method algunoEntrega(algo){
		return mensajeros.all{men => algo.puedeSerEntregadoPor(men)}
	}	
	method quienEntrega(algo){
		return mensajeros.filter{men => algo.puedeSerEntregadoPor(men)}
	}
	method sobrePeso(){
		return mensajeros.sum{men => men.peso()} / 3 > 500	
	}
	method envio(algo){
		if(self.algunoEntrega(algo))
			enviado.add(algo)
		else
			pendiente.add(algo)
		
	}
	method facturado(){
		return enviado.sum{paq => paq.precio()}
	}
	
	method agregaVarios(algo){
		varios.add(algo)
	}
	method enviarVarios(){
		varios.forEach({x=>self.envio(x)})
	}
	
	
	method masCaroPendiente(){
		return pendiente.max{x => x.precio()}
	}
	method enviarMasCaroPendiente(){
		self.envio(self.masCaroPendiente())
		enviado.add(self.masCaroPendiente())
		pendiente.remove(self.masCaroPendiente())
	}
	
	
	
	
	
	
	
}
