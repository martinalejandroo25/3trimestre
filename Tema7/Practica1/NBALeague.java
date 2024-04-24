package Tema7.Practica1;

import java.util.Comparator;
import java.util.HashMap;
import java.util.TreeMap;

public class NBALeague {
    public HashMap<String, EquipoBasket> equipos;
    public TreeMap<String, EquipoBasket> equipoOrden;

    //AÑADIR EQUIPO
    public void addEquipo(String name, EquipoBasket equipo){
        equipos.put(name, equipo);
    }

    //BUSCAR EQUIPO POR NOMBRE
    public EquipoBasket BuscarEquipo(String nombre){
        return equipos.get(nombre);
    }
    public void delEquipo(String nombre) {
        if (equipos.containsValue(nombre)){
            equipos.remove(nombre);
        } else {
            System.out.println("Nombre "+nombre+" no encontrado");
        }
    }
    public void MostrarEquiposDes(){
        equipos.toString();
    }
    public void MostrarEquiposOrdenado(){
        equipoOrden.toString();
    }
    public JugadorBasket JugadorMasAlto(){
        return this.equipos
                .values()
                .stream()
                .flatMap( equipo -> equipo.getJugadores().stream()) //stream<Equipo>
                .max(Comparator.comparing(JugadorBasket::getAltura))
                .get();
    }



}
