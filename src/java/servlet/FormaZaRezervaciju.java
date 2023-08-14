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
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ognjen
 */
public class FormaZaRezervaciju extends HttpServlet {

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
       
        String poruka = request.getParameter("naziv");
          
        
        String idTehnickiString = request.getParameter("idTehnicki");
        int idTehnicki = Integer.parseInt(idTehnickiString);
        
//          String[] termin = new String[30];
//        String[] ponedeljak = new String[16];
//        String[] utorak = new String[16];
//        String[] sreda = new String[16];
//        String[] cetvrtak = new String[16];
//        String[] petak = new String[16];
         
         String terminA = new String();
         terminA = request.getParameter("termin");
//        ponedeljak = request.getParameterValues("Ponedeljak");      
//        utorak = request.getParameterValues("Utorak");
//        sreda = request.getParameterValues("Sreda");
//        cetvrtak = request.getParameterValues("Cetvrtak");
//        petak = request.getParameterValues("Petak");
        

        
//        if((request.getParameterValues("termin")) != null){
//            for( int i=0; i < termin.length; i++){
//                if(!termin[i].equals(""))
//                    terminA=termin[i];
//            }
//        }
        
//        else if((request.getParameterValues("Utorak")) != null){
//            for( int i=0; i < utorak.length; i++){
//               if(!utorak[i].equals(""))
//                    termin=utorak[i];
//            }
//        }
//        
//        else if((request.getParameterValues("Sreda")) != null){
//            for( int i=0; i < sreda.length; i++){
//                if(!sreda[i].equals(""))
//                    termin=sreda[i];
//            }
//        }
//        
//        else if((request.getParameterValues("Cetvrtak")) != null){
//            for( int i=0; i < cetvrtak.length; i++){
//                if(!cetvrtak[i].equals(""))
//                    termin=cetvrtak[i];
//            }
//        }
//                
//        else if((request.getParameterValues("Petak")) != null){
//            for( int i=0; i < petak.length; i++){
//                if(!petak[i].equals(""))
//                    termin=petak[i];
//            }
//        }
        
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
                     
        try {                    
            Class.forName("com.mysql.jdbc.Driver");                     
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
            
            //String naziv = request.getParameter("naziv");
            
            String upit2="Select * FROM termin WHERE idTermina='"+terminA+"'";
            st = con.createStatement();           
            rs = st.executeQuery(upit2);
            
            Termin tr = new Termin();
            
            if(rs.next()){
                int idTermina = rs.getInt("idTermina");
                String Rezervisano = rs.getString("rezervisano");
                int idTehnickog = rs.getInt("idTehnicki");
                String dan = rs.getString("dan");
                String vreme = rs.getString("vreme");
                
                tr.setIdTermina(idTermina);
                tr.setIdTehnicki(idTehnickog);
                tr.setRezervisano(Rezervisano);
                tr.setDan(dan);
                tr.setVreme(vreme);
                
                request.setAttribute("tr", tr);
            }
            
            String upit = "SELECT * FROM tehnicki WHERE idTehnicki='"+idTehnicki+"'";
            st = con.createStatement();           
            rs = st.executeQuery(upit);        
                                        
            Tehnicki t = new Tehnicki(); 
            
            if(rs.next()){               
                int idT = rs.getInt("idTehnicki");
                String naziv = rs.getString("naziv");
                String lokacija = rs.getString("lokacija");
                String radnoVreme = rs.getString("radnoVreme");
                String kontakt = rs.getString("kontakt");
                String slika = rs.getString("slika");
                
                
                
                t.setIdTehnicki(idT);
                t.setNaziv(naziv);
                t.setLokacija(lokacija);
                t.setRadnoVreme(radnoVreme);
                t.setKontakt(kontakt);
                t.setSlika(slika);
                
                request.setAttribute("termin", terminA);
                request.setAttribute("tehnicki", t);
                request.getRequestDispatcher("potvrdaRezervacijeTermina.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }           
            
         }   
         catch (Exception ex) {                
                request.setAttribute("msg", ex.getMessage());
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                }
                finally{
                    if(con!= null){
                        try {
                            st.close();
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
