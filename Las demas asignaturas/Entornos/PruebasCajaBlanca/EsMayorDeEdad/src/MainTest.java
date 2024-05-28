import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class MainTest {

    @Test
    public void testLimite18() {
        assertTrue("Es considerado mayor de edad", Main.EsMayor(18));

    }
    @Test
    public void testEsmayor() {
        assertTrue("Es mayor de edad", Main.EsMayor(20));
    }
    @Test
    public void testLimiteMenor() {
        assertFalse("Es considerado menor de edad", Main.EsMayor(17));
    }
    @Test
    public void testEsMenor() {
        assertFalse("Es obviamente menor de edad", Main.EsMayor(0));
    }
}