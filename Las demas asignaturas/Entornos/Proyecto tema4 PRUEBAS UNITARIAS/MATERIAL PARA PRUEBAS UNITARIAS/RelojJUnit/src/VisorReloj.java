

public class VisorReloj {
    private final VisorNumeros horas;
    private final VisorNumeros minutos;
    private String horaFormateada;

    public VisorReloj(int limiteHora, int limiteMinuto) throws HoraNoValidaException{
        if(12 != limiteHora && 24!= limiteHora){
            throw new HoraNoValidaException();
        }
        horas = new VisorNumeros(limiteHora);
        minutos = new VisorNumeros(limiteMinuto);
        actualizarHoraYFormatear();
    }

    public static VisorReloj iniciarEnMediaNoche() throws HoraNoValidaException{
        return new VisorReloj(24, 60);
    }

    public String leerHora(){
        return horaFormateada;
    }


    public void configurar(int hora, int minuto){
        horas.cambiarNumero(hora);
        minutos.cambiarNumero(minuto);
        actualizarHoraYFormatear();
    }

    public void avanzarTiempo() {
        minutos.incrementar();
        if(minutos.leer() == 0){
            horas.incrementar();
        }

        actualizarHoraYFormatear();
    }

    private void actualizarHoraYFormatear() {
        horaFormateada = horas.leerConFormato() + " : " + minutos.leerConFormato(); 
    }
}