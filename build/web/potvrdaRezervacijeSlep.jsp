<%@page import="java.util.Date"%>
<%@page import="beans.Slep"%>
<%@page import="beans.Tehnicki"%>
<%@page import="beans.Termin"%>
<%@page import="java.util.ArrayList"%>
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

            <h1>Podaci o rezervaciji </h1>
            <%
                Slep s = (Slep)request.getAttribute("s");
                Date date = new Date();
            %>
            <form method="post" action="RezervacijaSlepServlet">
                <table class="table" >
                    <thead class="thead-dark">
                        <tr><th colspan="2">Podaci o rezervaciji</th></tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><label for="korisnicko">Korisnicko ime:</label></td>
                            <td><input type="text" name="korisnicko" value="<%=korisnik.getUsername()%>" readonly><br><br></td>
                        </tr>
                        <tr>
                            <td><label for="imePrez">Ime:</label></td>
                            <td><input type="text" name="ime" value="<%=korisnik.getIme()%>" readonly ><br><br><br><br></td>
                        </tr>
                        <tr>
                            <td><label for="imePrez">prezime:</label></td>
                            <td><input type="text" name="prezime" value="<%=korisnik.getPrezime()%>" readonly ><br><br><br><br></td>
                        </tr>
                        <tr>
                            <td><label for="film">Email korisnika</label></td>
                            <td><input type="text" name="email" value="<%=korisnik.getEmail()%>" readonly><br><br></td>
                        </tr>
                        <tr>
                            <td><label for="sala">Lokacija vozila:</label></td>
                            <td><input type="text" name="lokacija" value="" required><br><br></td>
                        </tr>
                        <tr>
                            <td><label for="datum">Kontakt telefon korisnika</label></td>
                            <td><input type="text" name="kontakt" value="" required minlength="6"><br><br></td>
                        </tr>
                        <tr>
                            <td><label for="datum">Vreme rezervacije</label></td>
                            <td><input type="text" name="vreme" value="<%=date.toString()%>" readonly ><br><br></td>
                        </tr>
                        <tr>
                            <td>
                <input type="hidden" name="idSlep" value="<%=s.getIdSlep()%>"> 
                <input type="hidden" name="idKorisnik" value="<%=korisnik.getId()%>">   
                        </tr>
                        <tr>
                            <td><input type="submit" value="REZERVISI"</td>
                        </tr>
                    </tbody>
                </table>
                
                
                
                
                
               
               
                
                
                
                
                
                
                
                
            </form>
</main>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    </body>
</html>
