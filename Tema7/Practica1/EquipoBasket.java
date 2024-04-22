package Tema7.Practica1;

import java.util.HashSet;
import java.util.Objects;

public class EquipoBasket {
    /*
    * Crea una clase EquipoBasket que tendrá como atributos:
- [x]String nombre (equals?)
- [x]Double partidosGanados
- [x]Double partidosPerdidos
- [x]Un HashSet<Jugador>, el constructor inicializará el set.
* Implementa los siguientes métodos:
 [x]buscarJugador(String nombre): que busque el jugador en el equipo y lo devuelva.
* Intenta hacerlo óptimo buscando con binarySearch.
 [x]buscarJugador(int dorsal): más fácil pues me devuelve el Jugador con ese dorsal directamente.
 [x]mostrarEquipo(): que liste todo el equipo de baloncesto.
 [x]addJugador(Jugador): que añada un Jugador al Equipo.
 [x]removeJugador(Jugador): que elimine ese Jugador del Equipo.*/
private String nombre;
private Double partidosGanados;
private Double partidosPerdidos;
private HashSet<JugadorBasket> jugadores;

    //CONSTRUCTOR
    public EquipoBasket(String nombre, Double partidosGanados, Double partidosPerdidos, HashSet<JugadorBasket> jugadores) {
        this.nombre = nombre;
        this.partidosGanados = partidosGanados;
        this.partidosPerdidos = partidosPerdidos;
        this.jugadores = jugadores;
    }

    public EquipoBasket() {
    }
    //GETTERS Y SETTERS
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPartidosGanados() {
        return partidosGanados;
    }

    public void setPartidosGanados(Double partidosGanados) {
        this.partidosGanados = partidosGanados;
    }

    public Double getPartidosPerdidos() {
        return partidosPerdidos;
    }

    public void setPartidosPerdidos(Double partidosPerdidos) {
        this.partidosPerdidos = partidosPerdidos;
    }

    public HashSet<JugadorBasket> getJugadores() {
        return jugadores;
    }

    public void setJugadores(HashSet<JugadorBasket> jugadores) {
        this.jugadores = jugadores;
    }

        //EQUALS Y HASHCODE
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EquipoBasket that = (EquipoBasket) o;
        return Objects.equals(nombre, that.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nombre);
    }
    //TO STRING
    @Override
    public String toString() {
        return "EquipoBasket{" + "nombre='" + nombre + '\'' +
                ", partidosGanados=" + partidosGanados +
                ", partidosPerdidos=" + partidosPerdidos +
                ", jugadores=" + jugadores +
                '}';
    }
    //OTROS METODOS
//    buscarJugador(String nombre): que busque el jugador en el equipo y lo devuelva.
//            * Intenta hacerlo óptimo buscando con binarySearch.
    public JugadorBasket buscarJugador(String nombre){
     for(JugadorBasket jugador:jugadores){
         if(Objects.equals(jugador.getJugador(), nombre)){
             return jugador;
         }
     }
        return null;
    }
    //[]buscarJugador(int dorsal): más fácil pues me devuelve el Jugador con ese dorsal directamente.
    public JugadorBasket buscarJugador(int dorsal){
        for(JugadorBasket jugador:jugadores){
            if(jugador.getDorsal() == dorsal){
                return jugador;
            }
        }
        return null;
    }
    public HashSet<JugadorBasket> mostrarEquipo(){
        return jugadores;
    }
    public void addJugador(JugadorBasket jugador) {
        if (jugadores.contains(jugador)){
            System.out.println("El jugador ya está en añadido");
        } else {
            jugadores.add(jugador);
        }
    }
    public void removeJugador(JugadorBasket jugador) {
        if (jugadores.contains(jugador)){
            System.out.println("Eliminando...");
            jugadores.remove(jugador);
        } else {
            System.out.println("El jugador al cual quiere eliminar no existe");
        }
    }
}
