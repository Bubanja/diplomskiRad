<%-- 
    Document   : odabirTermina
    Created on : 29.09.2022., 03.27.05
    Author     : Ognjen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="beans.Termin" %>
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
        <div class="container">
        <h2 id="msg">  
            <% String msg = (String)request.getAttribute("msg");
                if(msg != null) { %>
                <%= msg  %>
            <% } %>
        </h2>
        
        <form action="FormaZaRezervaciju" method="get">      
            <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">9:30</th>
                <th scope="col">11:30</th>
                <th scope="col">13:30</th>
                <th scope="col">15:30</th>
            </tr>
            </thead>
            <tbody>
                 <% 
                ArrayList<Termin> terminiA = (ArrayList<Termin>)request.getAttribute("TerminiA"); 
                ArrayList<Termin> terminiB = (ArrayList<Termin>)request.getAttribute("TerminiB"); 
                ArrayList<Termin> terminiC = (ArrayList<Termin>)request.getAttribute("TerminiC"); 
                ArrayList<Termin> terminiD = (ArrayList<Termin>)request.getAttribute("TerminiD");
                ArrayList<Termin> terminiE = (ArrayList<Termin>)request.getAttribute("TerminiE");

                String idTehnicki = (String)request.getParameter("idTehnicki");
                %>

                <tr>
                   <th scope="row">Ponedeljak</th>
                    <% for(Termin tA : terminiA){ 
                        if(tA.getRezervisano().equals("ne")){%>
                        
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tA.getIdTermina()%>"> </div> </td> 
                        <%}else{%>
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tA.getIdTermina()%>" disabled> </div> </td> 
                        <% } %>
                        <% } %>
                </tr>

                 <tr>
                   <th scope="row">Utorak</th>
                    <% for(Termin tB : terminiB){ 
                        if(tB.getRezervisano().equals("ne")){%>
                        
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tB.getIdTermina()%>"> </div> </td> 
                        <%}else{%>
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tB.getIdTermina()%>" disabled> </div> </td> 
                        <% } %>
                        <% } %>
                </tr>

                 <tr>
                   <th scope="row">Sreda</th>
                    <% for(Termin tC : terminiC){ 
                        if(tC.getRezervisano().equals("ne")){%>
                        
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tC.getIdTermina()%>"> </div> </td> 
                        <%}else{%>
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tC.getIdTermina()%>" disabled> </div> </td> 
                        <% } %>
                        <% } %>
                </tr>
                
                <tr>
                   <th scope="row">Cetvrtak</th>
                    <% for(Termin tD : terminiD){ 
                        if(tD.getRezervisano().equals("ne")){%>
                        
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tD.getIdTermina()%>"> </div> </td> 
                        <%}else{%>
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tD.getIdTermina()%>" disabled> </div> </td> 
                        <% } %>
                        <% } %>
                </tr>
                
                <tr>
                   <th scope="row">Petak</th>
                    <% for(Termin tE : terminiE){ 
                        if(tE.getRezervisano().equals("ne")){%>
                        
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tE.getIdTermina()%>"> </div> </td> 
                        <%}else{%>
                        <td> <div class="stolica">  <input name="termin" type="radio" value="<%=tE.getIdTermina()%>" disabled> </div> </td> 
                        <% } %>
                        <% } %>
                </tr>
                
            </table>        
            
            <input type="text"  name="idTehnicki" value="<%=idTehnicki%>" hidden>
            <%
                if(korisnik != null){
            %>
            <input type="submit" value="REZERVISI">
            <%
                }else{
            %>
            <a href="login.jsp" ><input type="button" value="REZERVISI"></a>
            <% } %>
        </form>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    </body>
</html>
