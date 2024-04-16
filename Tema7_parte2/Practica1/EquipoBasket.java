package Practica1;

import java.util.HashSet;

public class EquipoBasket {
    /*
    * Crea una clase EquipoBasket que tendrá como atributos:
- String nombre (equals?)
- Double partidosGanados
- Double partidosPerdidos
- Un HashSet<Jugador>, el constructor inicializará el set. Implementa los siguientes métodos:
 buscarJugador(String nombre): que busque el jugador en el equipo y lo devuelva. Intenta hacerlo
óptimo buscando con binarySearch.
 buscarJugador(int dorsal): más fácil pues me devuelve el Jugador con ese dorsal directamente.
 mostrarEquipo(): que liste todo el equipo de baloncesto.
 addJugador(Jugador): que añada un Jugador al Equipo.
 removeJugador(Jugador): que elimine ese Jugador del Equipo.*/
private String nombre;
private Double partidosGanados;
private Double partidosPerdidos;
private HashSet<JugadorBasket> jugadores;

    public EquipoBasket(String nombre, Double partidosGanados, Double partidosPerdidos, HashSet<JugadorBasket> jugadores) {
        this.nombre = nombre;
        this.partidosGanados = partidosGanados;
        this.partidosPerdidos = partidosPerdidos;
        this.jugadores = jugadores;
    }
}
