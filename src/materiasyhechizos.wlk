import estudiantes.*

class MateriaMagica{
	var property hechizo
	var profesor
	var estudiantesPresentes = []
	method cambiarHechizo(nuevoHechizo){
		hechizo = nuevoHechizo
	}
	method asistir(estudiante){
		estudiantesPresentes.add(estudiante)
	}
	method dictarClase(){
		estudiantesPresentes.forEach{
				estudiante => estudiante.aumentarHabilidad(1)
				estudiante.aprenderHechizo(hechizo)
		}
	}
	method practicaSobre(criatura){
		estudiantesPresentes.forEach{estudiante => estudiante.lanzarHechizo(hechizo,criatura)}
	}
	
}


class Hechizo{
	const dificultad
	method condicionesParaLanzar(lanzador){
		return lanzador.habilidad() > dificultad and lanzador.hechizosAprendidos().contains(self)
		
	}
	method lanzar(lanzador,destino){
		if(self.condicionesParaLanzar(lanzador)) 
		self.consecuencia(destino)
		else throw new Exception(message = "No puede lanzar el hechizo")
	}
	method consecuencia(destino){
		destino.disminuirSalud(dificultad + 10)
	}
}

class HechizoImperdonable inherits Hechizo{
	override method lanzar(lanzador,destino){
		super(lanzador,destino)
		lanzador.disminuirSalud(dificultad)
	}
	override method consecuencia(destino){
		destino.disminuirSalud(dificultad + 10*2)
	}
}

class HechizoPuro inherits Hechizo(dificultad = 0){
	override method condicionesParaLanzar(lanzador){
		return !lanzador.esPeligroso() and lanzador.hechizosAprendidos().contains(self)
	}
override method lanzar(lanzador,destino){
		super(lanzador,destino)
		lanzador.disminuirHabilidad(1)
	}
}
	

class HechizoCambiante inherits Hechizo{
	override method condicionesParaLanzar(lanzador) = lanzador.esSangrePura()
	override method consecuencia(destino){
		if(destino.esSangrePura()) destino.cambiarCasa(slytherin) else destino.cambiarCasa(gryffindor)
	}
}

