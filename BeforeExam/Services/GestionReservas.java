package BeforeExam.Services;

import BeforeExam.Entities.Reserva;
import BeforeExam.Entities.Restaurante;
import BeforeExam.Entities.RestauranteSalonPrivado;
import BeforeExam.Entities.RestauranteTerraza;

import java.util.*;
import java.util.stream.Collectors;

public class GestionReservas {
    private List<Restaurante> restaurantes;
    private Set<Reserva> reservas;

    public GestionReservas(List<Restaurante> restaurantes, Set<Reserva> reservas) {
        this.restaurantes = restaurantes;
        this.reservas = reservas;
    }
    //añadir un restaurante
    public void addRestaurante (Restaurante r) {
        this.restaurantes.add(r);
    }
    //eliminar un restaurante
    public void deleteRestaurante(Restaurante r) {
        this.restaurantes.remove(r);
    }
    public void addReserva(Reserva r) {
        this.reservas.add(r);
    }
    public void deleteReserva(Reserva r) {
        this.reservas.remove(r);
    }
    public Restaurante findRestauranteById(Long id) {
        return this.reservas.stream()
                .filter(Restaurante -> Restaurante.getId().equals(id))
                .findFirst()
                .orElseThrow(NoSuchElementException::new).getRestaurante();
    }
    public List<Restaurante> findRestauranteByProvincia(String Provincia){
        return this.restaurantes.stream()
                .filter(restaurante -> restaurante.getProvincia().equals(Provincia))
                        .collect(Collectors.toList());
    }
    public List<Restaurante> getRestaurantesConTerraza(){
        return this.restaurantes.stream()
                .filter(restaurante -> restaurante instanceof RestauranteTerraza)
                .collect(Collectors.toList());
    }
    public List<Restaurante> getRestaurantesConSalon(){
        return this.restaurantes.stream()
                .filter(restaurante -> restaurante instanceof RestauranteSalonPrivado)
                .collect(Collectors.toList());
    }
    public Reserva findyReservaById(Long id){
        return (Reserva) this.restaurantes.stream()
                .filter(restaurante -> restaurante.getId().equals(restaurante));
    }
    public List<Reserva> findReservaByCliente(String dni){
        return (List<Reserva>) this.reservas.stream()
                .filter(reserva -> reserva.getDniCliente().equals(reserva))
                .collect(Collectors.toList());
    }
    public List<Reserva> findReservasOrdenadas
}
