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
      <h1 class="display-5">Informacije o neophodnoj dokumentaciji za prenos vlasnistva vozila</h1>
    </div>
  </div>

  <div class="container" >
    <!-- Example row of columns -->
    <div class="row">
      <div class="col-md-6">
        <div class="card" style="width: 36rem;">
            <div class="card-body">
              <h5 class="card-title">Kasko osiguranje vozila</h5>
              <p class="card-text">Predstavlja vid dobrovoljnog – neobaveznog osiguranja vozila čija je svrha naknada materijalne štete načinjene Vašem vozilu i u slučaju kada ste vi krivi za saobraćajnu nezgodu.</br></br>
Kasko osiguranje vozila se obično zaključuje u cilju dodatnog osiguranja vozila od delimične ili totalne havarije ili od nestanka vozila (osiguranje od krađe, razbojništva ili bespravnog otuđenja vozila).</br></br>
Kasko polisom osiguranik osigurava sopstveno vozilo i pričinjena šteta se isplaćuje bez obzira ko je kriv za saobraćajnu nezgodu.</br></br>
Ukoliko je došlo do sudara u kom ste vi krivi obavezno osigranje će pokriti štetu pričinjeno na tudjem vozilu, a kasko polisa štetu na Vašem.</br></br>
Iznos polise kasko osiguranja zavisi od mnogo faktora (šta sve osiguranik želi da polsa pokriva) i dobija se na upit.</br></br>
Ful kasko ili potpuni kasko koji pokriva i krađu vozila plaća se kao poseban doplatak.</br></br>
               </p>
            </div>
        </div>  
     </div>
     <div class="col-md-6">
        <div class="card" style="width: 36rem;">
            <div class="card-body">
              <h5 class="card-title">Putno, zdravstveno osiguranje</h5>
              <p class="card-text">Naša agencija za registraciju vozila vam omogućava da možete zaključiti polisu putno-zdravstvenog osiguranja za sve zemlje Evrope i ostatka sveta.</br></br>
Uplatu putnog, zdravstvenog osiguranja vršite kod nas u agenciji i od dokumenata Vam je potreban samo važeći pasoš za Vas i članove Vaše porodice.</br></br>
Putno – zdravstveno osiguranje može biti individualno, porodično, grupno, osiguranje sportista ili osiguranje radi odlaska na rad u inostranstvo.</br></br>
Putno zdravstveno osiguranje pokriva ambulantno lečenje, nabavku lekova, prevoz do najbliže zdravstvene ustanove i druge potrebe koje su prouzrokovane povredama ili bolešću.</br></br>
Pored osnovnog zdravstvenog osiguranja postoji i putno zdravstveno osiguranje sa širim pokrićem. </br></br>

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
