package BeforeExam.Entities;

public class RestauranteSalonPrivado extends Restaurante{
    private boolean TieneSalonPrivado;

    public RestauranteSalonPrivado(Long id, String nombre, String direccion, String localidad, String provincia, int capacidad, Double precioPromedio, Double calificacion, boolean tieneSalonPrivado) {
        super(id, nombre, direccion, localidad, provincia, capacidad, precioPromedio, calificacion);
        TieneSalonPrivado = tieneSalonPrivado;
    }

    public boolean isTieneSalonPrivado() {
        return TieneSalonPrivado;
    }

    public void setTieneSalonPrivado(boolean tieneSalonPrivado) {
        TieneSalonPrivado = tieneSalonPrivado;
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
        sb.append(", TieneSalonPrivado=").append(TieneSalonPrivado);
        sb.append('}');
        return sb.toString();
    }
}
