/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bubanja
 */
public class PutnickoServlet extends HttpServlet {

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
        
        
        //String tip = request.getParameter("tip"); 
        int godiste = Integer.parseInt(request.getParameter("godiste"));
        int zapremina = Integer.parseInt(request.getParameter("zapremina"));
        int snaga = Integer.parseInt(request.getParameter("snaga"));
        int stepen = Integer.parseInt(request.getParameter("stepen"));
        //String saob = request.getParameter("saob");
        //String tablice = request.getParameter("tablice");
        
        int konacno = 0;
        
        if(zapremina<=1150 && godiste<=2003){
            konacno +=330;
        }
        else if(zapremina<=1150 && godiste<=2012){
            konacno +=990;
        }
        else if(zapremina<=1150 && godiste<=2014){
            konacno +=1237;
        }
        else if(zapremina<=1150 && godiste<=2017){
            konacno +=1402;
        }
        else if(zapremina<=1150 && godiste<=2023){
            konacno +=1650;
        }
        else if(zapremina<=1300 && godiste<=2003){
            konacno +=646;
        }
        else if(zapremina<=1300 && godiste<=2012){
            konacno +=1938;
        }
        else if(zapremina<=1300 && godiste<=2014){
            konacno +=2422;
        }
        else if(zapremina<=1300 && godiste<=2017){
            konacno +=2745;
        }
        else if(zapremina<=1300 && godiste<=2023){
            konacno +=3230;
        }
        else if(zapremina<=1600 && godiste<=2003){
            konacno +=1422;
        }
        else if(zapremina<=1600 && godiste<=2012){
            konacno +=4266;
        }
        else if(zapremina<=1600 && godiste<=2014){
            konacno +=5332;
        }
        else if(zapremina<=1600 && godiste<=2017){
            konacno +=6043;
        }
        else if(zapremina<=1600 && godiste<=2023){
            konacno +=7110;
        }
        else if(zapremina<=2000 && godiste<=2003){
            konacno +=2916;
        }
        else if(zapremina<=2000 && godiste<=2012){
            konacno +=8748;
        }
        else if(zapremina<=2000 && godiste<=2014){
            konacno +=10935;
        }
        else if(zapremina<=2000 && godiste<=2017){
            konacno +=12393;
        }
        else if(zapremina<=2000 && godiste<=2023){
            konacno +=14580;
        }
        else if(zapremina<=2500 && godiste<=2003){
            konacno +=14416;
        }
        else if(zapremina<=2500 && godiste<=2012){
            konacno +=25228;
        }
        else if(zapremina<=2500 && godiste<=2014){
            konacno +=43248;
        }
        else if(zapremina<=2500 && godiste<=2017){
            konacno +=54060;
        }
        else if(zapremina<=2500 && godiste<=2023){
            konacno +=72080;
        }
        else if(zapremina<=3000 && godiste<=2003){
            konacno +=29210;
        }
        else if(zapremina<=3000 && godiste<=2012){
            konacno +=51117;
        }
        else if(zapremina<=3000 && godiste<=2014){
            konacno +=87630;
        }
        else if(zapremina<=3000 && godiste<=2017){
            konacno +=109537;
        }
        else if(zapremina<=3000 && godiste<=2023){
            konacno +=146050;
        }
        else if(zapremina>3000 && godiste<=2003){
            konacno +=60374;
        }
        else if(zapremina>3000 && godiste<=2012){
            konacno +=105654;
        }
        else if(zapremina>3000 && godiste<=2014){
            konacno +=181122;
        }
        else if(zapremina>3000 && godiste<=2017){
            konacno +=226402;
        }
        else if(zapremina>3000 && godiste<=2023){
            konacno +=301870;
        }
        
        int takse = 0;
        
        int premija = 0;
        
        if(zapremina <= 1150){
         takse+= 710;   
        }
        else if(zapremina <= 1300){
         takse+= 1410;   
        }
        else if(zapremina <= 1600){
         takse+= 2130;   
        }
        else if(zapremina <= 2000){
         takse+= 2860;   
        }
        else if(zapremina <= 3000){
         takse+= 4300;   
        }
        else if(zapremina > 3000){
         takse+= 7110;   
        }
        
        if(snaga<=22){
         premija+=8641;
        }
        else if(snaga<=33){
         premija+=10321;
        }
        else if(snaga<=44){
         premija+=12016;
        }
        else if(snaga<=55){
         premija+=13712;
        }
        else if(snaga<=66){
         premija+=15393;
        }
        else if(snaga<=84){
         premija+=17652;
        }
        else if(snaga<=110){
         premija+=21029;
        }
        else if(snaga>110){
         premija+=24970;
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

        
        takse+= 236 + 660 + 1093;
        
        konacno += takse + premija;
        
        request.setAttribute("konacno", konacno);
        request.getRequestDispatcher("KalkulatorKonacno.jsp").forward(request, response);
        }
    }


