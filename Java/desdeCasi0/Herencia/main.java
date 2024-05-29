package Herencia;

public class main {
    public static void main(String[] args) {
        Asiento asiento1 = new Asiento(1L, "premium");
        Pasajero pasajero1 = new Pasajero(1L, "jose", "manolo", "josemanolo@gmail.com", "calle rasputin 22", "turre", "rusia", "44533212", "vegetariano", "ASMA, frutos secos", asiento1);

        System.out.println(pasajero1);

        pasajero1.setPreferenciasComida("carnívoro");

        System.out.println(pasajero1);
    }
}
