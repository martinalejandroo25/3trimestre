package BeforeExam.Entities;

public class RestauranteTerraza extends Restaurante{
    private boolean TieneTerraza;

    public RestauranteTerraza(Long id, String nombre, String direccion, String localidad, String provincia, int capacidad, Double precioPromedio, Double calificacion, boolean tieneTerraza) {
        super(id, nombre, direccion, localidad, provincia, capacidad, precioPromedio, calificacion);
        TieneTerraza = tieneTerraza;
    }

    public boolean isTieneTerraza() {
        return TieneTerraza;
    }

    public void setTieneTerraza(boolean tieneTerraza) {
        TieneTerraza = tieneTerraza;
    }
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Restaurante{");
        sb.append("id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append(", direccion='").append(direccion).append('\'');
        sb.append(", localidad='").append(localidad).append('\'');
        sb.append(", provincia='").append(provincia).append('\'');
        sb.append(", capacidad=").append(capacidad);
        sb.append(", precioPromedio=").append(precioPromedio);
        sb.append(", calificacion=").append(calificacion);
        sb.append(", TieneTerraza=").append(TieneTerraza);
        sb.append('}');
        return sb.toString();
    }
}
