package Herencia;

public class Pasajero extends Persona{
    private String preferenciasComida;
    private String restriccionesMedicas;
    private Asiento asiento;

    public Pasajero() {
    }

    public Pasajero(Long id, String nombre, String apellido, String email, String direccion, String ciudad, String pais, String telefono, String preferenciasComida, String restriccionesMedicas, Asiento asiento) {
        super(id, nombre, apellido, email, direccion, ciudad, pais, telefono);
        this.preferenciasComida = preferenciasComida;
        this.restriccionesMedicas = restriccionesMedicas;
        this.asiento = asiento;
    }

    public String getPreferenciasComida() {
        return preferenciasComida;
    }

    public void setPreferenciasComida(String preferenciasComida) {
        this.preferenciasComida = preferenciasComida;
    }

    public String getRestriccionesMedicas() {
        return restriccionesMedicas;
    }

    public void setRestriccionesMedicas(String restriccionesMedicas) {
        this.restriccionesMedicas = restriccionesMedicas;
    }

    public Asiento getAsiento() {
        return asiento;
    }

    public void setAsiento(Asiento asiento) {
        this.asiento = asiento;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Pasajero{");
        sb.append("preferenciasComida='").append(preferenciasComida).append('\'');
        sb.append(", restriccionesMedicas='").append(restriccionesMedicas).append('\'');
        sb.append(", asiento=").append(asiento);
        sb.append('}');
        return sb.toString();
    }
}
