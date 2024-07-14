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
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.AccountDetail;

/**
 *
 * @author legion
 */
@WebServlet(name = "UserManagerController", urlPatterns = {"/usermanager"})
public class UserManagerController extends HttpServlet {

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

        List<AccountDetail> details = DAO.INS.getAccountDetail();
        List<Account> accounts = DAO.INS.getUsernameList();

        for (AccountDetail detail : details) {
            if (detail.getName() == null) {
                detail.setName("(Empty)");
            }
            if(detail.getImage() == null){
                detail.setImage("https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_960_720.png");
            }
            if (detail.getGmail() == null) {
                detail.setGmail("(Empty)");
            }
            if (detail.getPhone() == null) {
                detail.setPhone("(Empty)");
            }
            if (detail.getAddress1() == null) {
                detail.setAddress1("(Empty)");
            }
            if (detail.getAddress2() == null) {
                detail.setAddress2("(Empty)");
            }

        }

        request.setAttribute("detail", details);
        request.setAttribute("acc", accounts);
        request.getRequestDispatcher("usermanage.jsp").forward(request, response);
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
