/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.cart;

import dal.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.*;

/**
 *
 * @author legion
 */
@WebServlet(name = "MakeOrderController", urlPatterns = {"/makeorder"})
public class MakeOrderController extends HttpServlet {

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

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date = new Date();
        Account user = (Account) request.getSession().getAttribute("account");
        AccountDetail userDetail = DAO.INS.getUserInfo(user.getId());

        HttpSession session = request.getSession();
        ArrayList<Cart> sessionList = (ArrayList<Cart>) session.getAttribute("cartlist");

        //Check if user has updated the profile        
        if (userDetail.getName() == null
                || userDetail.getGmail() == null
                || userDetail.getPhone() == null
                || userDetail.getAddress1() == null
                || userDetail.getAddress2() == null) {
            request.setAttribute("failmess", "Purchase failed , You need to update all of your profile");
            request.getRequestDispatcher("loadcart").forward(request, response);
        } else {
            String address = (String) request.getParameter("address");

            //Count total price
            List<Cart> list = DAO.INS.getCartProducts(sessionList);
            int sumPrice = 0;
            int sumTaxFee = 0;
            for (Cart item : list) {
                sumPrice += item.getTotalPrice();
                sumTaxFee += item.getTaxFee() * item.getQuantity();
            }

            //Insert order info
            DAO.INS.insertOrder(user.getId(), formatter.format(date), sumPrice + sumTaxFee, address);

            //Search for order's ID        
            String orderID = DAO.INS.getOrderID(user.getId(), formatter.format(date));

            //Insert order details based on order's ID        
            boolean result = DAO.INS.insertOrderDetail(sessionList, orderID, formatter.format(date));

            //Update products's amount if success

            if (result) {
                DAO.INS.updateProductAmount(sessionList);
                //Remove session list
                session.removeAttribute("cartlist");
                request.setAttribute("mess", "Purchase successfully");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else {
                request.setAttribute("failmess", "Purchase failed");
                request.getRequestDispatcher("loadcart").forward(request, response);
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
