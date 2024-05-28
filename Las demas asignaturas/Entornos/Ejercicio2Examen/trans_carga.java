
import java.util.*;


/**
 * Class trans_carga
 */
public class trans_carga {

  //
  // Fields
  //

  private Double PMA;
  
  //
  // Constructors
  //
  public trans_carga () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of PMA
   * @param newVar the new value of PMA
   */
  public void setPMA (Double newVar) {
    PMA = newVar;
  }

  /**
   * Get the value of PMA
   * @return the value of PMA
   */
  public Double getPMA () {
    return PMA;
  }

  //
  // Other methods
  //

  /**
   */
  public void es_furgoneta()
  {
    double precio_furgoneta = (Vehiculo.Precio+20)*PMA
  }


  /**
   */
  public void es_camión()
  {
    double precio.camion = (Vehiculo.Precio+40)*PMA
  }


}
