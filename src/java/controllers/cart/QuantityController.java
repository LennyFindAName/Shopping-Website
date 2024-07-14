/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.cart;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.*;

/**
 *
 * @author legion
 */
@WebServlet(name = "QuantityController", urlPatterns = {"/quantity"})
public class QuantityController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            
            //Cart List on the Session
            ArrayList<Cart> sessionList = (ArrayList<Cart>) session.getAttribute("cartlist");
            
            //Cart List on the DB
            ArrayList<Cart> list = (ArrayList<Cart>) DAO.INS.getCartProducts(sessionList) ;
            
            //Assign Amount values to session list
            for(Cart cL : list){
                for(Cart cS : sessionList){
                    if(cS.getProductID() == cL.getProductID()){
                        cS.setAmount(cL.getAmount());
                    }
                }
            }

            //Plus-Minus Action
            if (action != null && id >= 1) {
                switch (action) {
                    case "plus":
                        for (Cart c : sessionList) {
                            if (c.getProductID() == id && c.getQuantity() < c.getAmount()) {
                                int quantity = c.getQuantity();
                                c.setQuantity(++quantity);
                            }
                        }
                        break;
                    case "minus":
                        for (Cart c : sessionList) {
                            if (c.getProductID() == id && c.getQuantity() > 1) {
                                int quantity = c.getQuantity();
                                c.setQuantity(--quantity);
                            }
                        }
                        break;
                }
                response.sendRedirect("loadcart");
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
