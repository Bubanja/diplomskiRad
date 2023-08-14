/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ognjen
 */
public class AdministriranjeKorisnikaServlet extends HttpServlet {

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
       
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");                     
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
            
            String upit = "SELECT * FROM korisnik"; 
            
            st = con.createStatement();
            
            rs = st.executeQuery(upit);
            
            ArrayList<Korisnik> korisnici = new ArrayList<>();
            
            while(rs.next()){              
                Korisnik k = new Korisnik(rs.getString("username"), rs.getString("password"), rs.getString("ime"), rs.getString("prezime"),
                        rs.getString("datum"), rs.getString("pol"), rs.getString("tip"), rs.getString("email"));
                k.setId(rs.getInt("idKorisnik"));
                
                korisnici.add(k);
            }
            
            request.setAttribute("korisnici", korisnici);
            request.getRequestDispatcher("administriranjeKorisnika.jsp").forward(request, response);
        }catch(Exception ex){
            request.setAttribute("msg", ex.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }finally{
            if(con !=null){
                try {
                    if(st!= null)
                        st.close();
                    con.close();
                } catch (SQLException ex) {
                    request.setAttribute("msg", ex.getMessage());
                    request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                }
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
