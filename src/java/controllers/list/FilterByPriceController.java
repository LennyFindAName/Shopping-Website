/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.list;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Category;
import models.Manufacturer;
import models.Paging;
import models.Product;

/**
 *
 * @author legion
 */
@WebServlet(name = "FilterByPriceController", urlPatterns = {"/pricefilter"})
public class FilterByPriceController extends HttpServlet {

    int[] nrppArr = {1, 2, 3, 4, 5};
    int max;
    int min;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO.INS.LoadAll();

        try {
            min = Integer.parseInt(request.getParameter("min"));
            max = Integer.parseInt(request.getParameter("max"));
        } catch (Exception e) {
        }
        List<Product> listP = DAO.INS.getProductByPriceBetween(min, max);
        

        int isFilter;
        try {
            isFilter = Integer.parseInt(request.getParameter("isFilter"));
        } catch (Exception e) {
            isFilter = 0;
        }

        int index = -1;
        try {
            index = Integer.parseInt(request.getAttribute("index") + "");
        } catch (Exception e) {
            index = 0;
        }

        int nrpp = 3;
        try {
            nrpp = Integer.parseInt(request.getAttribute("nrpp") + "");
        } catch (Exception e) {
            nrpp = 3;
        }

        Paging p = new Paging(DAO.INS.getPrd().size(), nrpp, index);
        p.calc();

        List<Category> listC = DAO.INS.getCtg();
        List<Manufacturer> listM = DAO.INS.getMft();

        //Display
        request.setAttribute("listC", listC);
        request.setAttribute("listM", listM);
        //Paging
        request.setAttribute("page", p);
        request.setAttribute("nrppArr", nrppArr);
        request.setAttribute("listP", listP);
        
        request.setAttribute("isFilter", isFilter);
        request.getRequestDispatcher("list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int index = Integer.parseInt(request.getParameter("index"));
        int total = Integer.parseInt(request.getParameter("total"));

        try {
            min = Integer.parseInt(request.getParameter("min"));
            max = Integer.parseInt(request.getParameter("max"));

        } catch (Exception e) {
        }
        List<Product> listP = DAO.INS.getProductByPriceBetween(min, max);
        request.setAttribute("listP", listP);

        if (request.getParameter("btnHome") != null) {
            index = 0;
        }
        if (request.getParameter("btnPre") != null) {
            index -= 1;
        }
        if (request.getParameter("btnNext") != null) {
            index += 1;
        }
        if (request.getParameter("btnEnd") != null) {
            index = total;
        }

        for (int i = 0; i < total; i++) {
            if (request.getParameter("btn" + i) != null) {
                index = i;
            }
        }

        int nrpp = Integer.parseInt(request.getParameter("nrpp"));

        request.setAttribute("index", index);
        request.setAttribute("nrpp", nrpp);

        doGet(request, response);

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
