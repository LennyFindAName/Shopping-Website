/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.list;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import models.*;
import utils.*;

/**
 *
 * @author legion
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {

    

    int[] nrppArr = {1, 2, 3, 4, 5};
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
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


        //Load searched data
        String cid = request.getParameter("cid");
        List<Product> list = DAO.INS.getProductByCID(cid);
        Paging p = new Paging(list.size(), nrpp, index);
        p.calc();

        //Load search list
        DAO.INS.LoadAll();
        List<Category> listC = DAO.INS.getCtg();
        List<Manufacturer> listM = DAO.INS.getMft();

        //Display
        request.setAttribute("listC", listC);
        request.setAttribute("listM", listM);

        //Paging
        request.setAttribute("page", p);
        request.setAttribute("nrppArr", nrppArr);
        request.setAttribute("listP", list);
        
        //Selected Category 
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("list.jsp").forward(request, response);
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
//        Vector<Integer> listM = new Vector<Integer>();
//        
//        for(Manufacturer d : DAO.INS.getManufactureList()){
//            if(request.getParameter("chk" +d.getManufacturerID())!= null) listM.add(d.getManufacturerID());
//        }

        int index = Integer.parseInt(request.getParameter("index"));
        int total = Integer.parseInt(request.getParameter("total"));

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