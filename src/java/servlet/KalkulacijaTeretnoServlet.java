/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zemuu
 */
public class KalkulacijaTeretnoServlet extends HttpServlet {

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
       int godiste = Integer.parseInt(request.getParameter("godiste"));
        int nosivost = Integer.parseInt(request.getParameter("nosivost"));
        int stepen = Integer.parseInt(request.getParameter("stepen"));;
        String saobracajna = request.getParameter("saob");
        String tablice = request.getParameter("tablice");
        String tehnicki = request.getParameter("tehnicki");
        
        int konacno = 0;
               
        int takse = 0;
        
        int premija = 0;
        
        
        if(saobracajna!=null && saobracajna.length()>0 && tablice!=null && tablice.length()>0 && tehnicki!=null && tehnicki.length()>0){
                    if(saobracajna.equals("saob")){
            konacno +=660;
            takse +=660;
            
        }
                    if(tablice.equals("tablice")){
                        konacno+=1093;
                        takse+=1093;
                    }
                     if(tehnicki.equals("tehnicki")){
                        konacno+=7000; 
                    }
        }
        
        if(nosivost<=2000){
            takse+=2140;
        }
        else if(nosivost<=5000){
            takse+=2860;
        }
        else if(nosivost<=12000){
            takse+=4980;
        }
        else if(nosivost>12000){
            takse+=7110;
        }
        
        if(nosivost<=500){
            premija+=17604;
        }
        else if(nosivost<=1000){
            premija+=19514;
        }
        else if(nosivost<=2000){
            premija+=30593;
        }
        else if(nosivost<=3000){
            premija+=33514;
        }
        else if(nosivost<=5000){
            premija+=37887;
        }
        else if(nosivost<=7000){
            premija+=43727;
        }
        else if(nosivost<=10000){
            premija+=65621;
        }
        else if(nosivost<=15000){
            premija+=75547;
        }
        else if(nosivost>15000){
            premija+=87948;
        }
        
        switch (stepen) {
            case 4:
                break;
            case 3:
                premija = premija - premija * 5 / 100;
                break;
            case 2:
                premija = premija - premija * 15 / 100;
                break;
            case 1:
                premija = premija - premija * 25 / 100;
                break;
            default:
                break;
        }
        
        takse+= 236;
        
        konacno += takse + premija;
        
        request.setAttribute("takse", takse);
        request.setAttribute("konacno", konacno);
        request.getRequestDispatcher("kalkulatorKonacno.jsp").forward(request, response);
        
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
