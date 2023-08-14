/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Bubanja
 */
public class Rezervacija {
    private String username;
    private String ime;
    private String prezime;
    private String dan;
    private String vreme;
    private int idTehnicki;
    private int idTermina;
    private int idKorisnik;

    public Rezervacija() {
    }

    public Rezervacija(String username, String ime, String prezime, String dan, String vreme, int idTehnicki, int idTermina, int idKorisnik) {
        this.username = username;
        this.ime = ime;
        this.prezime = prezime;
        this.dan = dan;
        this.vreme = vreme;
        this.idTehnicki = idTehnicki;
        this.idTermina = idTermina;
        this.idKorisnik = idKorisnik;
    }

    

    public String getIme() {
        return ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }



    public int getIdTehnicki() {
        return idTehnicki;
    }

    public int getIdTermina() {
        return idTermina;
    }

    public int getIdKorisnik() {
        return idKorisnik;
    }

    public String getUsername() {
        return username;
    }


    public String getDan() {
        return dan;
    }

    public String getVreme() {
        return vreme;
    }

    public void setIdTehnicki(int idTehnicki) {
        this.idTehnicki = idTehnicki;
    }

    public void setIdTermina(int idTermina) {
        this.idTermina = idTermina;
    }

    public void setIdKorisnik(int idKorisnik) {
        this.idKorisnik = idKorisnik;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setDan(String dan) {
        this.dan = dan;
    }

    public void setVreme(String vreme) {
        this.vreme = vreme;
    }
    
    
    
}
