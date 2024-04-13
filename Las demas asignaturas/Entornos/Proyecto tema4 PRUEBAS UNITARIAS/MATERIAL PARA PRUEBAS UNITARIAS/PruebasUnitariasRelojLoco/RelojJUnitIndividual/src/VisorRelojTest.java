// JUnit 5
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import java.util.Random;

import jdk.jfr.Timestamp;
public class VisorRelojTest {
    @Test
    public void relojIniciadoEnMediaNocheDaLaHoraCorrecta()throws HoraNoValidaException{
        VisorReloj reloj = VisorReloj.iniciarEnMediaNoche();
        String hora = reloj.leerHora();
        assertEquals("00 : 00", hora);
    }
    @Test
    public void relojAvanzaCorrectamenteConIncrementoLoco() throws HoraNoValidaException{
        VisorReloj reloj = VisorReloj.iniciarEnMediaNoche();
    	// Activamos el Reloj Loco entre 0 y 60
        int incrementoLoco = 123;
        int minValor = 0; // Valor mínimo del rango
        int maxValor = 60; // Valor mínimo del rango
        String horaIncremento = "00" + " : " + "00";
        String hora = "00" + " : " + "00";
        Random semilla = new Random();
        incrementoLoco = (int)(semilla.nextDouble() * (minValor + maxValor));
        reloj.avanzarTiempo(incrementoLoco);
        hora = reloj.leerHora();
        // Avanzamos el tiempo también en el incrementoLoco
        if(++incrementoLoco < 10){
       	 horaIncremento = "00" + " : " + "0"+ incrementoLoco + "";
       	}
       	else {
       		 horaIncremento = "00" + " : " + incrementoLoco + "";
        }
        assertEquals(horaIncremento, hora);
    }
    @Test
    public void podemosConfigurarElRelojEnUnaHoraConcreta() throws HoraNoValidaException{
        VisorReloj reloj = VisorReloj.iniciarEnMediaNoche();
        reloj.configurar(13, 30);
        String hora = reloj.leerHora();
        assertEquals("13 : 30", hora);
    }

    @Test
    public void relojReiniciaAlTerminarElDia() throws HoraNoValidaException{
        VisorReloj reloj = VisorReloj.iniciarEnMediaNoche();
        for(int i = 0; i< 1440; i++){
            reloj.avanzarTiempo();
        }
        String hora = reloj.leerHora();
        assertEquals("00 : 00", hora);
    }

}