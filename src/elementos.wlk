import plagas.*

class Barrio{
	const elementos = []
	
	method agregarElemento(unElemento){
		elementos.add(unElemento)
	}
	method quitarElemento(unElemento){
		elementos.remove(unElemento)
	}
	method cantidadDeElementosBuenos(){
		return elementos.filter({e => e.esBueno()}).size()
	}
	method cantidadDeElementosNoBuenos(){
		return elementos.filter({e => not e.esBueno()}).size()
	}
	method esCopado(){
		return self.cantidadDeElementosBuenos() > self.cantidadDeElementosNoBuenos()
	}
}

class Hogar{
	var nivelDeMugre
	var confort
	
	method nivelDeMugre() = nivelDeMugre
	method esBueno(){
		return nivelDeMugre <= confort / 2
	}
	method daniarConPlaga(unaPlaga){
		nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDanio()
	}
}

class Huerta{
	var produccion
	var nivel = 10
	
	method esBueno(){
		return produccion > nivel
	}
	method daniarConPlaga(unaPlaga){
		produccion = 0.max(produccion - (unaPlaga.nivelDeDanio() * 0.1))
		if(unaPlaga.transmiteEnfermedades()){
			produccion = 0.max(produccion - 10)
		}
	}
}

class Mascota{
	var nivelDeSalud
	
	method esBuena(){
		return nivelDeSalud > 250
	}
	method daniarConPlaga(unaPlaga){
		if(unaPlaga.transmiteEnfermedades()){
			nivelDeSalud = nivelDeSalud - unaPlaga.nivelDeDanio()
		}
	}
}