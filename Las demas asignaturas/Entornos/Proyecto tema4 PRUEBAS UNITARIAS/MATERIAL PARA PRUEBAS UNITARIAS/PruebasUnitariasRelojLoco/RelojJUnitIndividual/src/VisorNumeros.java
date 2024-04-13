

class VisorNumeros {

    private int limite;
    private int valor;

    public VisorNumeros(int puntoDeReinicio){
        limite = puntoDeReinicio;
        valor = 0;
    }

    public int leer() {
        return valor;
    }

    public String leerConFormato(){
        if(valor < 10){
            return "0"+valor;
        }

        return  ""+valor;
    }

    public  void cambiarNumero(int nuevoValor) {
        if(nuevoValor >= 0 && nuevoValor < limite){
            valor = nuevoValor;
        }
    }

    /* Versi�n NORMAL del Visor de N�meros */
    public void incrementar() {
        valor = (valor + 1) % limite;
    }
    /* Versi�n LOCA del Visor de N�meros */
    public void incrementar(int incrementoLoco) {
        valor = (incrementoLoco + 1) % limite;
    }
}