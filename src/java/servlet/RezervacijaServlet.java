/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Rezervacija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bubanja
 */
public class RezervacijaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        
        HttpSession sesija = request.getSession();
        
        Connection con = null;
        PreparedStatement pst = null; 
        Statement st = null;
        ResultSet rs = null;
        
        try {                                                        
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
         
            String upit = "INSERT INTO rezervacija(username,ime,prezime,danTermina,vremeTermina,idTehnicki,idTermina,idKorisnik) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            
            String username = request.getParameter("korisnicko");
            String ime = request.getParameter("ime");
            String prezime = request.getParameter("prezime");
            String naziv = request.getParameter("tehnickiNaziv");
            String lokacija = request.getParameter("lokacija");
            String dan = request.getParameter("dan");

            String vreme = request.getParameter("vreme");
            int idTehnicki = Integer.parseInt(request.getParameter("idTehnicki"));
            int idTermina = Integer.parseInt(request.getParameter("idTermina"));
            int idKorisnik = Integer.parseInt(request.getParameter("idKorisnik"));
            
            pst= con.prepareStatement(upit);
            
            pst.setString(1, username);
            pst.setString(2, ime);
            pst.setString(3, prezime);
            pst.setString(4, dan);
            pst.setString(5, vreme);
            pst.setInt(6, idTehnicki);
            pst.setInt(7, idTermina);
            pst.setInt(8, idKorisnik);            
            Rezervacija rez = new Rezervacija(username, ime, prezime , dan, vreme, idTehnicki, idTermina, idKorisnik);
            request.setAttribute("rezervacija", rez);
            
            pst.execute();
                    
            
            String upit2 = "SELECT idRezervacije FROM rezervacija WHERE idTermina='"+idTermina 
                            +"' AND username='"+username+"';";
            
            st = con.createStatement();
            rs = st.executeQuery(upit2);
            
            if(rs.next()){
                int idRezervacije = rs.getInt("idRezervacije");
                request.setAttribute("idRezervacije", idRezervacije);              
            }
            
            String termin = (String)sesija.getAttribute("terminID");
            
            String upit3="";
            
            upit3 = "UPDATE termin SET rezervisano='da' WHERE idTermina='"+termin+"'";
                
            st.executeUpdate(upit3);
                 
            
            request.getRequestDispatcher("uspesnaRezervacija.jsp").forward(request, response);
       }   
         catch (Exception ex) {                
                request.setAttribute("msg", ex.getMessage());
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                }
                finally{
                    if(con!= null){
                        try {
                            st.close();
                            pst.close();
                            con.close();
                        } catch (SQLException ex) {
                            request.setAttribute("msg", ex.getMessage());
                            request.getRequestDispatcher("errorPage.jsp").forward(request, response); }
                        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
