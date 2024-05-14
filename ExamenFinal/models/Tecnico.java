package ExamenFinal.models;



public class Tecnico extends Persona{
    protected Especialidad especialidad;
    private Integer valoracion;

    public Tecnico(Long id, String nombre, String apellidos, String email, String movil, Especialidad especialidad, Integer valoracion) {
        super(id, nombre, apellidos, email, movil);
        this.especialidad = especialidad;
        this.valoracion = valoracion;
    }

    public Integer getValoracion() {
        return valoracion;
    }

    public void setValoracion(Integer valoracion) {
        this.valoracion = valoracion;
    }

    public Especialidad getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(Especialidad especialidad) {
        this.especialidad = especialidad;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Tecnico{");
        sb.append("especialidad=").append(especialidad);
        sb.append(", valoracion=").append(valoracion);
        sb.append(", id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append(", apellidos='").append(apellidos).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", movil='").append(movil).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
