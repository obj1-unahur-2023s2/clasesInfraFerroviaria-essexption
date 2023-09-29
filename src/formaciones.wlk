import vagones.*
import locomotoras.*

class Formacion {
	const property vagones = []
	const property locomotoras = []
	
	method agregarVagon(unVagon) = vagones.add(unVagon)
	method quitarVagon(unVagon) = vagones.remove(unVagon)
	method cantPasajeros() = vagones.sum({ vagon => vagon.cantPasajeros()})
	method cantVagonesPopulares() = vagones.count({ vagon => vagon.esPopular()})
	method esCarguero() = vagones.all({ vagon => vagon.esCarguero()})
	method vagonMasPesado() = vagones.max({vagon => vagon.pesoMaximo()})
	method vagonMasLiviano() = vagones.min({vagon => vagon.pesoMaximo()})
	method dispersionDePesos() = self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	method totalBanios() = vagones.count({ vagon => vagon.conBanio()})
	method hacerMantenimiento(){ vagones.forEach({vagon => vagon.hacerMantenimiento()})}
	
	method vagonConMenosPasajeros() = vagones.min({vagon => vagon.cantPasajeros()})
	method vagonConMasPasajeros() = vagones.max({vagon => vagon.cantPasajeros()})
	method estaEquilibrada() = self.vagonConMasPasajeros().cantPasajeros() - self.vagonConMenosPasajeros().cantPasajeros()
	method estaOrganizada() = not (1..vagones.size()-1).any({ num => vagones.get(num-1).esCarguero() and vagones.get(num).esPopular()})

	method agregarLocomotora(unaLoco) = vagones.add(unaLoco)
	method quitarLocomotora(unaLoco) = vagones.remove(unaLoco)
	
	method velocidadMaxima() = locomotoras.min({ loco => loco.velocidadMaxima()}).velocidadMaxima()
	method esEficiente() = locomotoras.all({ loco => loco.esEficiente()})
	method arrastre() = locomotoras.sum({ loco => loco.arrastre()})
	method pesoMaximo() = locomotoras.sum({ loco => loco.peso()}) + vagones.sum({ vagon => vagon.pesoMaximo()})
	method puedeMoverse() = self.arrastre() >= self.pesoMaximo() // self.kilosDemepujeFaltantes() == 0
 	method kilosDeEmpujeFaltantes() = 0.max(self.pesoMaximo()-self.arrastre()) 
	method unidadesTotales() = vagones.size() + locomotoras.size()
	method tieneMasDeXUnidades(cant) = self.unidadesTotales() >= cant
	method esCompleja() = self.tieneMasDeXUnidades(8) or self.pesoMaximo() > 80000
}
