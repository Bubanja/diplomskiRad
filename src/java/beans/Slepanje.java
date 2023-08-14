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
public class Slepanje {
    private int idSlepanje;
    private int idSlep;
    private int idKorisnik;
    private String imePrezime;
    private String lokacija;
    private String kontakt;
    private String vreme;

    public Slepanje() {
    }

    public Slepanje(int idSlepanje, int idSlep, int idKorisnik, String imePrezime, String lokacija, String kontakt, String vreme) {
        this.idSlepanje = idSlepanje;
        this.idSlep = idSlep;
        this.idKorisnik = idKorisnik;
        this.imePrezime = imePrezime;
        this.lokacija = lokacija;
        this.kontakt = kontakt;
        this.vreme = vreme;
    }
    
    
    public Slepanje(int idSlep, int idKorisnik, String imePrezime, String lokacija, String kontakt, String vreme) {
        this.idSlep = idSlep;
        this.idKorisnik = idKorisnik;
        this.imePrezime = imePrezime;
        this.lokacija = lokacija;
        this.kontakt = kontakt;
        this.vreme = vreme;
    }
    
    

    public int getIdSlepanje() {
        return idSlepanje;
    }

    public int getIdSlep() {
        return idSlep;
    }

    public int getIdKorisnik() {
        return idKorisnik;
    }

    public String getImePrezime() {
        return imePrezime;
    }

    public String getLokacija() {
        return lokacija;
    }

    public String getKontakt() {
        return kontakt;
    }

    public String getVreme() {
        return vreme;
    }

    public void setIdSlepanje(int idSlepanje) {
        this.idSlepanje = idSlepanje;
    }

    public void setIdSlep(int idSlep) {
        this.idSlep = idSlep;
    }

    public void setIdKorisnik(int idKorisnik) {
        this.idKorisnik = idKorisnik;
    }

    public void setImePrezime(String imePrezime) {
        this.imePrezime = imePrezime;
    }

    public void setLokacija(String lokacija) {
        this.lokacija = lokacija;
    }

    public void setKontakt(String kontakt) {
        this.kontakt = kontakt;
    }

    public void setVreme(String vreme) {
        this.vreme = vreme;
    }
    
    
}
