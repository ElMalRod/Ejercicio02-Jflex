/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Analizador.lexico;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;

/**
 *
 * @author emili
 */
public class AnalizadorVocales {
   private int[] contadorV;
    private ArrayList<TNumeros> InfoNumero;

    public AnalizadorVocales() {
        this.contadorV = new int[6];
        this.InfoNumero = new ArrayList<>();
    }

    public boolean getPalabras(Reader reader) {
        try {
            lexico lexer = new lexico(reader);
            int output = lexer.yylex();
            while (output != lexico.YYEOF) {
                lexer.yylex();
            }

            // get numbers info
            this.contadorV = lexer.getVocales();
            this.InfoNumero = lexer.getNumeroInfo();
            return true;
        } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
            return false;
        }
    }

    // GETTER AND SETTER

    public int[] getContadorV() {
        return contadorV;
    }

    public void setContadorV(int[] contadorV) {
        this.contadorV = contadorV;
    }

    public ArrayList<TNumeros> getInfoNumero() {
        return InfoNumero;
    }

    public void setInfoNumero(ArrayList<TNumeros> InfoNumero) {
        this.InfoNumero = InfoNumero;
    }
 
}