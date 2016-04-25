/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Address;
import domain.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MyCart;
import service.PlaceOrder;

/**
 *
 * @author zjy
 */
@WebServlet(name = "SubmitServlet", urlPatterns = {"/SubmitServlet"})
public class SubmitServlet extends HttpServlet {

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
            PlaceOrder placeOrder = new PlaceOrder();
            
            //get cid
            Customer loginCustomer = (Customer)request.getSession().getAttribute("loginCustomer"); 
            String customerId = loginCustomer.getCid()+"";

            // aid? or insert
            Address saddress = (Address)request.getSession().getAttribute("shippingAddress");
            Address baddress = (Address)request.getSession().getAttribute("billingAddress");   
            String newShippingAddress = (String)request.getSession().getAttribute("shippingAddressnew");
            String newBillAdd = (String)request.getSession().getAttribute("newBillAdd");
            String saddressId;
            String baddressId;
            //shipping address            
            if(newShippingAddress=="Yes"){
                //insert new address into database address table and return aid
                placeOrder.addAddress(saddress, loginCustomer);
                saddressId = placeOrder.getAid(loginCustomer);
            }else{
                //get aid
                saddressId = saddress.getAid()+"";                
            }
            //billing address            
            if(newBillAdd=="Yes"){
                placeOrder.addAddress(baddress, loginCustomer);
                baddressId = placeOrder.getAid(loginCustomer);
            }else{
                baddressId = saddressId;
            }
                                
            //pid, quantity
            MyCart myCart = (MyCart)request.getSession().getAttribute("myCart");
            //update order,transaction, product table
            boolean addordervalid = false;
            addordervalid = placeOrder.addOrder(loginCustomer, myCart, saddressId, baddressId);         
            if(addordervalid){
                request.getRequestDispatcher("orderSubmit.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("orderFailed.jsp").forward(request, response);
            }         
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
