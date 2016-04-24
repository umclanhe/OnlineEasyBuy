/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Address;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MyCart;

/**
 *
 * @author zjy
 */
@WebServlet(name = "ReviewServlet", urlPatterns = {"/ReviewServlet"})
public class ReviewServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String yes = "Yes";
            String no = "No";
            //prepare shipping address;
            Address saddress = (Address)request.getSession().getAttribute("shippingAddress");
            Address baddress = new Address();
            //billing address         
            String selectBillAddress =  request.getParameter("selectBillAdd");
            if (selectBillAddress == "new"){                
                String aname = request.getParameter("aname");
                String street = request.getParameter("street");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String zip = request.getParameter("zip");
                String phone = request.getParameter("phone");
                baddress.setAname(aname);
                baddress.setStreet(street);
                baddress.setCity(city);
                baddress.setState(state);
                baddress.setZip(Integer.parseInt(zip));
                baddress.setPhone(phone);
                request.getSession().setAttribute("newBillAdd", yes);
                //request.getSession().setAttribute("billingAddress", baddress);
             }else{ //billing address is same as shipping address
                request.getSession().setAttribute("newBillAdd", no); 
                baddress = saddress;                
            }
            
            request.getSession().setAttribute("billingAddress", baddress);
            //user view order request
            MyCart myCart = (MyCart)request.getSession().getAttribute("myCart");
            ArrayList al=myCart.showMyCart();
            double totalPrice = myCart.getTotalPrice();
            request.setAttribute("orderInfo",al);
            request.setAttribute("totalPrice", totalPrice);
            
            request.getRequestDispatcher("orderReview.jsp").forward(request, response);
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
