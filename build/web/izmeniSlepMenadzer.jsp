<%@page import="beans.Slep"%>
<%@page import="beans.Tehnicki"%>
<%@page import="beans.Korisnik"%>
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
            body{
                background-image: url(img/auto1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .container{
                color: white;
                text-align: center;
            }
            #naslov{
                text-align: center;
                padding-top: 50px;
                padding-bottom: 50px;
                color: white;
            }
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
        <div class="container" >   
            <div id="naslov">
                <h1>Izmeni slep vozilo</h1>
            </div>  
            <%
                Slep s = (Slep)request.getAttribute("slep");              
            %>
           <form method="post" action="PotvrdiIzmeneSlep">
                            <label for="naziv">nosivost: </label>
                            <input type="text" name="nosivost" value="<%=s.getNosivost()%>"> <br><br>

                            <label for="radnoVreme">Kontakt: </label>
                            <input type="text" name="kontakt" value="<%=s.getKontakt()%>"> <br><br>

                            <label for="lokacija">Cena po km: </label>
                            <input type="text" name="cena" value="<%=s.getCena()%>">din <br><br> <br><br>
                            
                              <input type="hidden" name="id" value="<%=s.getIdSlep()%>">
                            
                            <input type="submit" class="potvrdi" value="Potvrdi">
                            <p id="msg">  <% String msg = (String)request.getAttribute("msg");
                            if(msg != null) { %>
                            <%= msg %>
                            <% } %>
                            </p>
                        </form>
        </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
