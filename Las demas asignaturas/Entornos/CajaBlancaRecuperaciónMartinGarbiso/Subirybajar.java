public class Subirybajar {
    public static int subobajo(int a, int b, int c) {
        int x=1;
        if (a>1 && b>5 && c<2){
            x=x+1;
        } else  x=x-1;
        return x;
    }

    public static void main(String[] args) {
        System.out.println(subobajo(2,6,1));
    }
}
