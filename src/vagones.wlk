class VagonPasajero {
	const property ancho
	const property largo
	const property conBanio
	var estaOrdenado = true
	
	method cantPasajeros(){
		const pasajeros = if(ancho.between(0,3)){8 * largo.truncate(0)} else {10 * largo.truncate(0)}
		return if(not estaOrdenado){ 0.max(pasajeros-15) } else { pasajeros }
	}
	
	method cargaMaxima() = if(conBanio) {300} else {800}
	method pesoMaximo() = 1500 + self.cargaMaxima()
	
	method esPopular() = self.cantPasajeros() >= 50
	method esCarguero() = self.cargaMaxima() >= 1000
	
	method ordenar() {estaOrdenado = true}
	method desordenar() { estaOrdenado = false}
	
	method hacerMantenimiento() { self.ordenar()}
}

class VagonCarga {
	const property cargaMaximaIdeal
	var property maderasSueltas
	const property conBanio = false	
	
	method cantPasajeros() = 0
	method cargaMaxima() = (cargaMaximaIdeal - 400*maderasSueltas).max(0)
	method pesoMaximo() = 	1500 + self.cargaMaxima()
	method esPopular() = self.cantPasajeros() >= 50
	method esCarguero() = self.cargaMaxima() >= 1000
	
	method hacerMantenimiento(){
		maderasSueltas = (maderasSueltas - 2).max(0)
	} 
}

class VagonDormitorio {
	const property compartimientos
	const property camasPorCompartimiento
	const property conBanio = true
	
	method cantPasajeros() = compartimientos * camasPorCompartimiento
	method cargaMaxima() = 1200
	method pesoMaximo() = 2000 + 80 * self.cantPasajeros() + self.cargaMaxima()
	
	method esPopular() = self.cantPasajeros() >= 50
	method esCarguero() = self.cargaMaxima() >= 1000
	
	method hacerMantenimiento() {}
}

