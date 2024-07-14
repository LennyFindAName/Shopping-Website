/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.cart;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.Cart;

/**
 *
 * @author legion
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/addtocart"})
public class AddToCartController extends HttpServlet {

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
            int pID = Integer.parseInt(request.getParameter("pID"));
            ArrayList<Cart> list = new ArrayList<>();

            //Set default values
            Cart cart = new Cart();
            cart.setProductID(pID);
            cart.setQuantity(1);

            HttpSession session = request.getSession();
            ArrayList<Cart> sessionList = (ArrayList<Cart>) session.getAttribute("cartlist");

            if (sessionList == null) {
                //If sessionList is null , create it
                list.add(cart);
                session.setAttribute("cartlist", list);
                request.setAttribute("mess", "Added to the cart !");
                request.getRequestDispatcher("detail?pid=" + String.valueOf(pID)).forward(request, response);
            } else {
                //Load the existed list
                list = sessionList;

                boolean existed = false;
                for (Cart c : sessionList) {
                    if (c.getProductID() == pID) {
                        existed = true;
                        request.setAttribute("failmess", "Product already added to the cart");
                        request.getRequestDispatcher("detail?pid=" + String.valueOf(pID)).forward(request, response);

                    }
                }
                if (!existed) {
                    list.add(cart);
                    request.setAttribute("mess", "Added to the cart !");
                    request.getRequestDispatcher("detail?pid=" + String.valueOf(pID)).forward(request, response);
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
