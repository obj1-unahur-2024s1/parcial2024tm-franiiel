import estudiantes.*

class MateriaMagica{
	var property hechizo
	var profesor
	var estudiantesPresentes = []
	
	method asistir(estudiante){
		estudiantesPresentes.add(estudiante)
	}
	method dictarMateria(){
		estudiantesPresentes.forEach{
				estudiante => estudiante.aumentarHabilidad(1)
				estudiante.aprenderHechizo(hechizo)
		}
	}
	method practicaSobre(criatura){
		estudiantesPresentes.forEach{estudiante => estudiante.lanzarHechizo(hechizo,criatura)}
	}
}