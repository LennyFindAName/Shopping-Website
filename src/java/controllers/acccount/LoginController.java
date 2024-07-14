/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.acccount;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import models.*;
import dal.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import java.util.*;

/**
 *
 * @author legion
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private static final String CookieUsername = "rememberMeUsername";
    private static final String CookiePassword = "rememberMePasword";
    private static final int CookieMaxAge = 3600 * 24; // 1 day

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

//        response.setContentType("text/html;charset=UTF-8");
//        String u = request.getParameter("user");
//        String p = request.getParameter("pass");
//
//        Account account = DAO.INS.getUser(u, p);
//
//        if (account == null) {
//            request.setAttribute("failmess", "Invalid username or password !");
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        } else {
//            HttpSession sess = request.getSession();
//            sess.setAttribute("account", account);
//            sess.setMaxInactiveInterval(1000);
//
//            response.sendRedirect("home");
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = null;
        String password = null;
        Account account = DAO.INS.getUser(username, password);
        if (account != null) {
            session.setAttribute("account", account);
            response.sendRedirect("home");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //boolean isRemeberMe = request.getParameter("isRemeberMe") != null;
        Account account = DAO.INS.getUser(username, password);
        if (account == null) {
            request.setAttribute("failmess", "Sign in fail username or pasword");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            session.setAttribute("account", account);
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
