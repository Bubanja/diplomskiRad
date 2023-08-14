<%@page import="beans.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <style>
        </style>
    </head>
    <body>
         <%
                        HttpSession sesija = request.getSession();
                        Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik"); 
        %>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark" center>
            

            <span class="navbar-text" style="color:white"><b>AGENCIJA AUTO SONG</b></span>
                <ul class="navbar-nav" style="padding-left: 20px; " >
                    <li class="nav-item" ">
                        <a class="nav-link" href="index.jsp">POCETNA</a>
                    </li>
                     <li class="nav-item" >
                        <a class="nav-link" href="kalkulator.jsp">KALKULATOR</a>
                    </li>
                    <li class="nav-item" >
                        <a class="nav-link" href="AgencijeServlet">AGENCIJE</a>
                    </li>
                     <li class="nav-item" >
                        <a class="nav-link" href="PrikazTehnicki" >TEHNIČKI</a>
                    </li>
                    <li class="nav-item" >
                        <a class="nav-link" href="PrikazSlep" >SLEP</a>
                    </li>
                    <li class="nav-item" style="margin-right: 120%">
                        <a class="nav-link" href="info.jsp" >INFORMACIJE</a>
                    </li>
                    <%
                        if(korisnik!= null){
                        if(korisnik.getTip().equals("admin")){
                    %>
                    <li class="nav-item" >
                        <a class="nav-link" href="adminStranica.jsp">ADMIN</a>
                    </li>
                    <% }else if(korisnik.getTip().equals("menadzer")){%>
                    <li class="nav-item" >
                        <a class="nav-link" href="menadzerStranica.jsp">MENADŽER</a>
                    </li>
                    <% }} %>
                    <%
                        if(korisnik != null){
                    %><li class="nav-item" >
                        <a class="nav-link" href="profil.jsp"> PROFIL</a>
                    </li>
                    <li class="nav-item" >
                        <a class="nav-link" href="OdjavaServlet">ODJAVA</a>
                    </li><% }else{ %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp" >PRIJAVA</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registracija.jsp">REGISTRACIJA</a>
                    </li>
                    <% } %>
                </ul>
        </nav>
        <main role="main">

  <!-- Main jumbotron for a primary marketing message or call to action -->
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-5">Informacije o neophodnoj dokumentaciji za registraciju vozila</h1>
    </div>
  </div>

  <div class="container" >
    <!-- Example row of columns -->
    <div class="row">
      <div class="col-md-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">Neophodna dokumentacija za FIZIČKA lica:</h5>
              <p class="card-text">-Lična karta </br> </br>
                                    -Saobraćajna dozvola </br> </br>
                                    -Tehnički pregled (ili Registracioni list ukoliko ste ga obavili sami)</br> </br>
                                    -Polisa auto odgovornosti</br> </br>
                                   -Uplate za državu svih taksi potrebnih za registraciju</br> </br>
                                   -Ovlašćenje ukoliko se auto vozi na ovlašćenje</br> </br>
                                    
                                   <b>Ukoliko fizičko lice upravlja vozilom koje je kupljeno na lizing neophodno je za produženje registracije pored gore navedenog dostaviti i sledeća dokumenta: </b></br> </br>

                                   -Izvod iz APR-a lizing kuće</br> </br>
                                   -Ovlašćenje lizing kuće za registraciju vozila na lice koje je korisnik lizinga.</br> </br>
               </p>
            </div>
        </div>  
     </div>
     <div class="col-md-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">Neophodna dokumentacija za PRAVNA lica:</h5>
              <p class="card-text">-Rešenje iz APR-a (kopija rešenja iz Agencija za privredne registre)</br> </br>

                                   -Saobraćajna dozvola</br> </br>
                 
                                   -Tehnički pregled (ili Registracioni list ukoliko ste tehnički pregled obavili sami)</br> </br>
                                   
                                   -Polisa auto odgovornosti</br> </br>
                                   
                                   -Potvrda iz banke o izvršenim uplatama svih taksi potrebnih za registraciju</br> </br>
                                   
                                   -Ovlašćenje na memorandumu vaše firme koji je potpisan i overen delovodnim pečatom i pečatom firme</br> </br>
                                    
                                   <b> Ukoliko pravno lice poseduje vozilo koje je kupljeno na lizing neophodno je za produženje registracije pored gore navedenog dostaviti i sledeća dokumenta: </b></br> </br>

                                   -Izvod iz APR-a lizing kuće</br> </br>
                                   
                                   -Ovlašćenje lizing kuće za registraciju vozila na korisnika lizinga</br> </br>
                                   
                                   -Ovlašćenje korisnika lizinga za registraciju vozila</br> </br>
                                   
               </p>
            </div>
        </div>  
     </div>
        <div class="col-md-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">Dokumentacija potrebna za prvu registraciju pri promeni vlasništva:</h5>
              <p class="card-text">-Saobraćajna dozvola, faktura, overen kupoprodajni ugovor, overen ugovor o poklonu ili pravosnažna ostavinska rasprava</br> </br>
                                    -Registracioni list ne straiji od 30 dana</br> </br>
                                    -Važeća lična karta (APR za pravna lica)</br> </br>
                                    -Polisa osiguranja za vozilo</br> </br>
                                    -Uplatnice sa plaćenim taksama za državu</br> </br>
               </p>
            </div>
        </div>  
     </div>
        
        <div class="col-md-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">Dokumentacija potrebna za prvu registraciju kada se uvozi polovno vozilo:</h5>
              <p class="card-text">-Dokaz o izmirenim carinskim i poreskim obavezama</br> </br>
                                    -Inostrana odjavljena saobraćajna dozvola (u slučaju da vozilo nije odjavljeno inostrane tablice)</br> </br>
                                    -Potvrda o prispeću vozila od špedicije</br> </br>
                                    -Faktura na koga ide vozilo</br> </br>
                                    -Registracioni list ne straiji od 30 dana</br> </br>
                                    -Uverenje iz Agencije za bezbednost saobraćaja za vozilo koje se uvozi kao upotrebljavano</br> </br>
                                    -Polisa auto odgovornosti</br> </br>
                                    -Važeća lična karta (APR za pravna lica)</br> </br>
                                    -Uplatnice sa plaćenim taksama za registraciju</br> </br>
               </p>
            </div>
        </div>  
     </div>
        <div class="col-md-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">Dokumentacija potrebna za odjavu vozila:</h5>
              <p class="card-text">-Saobraćajna dozvola vozila koje se odjavljuje</br> </br>
-Registarske tablice sa vozila koje se odjavljuje</br> </br>
-Važeća lična karta</br> </br>
               </p>
            </div>
        </div>  
     </div>
        <div class="col-md-4">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
              <h5 class="card-title">Dokumentacija potrebna za zamenu registarskih tablica:</h5>
              <p class="card-text">-Registracioni listi, koji ne treba overavati na tehničkom pregledu</br> </br>
                                    -Potvrda o prijavi nestanka tablica od strane MUP-a</br> </br>
                                    -Saobraćajna dozvola</br> </br>
                                    -Važeća lična karta vlasnika</br> </br>
                                    -Polisa obaveznog osiguranja</br> </br>
                                    -Dokaz o uplatama za administrativnu taksu, nove registarske tablice i novu saobraćajnu dozvolu</br> </br>
               </p>
            </div>
        </div>  
     </div>
      
    </div>
    </div> <!-- /container -->

  </br>
  </br>

<footer width="100%" style="background-color: #eee6d3;">
    <div class="container p-4">
      <div class="row">
        <div class="col-lg-6 col-md-12 mb-4">
          <h5 class="mb-3 text-dark">Agencija Auto SONG</h5>
          <p>
            Treba vam registracija i tehnički pregled vozila na pravom ste mestu. Agencija Auto SONG posluje na teritoriji grada Beograda već duže od 15 godina. Kod nas na jednom mestu možete izvršiti tehničku ispravnost vozila i obaviti njegovo registrovanje. Profesionalnim radom stekli smo poverenje kako fizičkih tako i pravnih lica koji u našoj agenciji registruju vozilo svake godine. Povoljna cena tehničkog pregleda i plaćanje registracije na rate su pogodnosti koje nudimo klijentima.!
          </p>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
          <h5 class="mb-3 text-dark">Linkovi:</h5>
          <ul class="list-unstyled mb-0">
            <li class="mb-1">
              <a href="AgencijeServlet" style="color: #4f4f4f;">Agencije</a>
            </li>
            <li class="mb-1">
              <a href="PrikazTehnicki" style="color: #4f4f4f;">Tehnicki</a>
            </li>
            <li class="mb-1">
              <a href="kalkulator.jsp" style="color: #4f4f4f;">Kalkulator</a>
            </li>
            <li>
              <a href="info.jsp" style="color: #4f4f4f;">Informacije</a>
            </li>
          </ul>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
          <h5 class="mb-1 text-dark">Radno Vreme: </h5>
          <table class="table" style="border-color: #666;">
            <tbody>
              <tr>
                <td>Pon - Pet:</td>
                <td>9:00 - 17:00</td>
              </tr>
              <tr>
                <td>Sub - Ned:</td>
                <td>Ne radimo</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
      Agencija :
      <a class="text-dark" href="#!">AUTO SONG</a>
    </div>
    <!-- Copyright -->
  </footer>
</main>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    </body>
</html>
