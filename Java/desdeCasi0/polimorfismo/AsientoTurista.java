package polimorfismo;

public class AsientoTurista extends Asiento {
    private boolean ventana;

    public AsientoTurista(long id, String tipo, boolean ventana) {
        super(id, tipo);
        this.ventana = ventana;
    }

    public boolean isVentana() {
        return ventana;
    }

    public void setVentana(boolean ventana) {
        this.ventana = ventana;
    }

    public Double calcularPrecio(){
        return getPrecioBase() + (ventana ? 10.0 : 0.0);
    }

}
