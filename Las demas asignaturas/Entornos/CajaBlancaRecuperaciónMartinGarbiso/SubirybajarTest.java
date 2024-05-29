import org.junit.Test;

import static org.junit.jupiter.api.Assertions.*;

public class SubirybajarTest {

    @org.junit.jupiter.api.Test
    @Test
    /*a>1 b>5 c<2*/
    /*subir y bajar TTF(a=True b=True c=False)*/
    public void subirybajarTTF() {
        assertEquals(0, Subirybajar.subobajo(1,2,3));
    }
    public void subirybajarTTT() {
        assertEquals(1, Subirybajar.subobajo(2,6,1));
    }
    public void subirybajarTFT() {
        assertEquals(0, Subirybajar.subobajo(1,5,1));
    }
    public void subirybajarFTF() {
        assertEquals(0, Subirybajar.subobajo(1,6,3));
    }
    public void subirybajarFTT() {
        assertEquals(0, Subirybajar.subobajo(1,6,1));
    }
    public void subirybajarTFF() {
        assertEquals(0, Subirybajar.subobajo(2,5,3));
    }
    public void subirybajarFFF() {
        assertEquals(0, Subirybajar.subobajo(1,1,3));
    }




}