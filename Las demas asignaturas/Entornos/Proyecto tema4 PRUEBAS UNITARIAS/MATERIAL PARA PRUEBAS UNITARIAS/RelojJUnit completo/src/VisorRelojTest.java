// JUnit 5
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import jdk.jfr.Timestamp;

public class VisorRelojTest {

    @Test
    public void relojIniciadoEnMediaNocheDaLaHoraCorrecta()throws HoraNoValidaException{
        VisorReloj reloj = VisorReloj.iniciarEnMediaNoche();
        String hora = reloj.leerHora();
        assertEquals("00 : 00", hora);
    }

    @Test
    public void relojAvanzaCorrectamente() throws HoraNoValidaException{
        VisorReloj reloj = VisorReloj.iniciarEnMediaNoche();
        reloj.avanzarTiempo();
        String hora = reloj.leerHora();
        assertEquals("00 : 01", hora);
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