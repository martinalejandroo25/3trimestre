

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

    public void incrementar() {
        valor = (valor + 1) % limite;
    }
}