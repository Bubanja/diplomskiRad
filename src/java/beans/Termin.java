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
public class Termin {
    private int idTermina;
    private String rezervisano;
    private int idTehnicki;
    private String dan;
    private String vreme;

    public Termin() {
    }

    public Termin(int idTermina, String rezervisano, int idTehnicki, String dan, String vreme) {
        this.idTermina = idTermina;
        this.rezervisano = rezervisano;
        this.idTehnicki = idTehnicki;
        this.dan = dan;
        this.vreme = vreme;
    }

    public int getIdTermina() {
        return idTermina;
    }

    public String getRezervisano() {
        return rezervisano;
    }

    public int getIdTehnicki() {
        return idTehnicki;
    }

    public String getDan() {
        return dan;
    }

    public String getVreme() {
        return vreme;
    }

    public void setIdTermina(int idTermina) {
        this.idTermina = idTermina;
    }

    public void setRezervisano(String rezervisano) {
        this.rezervisano = rezervisano;
    }

    public void setIdTehnicki(int idTehnicki) {
        this.idTehnicki = idTehnicki;
    }

    public void setDan(String dan) {
        this.dan = dan;
    }

    public void setVreme(String vreme) {
        this.vreme = vreme;
    }
    
    
    
}
