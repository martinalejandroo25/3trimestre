package polimorfismo;

public abstract class Asiento {
    private Long id;
    private Double precioBase;
    private Integer fila;
    private String letra;
    private Pasajero pasajero;

    public Asiento() {
    }

    public Asiento(Long id, Double precioBase, Integer fila, String letra, Pasajero pasajero) {
        this.id = id;
        this.precioBase = precioBase;
        this.fila = fila;
        this.letra = letra;
        this.pasajero = pasajero;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(Double precioBase) {
        this.precioBase = precioBase;
    }

    public Integer getFila() {
        return fila;
    }

    public void setFila(Integer fila) {
        this.fila = fila;
    }

    public String getLetra() {
        return letra;
    }

    public void setLetra(String letra) {
        this.letra = letra;
    }

    public Pasajero getPasajero() {
        return pasajero;
    }

    public void setPasajero(Pasajero pasajero) {
        this.pasajero = pasajero;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Asiento{");
        sb.append("id=").append(id);
        sb.append(", precioBase=").append(precioBase);
        sb.append(", fila=").append(fila);
        sb.append(", letra='").append(letra).append('\'');
        sb.append(", pasajero=").append(pasajero);
        sb.append('}');
        return sb.toString();
    }
}