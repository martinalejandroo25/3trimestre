import java.util.Random;

public class RelojJUnit
{
    public static void main( String[] args ) throws InterruptedException {
   
    	System.out.println( "****************************************************" );
    	System.out.println( "*** Bienvenidos a la Versión LOCA del Reloj Loco ***" );
    	System.out.println( "**************************************************** \n" );
    	String horaReloj = "00 : 00";
    	// Activamos el Reloj Loco entre 0 y 60
        int incrementoLoco = 123;
        int minValor = 0; // Valor mínimo del rango
        int maxValor = 60; // Valor mínimo del rango
        Random semilla = new Random();
    	// Reloj con 12 AM y otras 12 PM
        VisorReloj reloj = new VisorReloj(12, 60);
        System.out.println("Hora Inicial: " + reloj.leerHora());
        reloj.configurar(11, 57);
        // Leemos la nueva hora y la mostramos por consola
        horaReloj =  reloj.leerHora();
        System.out.println("Nueva Hora Actual: " + horaReloj);
        while (!horaReloj.equals("00 : 00")) {
            incrementoLoco = (int)(semilla.nextDouble() * (minValor + maxValor));
        	reloj.avanzarTiempo(incrementoLoco);
        	// Leemos la nueva hora y la mostramos por consola
            horaReloj =  reloj.leerHora();
            System.out.println("Nueva Hora Actual: " + horaReloj);
            //Ponemos a "Dormir" nuestro programa durante 1 segundo
            //Thread.sleep(1000);
        }
        System.out.println( "****************************************************" );
    	System.out.println( "****** Adiós a la Versión LOCA del Reloj Loco ******" );
    	System.out.println( "**************************************************** \n" );
    }
}
