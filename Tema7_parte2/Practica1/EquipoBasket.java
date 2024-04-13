import java.util.HashSet;

public class EquipoBasket {
    private String nombre;
    private Double partidosGanados;
    private Double partidosPerdidos;

    private HashSet<JugadorBasket> hashjug;

    public EquipoBasket(String nombre, Double partidosGanados, Double partidosPerdidos, HashSet<JugadorBasket> hashjug) {
        this.nombre = nombre;
        this.partidosGanados = partidosGanados;
        this.partidosPerdidos = partidosPerdidos;
        this.hashjug = hashjug;
    }

}
