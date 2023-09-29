class Vagon {
	
	method cargaMaxima() = 0
	method cantidadDePasajeros() = 0
	method puedeTransportar(unValor) = self.cargaMaxima() >= unValor
	method esDePasajeros() = self.cantidadDePasajeros() > 0
	
}

class Pasajero inherits Vagon {
	const property ancho
	const property largo
	const property estaOrdenado 
	
	override method cantidadDePasajeros() {
		const pasajeros = if(ancho.between(0,3)){8 * largo.truncate(0)} else {10 * largo.truncate(0)}
		return if(not estaOrdenado){ 0.max(pasajeros-15) } else { pasajeros }
	}
	
	override method cargaMaxima() = if(conBanio) {300} else {800}
}

class Carga inherits Vagon {
	
	
	
}

class Dormitorio inherits Vagon {
	
	
}
