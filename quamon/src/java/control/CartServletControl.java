/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.servlet.http.*;

import entity.*;
import dao.*;

/**
 *
 * @author ACER
 */
@WebServlet(name = "CartServletControl", urlPatterns = {"/cart"})
public class CartServletControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        String code = request.getParameter("code");
        /* String quantityString = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityString); */
        // check "action"
        if (action != null && code != null) {
            HttpSession session = request.getSession();
            List<LineItem> listItem = (List<LineItem>) session.getAttribute("listItem");

            if (listItem == null) {
                listItem = new ArrayList<>();
                session.setAttribute("listItem", listItem);
            }
            if (action.equals("update")) {                              // add func update
                String quantityString = request.getParameter("quantity");
                int quantity = Integer.parseInt(quantityString);
                LineItem lineItem = findItemInCart(listItem, code);
                if (lineItem != null) {
                    lineItem.setQuantity(quantity);
                }
                session.setAttribute("listItem", listItem);
            }
            if (action.equals("add")) {                         ////////////////////////////bo else dau hang
                DAO dao = new DAO();
                Product product = dao.getProductByCode(code);
                LineItem lineItem = findItemInCart(listItem, code);
                if (lineItem != null) {
                    lineItem.setQuantity(lineItem.getQuantity() + 1);
                } else {
                    LineItem newItem = new LineItem(product, 1);
                    listItem.add(newItem);
                }
                /* int sum_int = 0;
                for (int i = 0; i < listItem.size(); i++) {
                    int sumeach = listItem.get(i).getTotal();
                    sum_int = sum_int + sumeach;
                }
                String sum = lineItem.getSumTotalFormat(sum_int);
                session.setAttribute("sum", sum); */
                session.setAttribute("listItem", listItem);
                // request.getRequestDispatcher("/shopping-cart.jsp").forward(request, response);
            } else if (action.equals("remove")) {
                LineItem lineItem = findItemInCart(listItem, code);
                if (lineItem != null) {
                    listItem.remove(lineItem);
                }
                session.setAttribute("listItem", listItem);
                // request.getRequestDispatcher("/shopping-cart.jsp").forward(request, response);
            }
        }
        request.getRequestDispatcher("/shopping-cart.jsp").forward(request, response);

    }

    private LineItem findItemInCart(List<LineItem> listItem, String code) {
        for (LineItem lineItem : listItem) {
            if (lineItem.getProduct().getCode().equals(code)) {
                return lineItem;
            }
        }
        return null;
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
    /* @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold> */

}
