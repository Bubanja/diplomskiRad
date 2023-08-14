/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Ognjen
 */
public class Vozilo {
    private int idVozila;
    private int idKorisnika;
    private int nosivost;
    private int kubikaza;
    private String boja;
    private String tip;
    private String zauzeto;

    public Vozilo() {
    }

    public Vozilo(int idVozila, int idKorisnika, int nosivost, int kubikaza, String boja, String tip, String zauzeto) {
        this.idVozila = idVozila;
        this.idKorisnika = idKorisnika;
        this.nosivost = nosivost;
        this.kubikaza = kubikaza;
        this.boja = boja;
        this.tip = tip;
        this.zauzeto = zauzeto;
    }

    public int getIdVozila() {
        return idVozila;
    }

    public int getIdKorisnika() {
        return idKorisnika;
    }

    public int getNosivost() {
        return nosivost;
    }

    public int getKubikaza() {
        return kubikaza;
    }

    public String getBoja() {
        return boja;
    }

    public String getTip() {
        return tip;
    }

    public String getZauzeto() {
        return zauzeto;
    }

    public void setIdVozila(int idVozila) {
        this.idVozila = idVozila;
    }

    public void setIdKorisnika(int idKorisnika) {
        this.idKorisnika = idKorisnika;
    }

    public void setNosivost(int nosivost) {
        this.nosivost = nosivost;
    }

    public void setKubikaza(int kubikaza) {
        this.kubikaza = kubikaza;
    }

    public void setBoja(String boja) {
        this.boja = boja;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public void setZauzeto(String zauzeto) {
        this.zauzeto = zauzeto;
    }
    
    
}
