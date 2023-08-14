/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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

/**
 *
 * @author ps170381d
 */
public class DodajVoziloMenadzerServlet extends HttpServlet {

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
        
        String nosivost = request.getParameter("nosivost");
        String stringCena = request.getParameter("cena");
        String kontakt = request.getParameter("kontakt");
        String rezervisano = "ne";
        int cena = Integer.parseInt(stringCena);
        
        Connection con = null;
        PreparedStatement pst = null; 
        Statement st = null;
        ResultSet rs = null;
        
        if(nosivost != null && nosivost.length() > 0
           && kontakt != null && kontakt.length() > 0){
            
            try {                                                        
                Class.forName("com.mysql.jdbc.Driver");  
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
                
                String upit = "SELECT * FROM slep WHERE kontakt='"+kontakt+"'";
                st = con.createStatement();
                rs = st.executeQuery(upit);
                
                if(rs.next()){
                    request.setAttribute("msg", "Slep sa ovim kontaktom vec postoji vec postoji!");
                    request.getRequestDispatcher("dodajVoziloMenadzer.jsp").forward(request, response);
                }else{
                    String upit1 = "INSERT INTO slep(nosivost, rezervisano, cena, kontakt)"
                        + " VALUES (?,?,?,?)";

                    pst = con.prepareStatement(upit1);
                    pst.setString(1, nosivost);
                    pst.setString(2, rezervisano);
                    pst.setInt(3, cena);
                    pst.setString(4, kontakt); 
                  
                    pst.executeUpdate();

                    String msg = "Uspesno ste se dodali Vozilo!";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("MenadzerVozilaServlet").forward(request, response);
                }                                                                           
            } catch (Exception ex) {                
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
        }else{
                request.setAttribute("msg", "Morate popuniti sva polja!");
                request.getRequestDispatcher("dodajAgencijuAdmin.jsp").forward(request, response);  
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
