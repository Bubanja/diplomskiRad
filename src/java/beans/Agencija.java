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
public class Agencija {

    private int idAgencija;
    private String naziv;
    private String radnoVreme;
    private String lokacija;
    private String kontakt;
    private String Slika;

    public Agencija() {
    }

    public Agencija(int idAgencija, String naziv, String radnoVreme, String lokacija, String kontakt, String Slika) {
        this.idAgencija = idAgencija;
        this.naziv = naziv;
        this.radnoVreme = radnoVreme;
        this.lokacija = lokacija;
        this.kontakt = kontakt;
        this.Slika = Slika;
    }

    public int getIdAgencija() {
        return idAgencija;
    }

    public String getNaziv() {
        return naziv;
    }

    public String getRadnoVreme() {
        return radnoVreme;
    }

    public String getLokacija() {
        return lokacija;
    }

    public String getKontakt() {
        return kontakt;
    }

    public String getSlika() {
        return Slika;
    }

    public void setIdAgencija(int idAgencija) {
        this.idAgencija = idAgencija;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public void setRadnoVreme(String radnoVreme) {
        this.radnoVreme = radnoVreme;
    }

    public void setLokacija(String lokacija) {
        this.lokacija = lokacija;
    }

    public void setKontakt(String kontakt) {
        this.kontakt = kontakt;
    }

    public void setSlika(String Slika) {
        this.Slika = Slika;
    }
    
}
