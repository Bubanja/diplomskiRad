<%-- 
    Document   : agencije
    Created on : 16.08.2022., 03.27.05
    Author     : Ognjen
--%>

<%@page import="beans.Agencija"%>
<%@page import="beans.Korisnik"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index stranica</title>
        <!--  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> --> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">       
        <style>
        </style>
    </head>
    <body >   
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
      <h1 class="display-3">AGENCIJA AUTO SONG</h1>
      <p>Dobrodosli u agenciju AUTO SONG, posetite nas na vise lokacija sirom Beograda</p>
    </div>
  </div>                

              <div class="container">
  <% ArrayList<Agencija> agencije = (ArrayList<Agencija>)request.getAttribute("agencije"); 
                    for(Agencija a : agencije){
                    %>
  <div class="row">
    <div class="col">
      <a href="PrikazAgencija?naziv=<%=a.getNaziv()%>"><img src="<%=a.getSlika()%>" style=' width:400px; height: 400px; margin-bottom: 25px;' ></a>
    </div>
    <div class="col">
      <a href="PrikazAgencija?naziv=<%=a.getNaziv()%>"> <%=a.getNaziv()%>  </a>
    </div>
  </div>
    <% } %>
</div>

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
              
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
