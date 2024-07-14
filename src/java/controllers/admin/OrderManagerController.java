/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.admin;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.*;

/**
 *
 * @author legion
 */
@WebServlet(name="OrderManagerController", urlPatterns={"/ordermanager"})
public class OrderManagerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<Order> list = DAO.INS.getOrderList();
        List<Account> listAcc = DAO.INS.getUsernameList();
        List<OrderDetail> listDetail = DAO.INS.getOrderDetails();
        List<Product> listP = DAO.INS.loadEveryProduct();             
               
        int revenue = 0;
        float ordering_arrived = 0;
        int ordering = 0;
        int arrived = 0;       
        
        for(Order o : list){
            if(o.isIsOrdering() || o.isIsArrived()){
                revenue += o.getTotalPrice();
                ordering_arrived++;
            }
            
            if(o.isIsOrdering()) ordering++; 
            if(o.isIsArrived()) arrived++; 
            
        }
       
        String successRate =  String.format("%.2f", (ordering_arrived/list.size())*100);
        int arrivedOrder = (int) ordering_arrived;
             
        request.setAttribute("total", revenue);
        request.setAttribute("arrived", arrived);
        request.setAttribute("ordering", ordering);
        request.setAttribute("rate", successRate);
        request.setAttribute("details", listDetail);
        request.setAttribute("orders", list);
        request.setAttribute("listP", listP);
        request.setAttribute("accs", listAcc);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
