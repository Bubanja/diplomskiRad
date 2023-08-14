<%-- 
    Document   : profil
    Created on : 18.11.2022., 12.42.28
    Author     : Ognjen
--%>

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
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Agencija Auto SONG</h1>
    <p class="lead">PODACI NA VASEM PROFILU</p>
  </div>
</div>                                 
            <div id="content">  
                <table class="table">
                    <thead class="thead-dark">
                   <tr>
                        <th>Korisnicko ime</th>
                        <th>Password</th>
                        <th>Ime</th>    
                        <th>Prezime</th>
                        <th>Datum rodjenja</th>
                        <th>Pol</th>
                        <th>Email</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><%=korisnik.getUsername()%></td>
                        <td><input type="password" disabled value="<%=korisnik.getPassword()%>"></td>
                        <td><%=korisnik.getIme()%></td>    
                        <td><%=korisnik.getPrezime()%></td>
                        <td><%=korisnik.getDatum()%></td>
                        <td><%=korisnik.getPol()%></td>
                        <td><%=korisnik.getEmail()%></td>
                        
                    </tr>  
                    <tr>                      
                        <td><a href="izmeniProfil.jsp" ><input type="button" value="Izmeni podatke" /></a></td>
                        <td><a href="KorisnikRezervacije?id=<%=korisnik.getId()%>" ><input type="button" value="Vidi rezervisane termine" /></a></td>
                    </tr>
                    <tbody>
                    </table>          
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
