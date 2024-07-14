/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.user;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;
import utils.Helper;

/**
 *
 * @author legion
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/updateuser"})
public class UpdateUserController extends HttpServlet {

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
        String action = request.getParameter("action");
        boolean result = false;
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        switch (action) {
            case "profile":
                String image = request.getParameter("image");
                String name = request.getParameter("name");
                String gmail = request.getParameter("gmail");
                String phone = request.getParameter("phone");
                String address1 = request.getParameter("address1");
                String address2 = request.getParameter("address2");
                String password = request.getParameter("password");
                String correct = account.getPassword();

                if (password.equals(correct)) {
                    result = DAO.INS.updateUserInfo(account.getId(), image, name, gmail, phone, address1, address2, "", action);
                }
                break;

            case "password":
                String newPass = request.getParameter("newpass");
                String oldPass = request.getParameter("oldpass");
                String oldpassre = request.getParameter("oldpassre");

                if (oldPass.equals(oldpassre) && Helper.isValidString(newPass)) {
                    result = DAO.INS.updateUserInfo(account.getId(), "", "", "", "", "", "", newPass, action);
                }

                break;
        }
        if (result) {
            request.setAttribute("mess", "Update Successful");
        } else {
            request.setAttribute("mess", "Update Failed");
        }
        request.getRequestDispatcher("loaduser").forward(request, response);

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
