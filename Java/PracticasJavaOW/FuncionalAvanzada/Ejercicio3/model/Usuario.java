package PracticasJavaOW.FuncionalAvanzada.Ejercicio3.model;

import java.time.LocalDate;
import java.util.Date;

public class Usuario {

    private String nombre;
    private String apellidos;
    private String genero;
    private LocalDate fecha_nacimiento;
    private String dni;
    private String login;
    private String password;

    public Usuario(String nombre, String apellidos, String genero, LocalDate fecha_nacimiento, String dni, String login, String password) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.genero = genero;
        this.fecha_nacimiento = fecha_nacimiento;
        this.dni = dni;
        this.login = login;
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Usuario{");
        sb.append("nombre='").append(nombre).append('\'');
        sb.append(", apellidos='").append(apellidos).append('\'');
        sb.append(", genero='").append(genero).append('\'');
        sb.append(", fecha_nacimiento=").append(fecha_nacimiento);
        sb.append(", dni='").append(dni).append('\'');
        sb.append(", login='").append(login).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append('}');
        return sb.toString();
    }

}
