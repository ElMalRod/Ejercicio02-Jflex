/*---------- 1ra Area: Codigo de Usuarios ----------*/
package Analizador;
import Controladores.TNumeros;
/*---------- 2da Area: Opciones y Declaraciones ----------*/
%%

%class lexico
%unicode
%line
%column
%int
%public

 /* declaracion de regex para los tokens */ 
Letras= [a-zA-Z]+
Numeros=[0-9]+
WhiteSpace=[ ,\t,\r,\n]+
%{
    private int unaVocal = 0;
    private int dosVocal = 0;
    private int tresVocal = 0;
    private int cuatroVocal = 0;
    private int cincoVocal = 0:
    private int sinVocal = 0;
    private ArrayList<TNumeros> listNumero = new ArrayList<>();

    private void GuardarPalabra (String sPalabra) {
        switch(sPalabra.length() - sPalabra.replaceAll("[aeiouAEIOU]", "").length()) {
            case 1:
                unaVocal++;
                break;
            case 2:
                dosVocal++;
                break;
            case 3:
                tresVocal++;
                break;
            case 4:
                cuatroVocal++;
                break;
            case 5:
                cincoVocal++;
                break;
            default:
                sinVocal++;
                break;
        }
    }

    private void GuardarNumero(int line, int column, int value) {
        this.listNumero.add(new TNumeros(line, column, value));
    }

    /*Getters y Setters*/
    public int[] getVocales() {
        return new int[] {unaVocal,dosVocal,tresVocal,cuatroVocal,cincoVocal,sinVocal};
    }

    public ArrayList<TNumeros> getNumeroInfo() {
        return this.listNumero;
    }
%}

%%

/*---------- 3ra Area: Reglas Lexicas ----------*/
{Numeros}     {GuardarNumero(yyline,yycolumn,Integer.valueOf(yytext()));}
{Letras}+    {GuardarPalabra(yytext());}
[^]     {}