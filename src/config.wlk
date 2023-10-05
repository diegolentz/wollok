import hector.*
import wollok.game.*
import regador.*

object config {
	
	method iniciar(){
		self.configurarTeclas()
		game.addVisualCharacter(hector)
		const reg = new regador()
		game.addVisual(reg)
		game.onTick(1000, "REGADOR", { reg.regarCultivosAlrededor()})
	}	
	
	method configurarTeclas(){
		keyboard.m().onPressDo{hector.sembrarMaiz()}
		keyboard.t().onPressDo{hector.sembrarTrigo()}
		keyboard.o().onPressDo{hector.sembrarTomaco()}	
		keyboard.r().onPressDo{hector.regar()}	
		keyboard.space().onPressDo{hector.informe()}	
		keyboard.c().onPressDo{hector.cosechar()}
		keyboard.v().onPressDo{hector.vender()}
		
		
		
	}
}
