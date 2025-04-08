object pepita {
	var energia = 100
	
	method energia() = energia

	method comer(comida) {
		energia += comida.energiaQueAporta()
	}
	
	method energiaParaVolar(distancia) {
		return 10 + distancia
	}

	method puedeVolar(distancia) {
		return energia >= self.energiaParaVolar(distancia)
	}

	method validarVuelo(distancia) {
		if (not self.puedeVolar(distancia)) {
			self.error("ERROR: Pepon no tiene suficiente energia para volar esa distancia")
		}
	}

	method volar(distancia) {
		self.validarVuelo(distancia)
		energia -= self.energiaParaVolar(distancia)
	}
}

object alpiste {
	method energiaQueAporta() = 20
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() = madurez
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() = base * madurez
}

object pepon {
	var energia = 30
	var ultimaComida = manzana
	
	method energia() = energia
	
	method comer(comida) {
		if (comida == ultimaComida) self.error(
				"ERROR: Pepon no puede comer la misma comida dos veces seguidas"
			)
		energia += comida.energiaQueAporta() / 2
		ultimaComida = comida
	}
	
	method energiaParaVolar(distancia) {
		return 20 + 2*distancia
	}

	method puedeVolar(distancia) {
		return energia >= self.energiaParaVolar(distancia)
	}

	method validarVuelo(distancia) {
		if (not self.puedeVolar(distancia)) {
			self.error("ERROR: Pepon no tiene suficiente energia para volar esa distancia")
		}
	}

	method volar(distancia) {
		self.validarVuelo(distancia)
		energia -= self.energiaParaVolar(distancia)
	}
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}

	//Falta modificar esta funcion (Ejercicio BONUS "Excepciones al comer")
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas += 1
	}
}