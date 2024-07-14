/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.favorties;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Account;
import models.Product;

/**
 *
 * @author legion
 */
@WebServlet(name = "AddToFavoritesController", urlPatterns = {"/addtofavorties"})
public class AddToFavoritesController extends HttpServlet {

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

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        List<Product> list = DAO.INS.getFavoriteProduct(acc.getId());

        int pid = Integer.parseInt(request.getParameter("pID"));
        boolean exist = false;
        for (Product p : list) {
            if (p.getProductID() == pid) {
                exist = true;
                break;
            }
        }
        if (!exist) {
            boolean result = DAO.INS.addToFavorite(acc.getId(), pid);

            if (result) {
                request.setAttribute("mess", "Added to Favorites");
                request.getRequestDispatcher("detail?pid=" + String.valueOf(pid)).forward(request, response);
            } else {
                request.setAttribute("failmess", "Failed to add to Favorites");
                request.getRequestDispatcher("detail?pid=" + String.valueOf(pid)).forward(request, response);
            }
        } else {
            request.setAttribute("failmess", "Already added to Favorites");
            request.getRequestDispatcher("detail?pid=" + String.valueOf(pid)).forward(request, response);
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
