/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Tehnicki;
import beans.Termin;
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
public class PrikazTermina extends HttpServlet {

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
        Statement stA = null;
        Statement stB = null;
        Statement stC = null;
        Statement stD = null;
        Statement stE = null;
        ResultSet rsA = null;
        ResultSet rsB = null;
        ResultSet rsC = null;
        ResultSet rsD = null;
        ResultSet rsE = null;
        
        try {                    
            Class.forName("com.mysql.jdbc.Driver");                     
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
            
            String idTenhickiString = request.getParameter("idTehnicki");
            int idTehnicki = Integer.parseInt(idTenhickiString);
            
            String upitA = "SELECT * FROM termin WHERE idTehnicki='"+idTehnicki+"' AND dan='ponedeljak'";
            String upitB = "SELECT * FROM termin WHERE idTehnicki='"+idTehnicki+"' AND dan='utorak'";
            String upitC = "SELECT * FROM termin WHERE idTehnicki='"+idTehnicki+"' AND dan='sreda'";
            String upitD = "SELECT * FROM termin WHERE idTehnicki='"+idTehnicki+"' AND dan='cetvrtak'";
            String upitE = "SELECT * FROM termin WHERE idTehnicki='"+idTehnicki+"' AND dan='petak'";
            
            stA = con.createStatement();           
            rsA = stA.executeQuery(upitA);        
                            
            ArrayList<Termin> TerminiA = new ArrayList<>();
            ArrayList<Termin> TerminiB = new ArrayList<>();
            ArrayList<Termin> TerminiC = new ArrayList<>();
            ArrayList<Termin> TerminiD = new ArrayList<>();
            ArrayList<Termin> TerminiE = new ArrayList<>();
            
            while(rsA.next()){ 
                Termin t = new Termin();
                t.setIdTermina(rsA.getInt("idTermina"));
                t.setIdTehnicki(rsA.getInt("idTehnicki"));
                t.setRezervisano(rsA.getString("rezervisano"));
                t.setDan(rsA.getString("dan"));
                t.setVreme(rsA.getString("vreme"));
                
                TerminiA.add(t);                                      
            }
            
            stB = con.createStatement();           
            rsB = stB.executeQuery(upitB);
            
            while(rsB.next()){
                Termin t = new Termin();
                t.setIdTermina(rsB.getInt("idTermina"));
                t.setIdTehnicki(rsB.getInt("idTehnicki"));
                t.setRezervisano(rsB.getString("rezervisano"));
                t.setDan(rsB.getString("dan"));
                t.setVreme(rsB.getString("vreme"));
                
                TerminiB.add(t);                                      
            }
            
            stC = con.createStatement();           
            rsC = stC.executeQuery(upitC);
            
            while(rsC.next()){ 
                Termin t = new Termin();
                t.setIdTermina(rsC.getInt("idTermina"));
                t.setIdTehnicki(rsC.getInt("idTehnicki"));
                t.setRezervisano(rsC.getString("rezervisano"));
                t.setDan(rsC.getString("dan"));
                t.setVreme(rsC.getString("vreme"));
                
                TerminiC.add(t);                                            
            }
            
            stD = con.createStatement();           
            rsD = stD.executeQuery(upitD);
            
            while(rsD.next()){ 
                Termin t = new Termin();
                t.setIdTermina(rsD.getInt("idTermina"));
                t.setIdTehnicki(rsD.getInt("idTehnicki"));
                t.setRezervisano(rsD.getString("rezervisano"));
                t.setDan(rsD.getString("dan"));
                t.setVreme(rsD.getString("vreme"));
                
                TerminiD.add(t);                                            
            }
            
            stE = con.createStatement();           
            rsE = stE.executeQuery(upitE);
            
            while(rsE.next()){ 
                Termin t = new Termin();
                t.setIdTermina(rsE.getInt("idTermina"));
                t.setIdTehnicki(rsE.getInt("idTehnicki"));
                t.setRezervisano(rsE.getString("rezervisano"));
                t.setDan(rsE.getString("dan"));
                t.setVreme(rsE.getString("vreme"));
                
                TerminiE.add(t);                                            
            }
            
            request.setAttribute("TerminiA", TerminiA);
            request.setAttribute("TerminiB", TerminiB);
            request.setAttribute("TerminiC", TerminiC);
            request.setAttribute("TerminiD", TerminiD);
            request.setAttribute("TerminiE", TerminiE);
            
            request.setAttribute("idTehnicki", idTehnicki);
            
            request.getRequestDispatcher("odabirTermina.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
                request.setAttribute("msg", ex.getMessage());          
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } catch (SQLException ex) {
                request.setAttribute("msg", ex.getMessage());          
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } finally{
            try {
                stA.close();
                stB.close();
                stC.close();
                con.close();
            } catch (SQLException ex) {
                request.setAttribute("msg", ex.getMessage());          
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
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
