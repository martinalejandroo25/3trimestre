package polimorfismo;

public class main {
    public static void main(String[] args) {

        /*Long id, String nombre, String apellido, String email, String direccion, String ciudad, String pais, String telefono, String preferenciasComida, String restriccionesMedicas, Asiento asiento*/
        Asiento asiento1 = new AsientoBusiness(1L, 125.5, 5, "A", pasajero1, true);

        Pasajero pasajero1 = new Pasajero(1L,"Juan", "perez", "juanperez@gmail.com", "antonio machado 61", "almeria", "españa", "123123123", "vegetariano", "alergia frutos secos", asiento1 );
    }
}
