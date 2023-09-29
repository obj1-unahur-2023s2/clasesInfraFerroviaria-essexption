import formaciones.*
import locomotoras.*

class Deposito {
	const property formaciones = []
	const property locomotorasSueltas = []
	
	method agregarFormacion(unaFormacion) = formaciones.add(unaFormacion)
	method quitarFormacion(unaFormacion) = formaciones.remove(unaFormacion)
	
	method agregarLocomotora(unaLoco) = locomotorasSueltas.add(unaLoco)
	method quitarLocomotora(unaLoco) = locomotorasSueltas.remove(unaLoco)
	
	method vagonesMasPesados() = formaciones.map({ form => form.vagonMasPesado()}).asSet()
	method necesitaConductorExperimentado() = formaciones.any({ form => form.esCompleja()})
	
	
	method hayLocomotoraEficientePara(unaFormacion) = locomotorasSueltas.any({ loco => loco.arrastre() >= unaFormacion.kilosDeEmpujeFaltantes()}) 
	
	method locomotoraParaFormacionSiHay(unaFormacion) = locomotorasSueltas.find({ loco => loco.arrastre() >= unaFormacion.kilosDeEmpujeFaltantes()})
	
	method agregarLocomotoraAFormacion(unaFormacion){
		if ( unaFormacion.puedeMoverse() ){} 
		else if ( self.hayLocomotoraEficientePara(unaFormacion) ){
			const locomotoraElegida = self.locomotoraParaFormacionSiHay(unaFormacion)
			unaFormacion.agregarLocomotora(locomotoraElegida)
			self.quitarLocomotora(locomotoraElegida)
		}
		else{}	
	}	
	method agregarLocomotorasAFormaciones() = formaciones.forEach({ form => self.agregarLocomotoraAFormacion(form)})
}
