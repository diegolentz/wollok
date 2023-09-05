//-----------------------------------------------------------------
object jefe {
	var property sueldo= 300000
	
	method pagar(nombre){
		nombre.cobrar()		
	}
	
	method sueldo(importe){
		sueldo =sueldo - importe
		//return sueldo
	}
}
//-----------------------------------------------------------------
object galvan {
	var property sueldo = 15000
	var property dinero = 0
	var deuda = 0
	
	method cobrar(){
		jefe.sueldo(sueldo)
		if(sueldo > deuda){
			dinero = sueldo - deuda
			deuda = 0
			}else{
				deuda = -(sueldo - deuda)
			}
			
	}
	method gastar(cuanto){
				deuda = deuda + cuanto
				if(dinero > 0){
					deuda = deuda - dinero
					dinero = 0
					
				}
		}
	method deuda(){
		return deuda
	}
	method dinero(){
		return dinero
	}
}	
//-----------------------------------------------------------------
object baigorria {
	var property sueldo = 0
	var property costoEmpanada = 15
	var property totalC = 0

	
	method vendio(cantidad){
		sueldo += (cantidad * costoEmpanada)
		
	}
	method cobrar(){
		jefe.sueldo(sueldo)
		totalC+=sueldo
	}
	method totalCobrado(){
		return totalC	
	}
}