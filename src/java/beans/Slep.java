/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author ps170381d
 */
public class Slep {
    private int idSlep;
    private int cena;
    private String nosivost;
    private String rezervisano;
    private String kontakt;

    public Slep() {
    }

    public Slep(int idSlep, int cena, String nosivost, String rezervisano) {
        this.idSlep = idSlep;
        this.cena = cena;
        this.nosivost = nosivost;
        this.rezervisano = rezervisano;
    }

    public Slep(int idSlep, int cena, String nosivost, String rezervisano, String kontakt) {
        this.idSlep = idSlep;
        this.cena = cena;
        this.nosivost = nosivost;
        this.rezervisano = rezervisano;
        this.kontakt = kontakt;
    }
    
    
    public String getKontakt() {
        return kontakt;
    }

    public void setKontakt(String kontakt) {
        this.kontakt = kontakt;
    }

    
    
    public int getIdSlep() {
        return idSlep;
    }

    public int getCena() {
        return cena;
    }

    public String getNosivost() {
        return nosivost;
    }

    public String getRezervisano() {
        return rezervisano;
    }

    public void setIdSlep(int idSlep) {
        this.idSlep = idSlep;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public void setNosivost(String nosivost) {
        this.nosivost = nosivost;
    }

    public void setRezervisano(String rezervisano) {
        this.rezervisano = rezervisano;
    }
    
    
}
