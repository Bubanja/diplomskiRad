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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ps170381d
 */
public class PotvrdiIzmeneSlep extends HttpServlet {

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
       
        
         String msg="";
        
        Connection con =null;
        PreparedStatement pst=null;
        ResultSet rs =null; 
        
        try{                                        
            int idSlep = Integer.parseInt(request.getParameter("id"));
            String nosivost = request.getParameter("nosivost");             
            String cena = request.getParameter("cena");
            String kontakt = request.getParameter("kontakt");
            

            if(nosivost.isEmpty() || cena.isEmpty() || kontakt.isEmpty()){
                msg = "Morate popuniti sva polja!";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("IzmeniTehnickiAdminServlet?id="+idSlep+"").forward(request, response);
            }       
      
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
            
            String upit = "Update slep"
                    + " SET nosivost = ?, cena = ?,  kontakt = ? WHERE idSlep = ?" ;
            pst = con.prepareStatement(upit);
            
            pst.setString(1, nosivost);
            pst.setString(2, cena);
            pst.setString(3, kontakt);
            
            pst.setInt(4, idSlep);

            
            int rowsAffected = pst.executeUpdate();
                      
            request.getRequestDispatcher("MenadzerVozilaServlet").forward(request, response);
        }catch (Exception ex) {             
            msg = ex.getMessage();
            request.setAttribute("msg", msg);           
           request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }                 
        finally{
            if(con!= null){
                try {
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
