package polimorfismo;

public class AsientoBusiness extends Asiento {
    private boolean comida;

    public AsientoBusiness(Long id, Double precioBase, Integer fila, String letra, Pasajero pasajero, boolean comida) {
        super(id, precioBase, fila, letra, pasajero);
        this.comida = comida;
    }

    public boolean isComida() {
        return comida;
    }

    public void setComida(boolean comida) {
        this.comida = comida;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AsientoBusiness{");
        sb.append("comida=").append(comida);
        sb.append('}');
        return sb.toString();
    }
    public Double calcularPrecio() {
        return getPrecioBase() * 1.25 + (comida ? 30.0 : 0.0); // condicion ? valor_si_verdadero : valor_si_falso
    }

}
