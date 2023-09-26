import vagones.*

class Formacion {
	const property vagones = []
	
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
}
