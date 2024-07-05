import materiasyhechizos.*

class CriaturaMagica {
	var salud
	method disminuirSalud(cantidad){
		salud = salud - cantidad
	}
	method aumentarSalud(cantidad){
		salud = salud + cantidad
	}
	method salud() = salud
}
class CriaturaInmune inherits CriaturaMagica{
	override method disminuirSalud(cantidad){
		super(cantidad) 
		self.aumentarSalud(cantidad)
	}
}

class Estudiante {
	var salud
	var casa
	var hechizosAprendidos = []
	var property habilidad
	const property esSangrePura
	method salud() = salud
	method casa() = casa
	method esPeligroso(){
		return if(salud == null) false else casa.peligrosidad(self)
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
		hechizo.lanzar(self,criatura)
		}
	
	method hechizosAprendidos() = hechizosAprendidos
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