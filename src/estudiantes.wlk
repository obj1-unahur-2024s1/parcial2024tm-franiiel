import materias.*

class CriaturaMagica {
	var salud
	method disminuirSalud(cantidad){
		salud = salud - cantidad
	}
	method aumentarSalud(cantidad){
		salud = salud + cantidad
	}
}

class Estudiante {
	var salud
	var casa
	var hechizosAprendidos = []
	var property habilidad
	const property esSangrePura
	method esPeligroso(){
		if(salud != null) casa.peligrosidad(self) else false
	}
	method disminuirSalud(cantidad){
		salud = salud - cantidad
	}
	method aumentarSalud(cantidad){
		salud = salud + cantidad
	}
	method aumentarHabilidad(cantidad) {
		habilidad = habilidad + cantidad
	}
	method disminuirHabilidad(cantidad){
		habilidad = habilidad - cantidad
	}
	method cambiarCasa(nuevaCasa){
		casa = nuevaCasa
	}
	method aprenderHechizo(hechizo){
		hechizosAprendidos.add(hechizo)
	}
	method lanzarHechizo(hechizo,criatura){
		if(hechizosAprendidos.contains(hechizo)){
			hechizo.lanzar(criatura)
		}
		
	}
}
object gryffindor{
	method peligrosidad(estudiante) = false
}

object slytherin{
	method peligrosidad(estudiante) = true
}

object hufflepuff {
	method peligrosidad(estudiante) = estudiante.esSangrePura()
}

object ravenclaw{
	method peligrosidad(estudiante) = estudiante.habilidad() > 10
}