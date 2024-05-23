
import java.util.*;


/**
 * Class Vehiculo
 */
public class Vehiculo {

  //
  // Fields
  //

  private String Matrícula;
  private double Precio = 50;
  
  //
  // Constructors
  //
  public Vehiculo () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of Matrícula
   * @param newVar the new value of Matrícula
   */
  public void setMatrícula (String newVar) {
    Matrícula = newVar;
  }

  /**
   * Get the value of Matrícula
   * @return the value of Matrícula
   */
  public String getMatrícula () {
    return Matrícula;
  }

  /**
   * Set the value of Precio
   * @param newVar the new value of Precio
   */
  public void setPrecio (double newVar) {
    Precio = newVar;
  }

  /**
   * Get the value of Precio
   * @return the value of Precio
   */
  public double getPrecio () {
    return Precio;
  }

  //
  // Other methods
  //

}
