package EjerciciosStreams.Ejercicio2;

public class Cliente {
    private Long id;
    private String nombre;
    private Integer Nivel;

    public Cliente(Long id, String nombre, Integer nivel) {
        this.id = id;
        this.nombre = nombre;
        Nivel = nivel;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getNivel() {
        return Nivel;
    }

    public void setNivel(Integer nivel) {
        Nivel = nivel;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Cliente{");
        sb.append("id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append(", Nivel=").append(Nivel);
        sb.append('}');
        return sb.toString();
    }
}
