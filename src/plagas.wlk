class Plaga{
	var poblacion
	
	method poblacion() = poblacion
	method transmiteEnfermedades(){
		return poblacion >= 10
	}
	method aplicarEfectosDeAtaque(){
		poblacion = poblacion + self.aumentarPorcentaje()
	}
	method aumentarPorcentaje(){
		return poblacion * 0.1
	}
	method atacarElemento(unElemento){
		unElemento.daniarConPlaga(self)
		self.aplicarEfectosDeAtaque()
	}
}

class Cucaracha inherits Plaga{
	var pesoPromedio
	
	method pesoPromedio() = pesoPromedio
	method nivelDeDanio() = poblacion / 2
	override method transmiteEnfermedades(){
		return super() and pesoPromedio >= 10
	}
	override method aplicarEfectosDeAtaque(){
		super()
		pesoPromedio = pesoPromedio + 2
	}
}

class Pulga inherits Plaga{
	
	method nivelDeDanio() = poblacion * 2
}

class Garrapata inherits Pulga{
	override method aumentarPorcentaje(){
		return poblacion * 0.2
	}
}

class Mosquito inherits Plaga{
	
	method nivelDeDanio() = poblacion
	override method transmiteEnfermedades(){
		return super() and poblacion % 3 == 0
	}
}
