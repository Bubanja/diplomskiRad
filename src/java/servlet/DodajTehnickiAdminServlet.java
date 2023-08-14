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
 * @author Bubanja
 */
public class DodajTehnickiAdminServlet extends HttpServlet {

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
        
        String naziv = request.getParameter("naziv");
        String radnoVreme = request.getParameter("radnoVreme");
        String lokacija = request.getParameter("lokacija");
        String kontakt = request.getParameter("kontakt");
        String slika = request.getParameter("slika");
        
        Connection con = null;
        PreparedStatement pst = null; 
        Statement st = null;
        ResultSet rs = null;
        
        if(naziv != null && naziv.length() > 0 && radnoVreme != null && radnoVreme.length() > 0 
           && lokacija != null && lokacija.length() > 0
           && kontakt != null && kontakt.length() > 0 && slika != null && slika.length() > 0 ){
            
            try {                                                        
                Class.forName("com.mysql.jdbc.Driver");  
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencija", "root", "");
                
                String upit = "SELECT * FROM tehnicki WHERE naziv='"+naziv+"'";
                st = con.createStatement();
                rs = st.executeQuery(upit);
                
                if(rs.next()){
                    request.setAttribute("msg", "Tehnički sa ovim imenom vec postoji!");
                    request.getRequestDispatcher("dodajTehnickiAdmin.jsp").forward(request, response);
                }else{
                    String upit1 = "INSERT INTO tehnicki(naziv, lokacija, radnoVreme, kontakt, slika)"
                        + " VALUES (?,?,?,?,?)";

                    pst = con.prepareStatement(upit1);
                    pst.setString(1, naziv);
                    pst.setString(2, lokacija);
                    pst.setString(3, radnoVreme);
                    pst.setString(4, kontakt);
                    pst.setString(5, slika); 
                  
                    pst.executeUpdate();
                    
                    String upit2="SELECT idTehnicki FROM tehnicki WHERE naziv='"+naziv+"';";
                    st = con.createStatement();
                    rs = st.executeQuery(upit2);
                    
                    if(rs.next()){
                int idTehnicki = rs.getInt("idTehnicki");           
            
                    
                    String upit3="INSERT INTO termin(rezervisano,idTehnicki,dan,vreme)" + " VALUES ('ne', ?, 'ponedeljak', '9:30')," +
"('ne', ?, 'ponedeljak', '11:30')," +
"('ne', ?, 'ponedeljak', '13:30')," +
"('ne', ?, 'ponedeljak', '15:30')," +
"('ne', ?, 'utorak', '9:30')," +
"('ne', ?, 'utorak', '11:30')," +
"('ne', ?, 'utorak', '13:30')," +
"('ne', ?, 'utorak', '15:30')," +
"('ne', ?, 'sreda', '9:30')," +
"('ne', ?, 'sreda', '11:30')," +
"('ne', ?, 'sreda', '13:30')," +
"('ne', ?, 'sreda', '15:30')," +
"('ne', ?, 'cetvrtak', '9:30')," +
"('ne', ?, 'cetvrtak', '11:30')," +
"('ne', ?, 'cetvrtak', '13:30')," +
"('ne', ?, 'cetvrtak', '15:30')," +
"('ne', ?, 'petak', '9:30')," +
"('ne', ?, 'petak', '11:30')," +
"('ne', ?, 'petak', '13:30')," +
"('ne', ?, 'petak', '15:30');";
                    
                    pst = con.prepareStatement(upit3);
                    pst.setInt(1, idTehnicki);
                    pst.setInt(2, idTehnicki);
                    pst.setInt(3, idTehnicki);
                    pst.setInt(4, idTehnicki);
                    pst.setInt(5, idTehnicki);
                    pst.setInt(6, idTehnicki);
                    pst.setInt(7, idTehnicki);
                    pst.setInt(8, idTehnicki);
                    pst.setInt(9, idTehnicki);
                    pst.setInt(10, idTehnicki);
                    pst.setInt(11, idTehnicki);
                    pst.setInt(12, idTehnicki);
                    pst.setInt(13, idTehnicki);
                    pst.setInt(14, idTehnicki);
                    pst.setInt(15, idTehnicki);
                    pst.setInt(16, idTehnicki);
                    pst.setInt(17, idTehnicki);
                    pst.setInt(18, idTehnicki);
                    pst.setInt(19, idTehnicki);
                    pst.setInt(20, idTehnicki);
                    
                    pst.executeUpdate();
                    }

                    String msg = "Uspesno ste se dodali tehnički!";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("AdministriranjeTehnickihServlet").forward(request, response);
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
