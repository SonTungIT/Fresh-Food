/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.product.ProductError;

/**
 *
 * @author Lenovo Legion
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            Date importDate = Date.valueOf(request.getParameter("importDate"));
            Date usingDate = Date.valueOf(request.getParameter("usingDate"));
            Boolean status = Boolean.parseBoolean(request.getParameter("status"));

            boolean checkValidation = true;
            ProductDAO dao = new ProductDAO();
//            boolean checkDuplicate=dao.checkDuplicate(productID);
//            if(checkDuplicate){
//                productError.setProductIDError("Duplicate!!!");
//                checkValidation=false;
//            }
            if (productID.length() < 2 || productID.length() > 10) {
                productError.setProductIDError("Product ID must be in [2,10]");
                checkValidation = false;
            }
            if (productName.length() < 5 || productName.length() > 20) {
                productError.setProductNameError("Product Name must be in [5,20]");
                checkValidation = false;
            }
            if (checkValidation) {
                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, categoryID, importDate, usingDate, status);
//                boolean checkCreate=dao.create(product);
                boolean checkCreate = dao.createV2(product);
                if (checkCreate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                productError.setProductIDError("Trung user ID roi kia !!!");
                request.setAttribute("PRODUCT_ERROR", productError);
            }
            log("ERROR AT CreateController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
