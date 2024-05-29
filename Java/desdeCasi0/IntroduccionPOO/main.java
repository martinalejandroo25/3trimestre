public class main {
    public static void main(String[] args) {

        //crear persona1
        Persona persona1 = new Persona(1L, "Juan", "perez", "juanperez@gmail.com", "calle rodolfo 24", "almeria", "españa", "654321123");

        //imprimir persona1
        System.out.println(persona1);

        // modificar atributos
        persona1.setNombre("José");
        persona1.setTelefono("1234456789");

        //imprimir ahora actualizado
        System.out.println(persona1);

        //actualizar algo
        persona1.setCiudad("garrucha");
        System.out.println(persona1);
    }
}
