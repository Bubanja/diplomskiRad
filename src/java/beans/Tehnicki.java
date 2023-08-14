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
public class Tehnicki {
    private int idTehnicki;
    private String naziv;
    private String lokacija;
    private String radnoVreme;
    private String kontakt;
    private String slika;

    public Tehnicki() {
    }

    public Tehnicki(int idTehnicki, String naziv, String lokacija, String radnoVreme, String kontakt, String slika) {
        this.idTehnicki = idTehnicki;
        this.naziv = naziv;
        this.lokacija = lokacija;
        this.radnoVreme = radnoVreme;
        this.kontakt = kontakt;
        this.slika = slika;
    }

    public int getIdTehnicki() {
        return idTehnicki;
    }

    public String getNaziv() {
        return naziv;
    }

    public String getLokacija() {
        return lokacija;
    }

    public String getRadnoVreme() {
        return radnoVreme;
    }

    public String getKontakt() {
        return kontakt;
    }

    public String getSlika() {
        return slika;
    }

    public void setIdTehnicki(int idTehnicki) {
        this.idTehnicki = idTehnicki;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public void setLokacija(String lokacija) {
        this.lokacija = lokacija;
    }

    public void setRadnoVreme(String radnoVreme) {
        this.radnoVreme = radnoVreme;
    }

    public void setKontakt(String kontakt) {
        this.kontakt = kontakt;
    }

    public void setSlika(String slika) {
        this.slika = slika;
    }
    
    
    
}
