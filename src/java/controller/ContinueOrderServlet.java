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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CustomerService;

/**
 *
 * @author zjy
 */
@WebServlet(name = "ContinueOrderServlet", urlPatterns = {"/ContinueOrderServlet"})
public class ContinueOrderServlet extends HttpServlet {

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
           //go to the orersubmit page
           String yes = "Yes";
           String no = "No";
           String selectAddress =  request.getParameter("selectAdd");
           if (selectAddress.equals("new")){
               Address saddress = new Address();
               String aname = request.getParameter("aname");
               String street = request.getParameter("street");
               String city = request.getParameter("city");
               String state = request.getParameter("state");
               String zip = request.getParameter("zip");
               String phone = request.getParameter("phone");
               saddress.setAname(aname);
               saddress.setStreet(street);
               saddress.setCity(city);
               saddress.setState(state);
               saddress.setZip(Integer.parseInt(zip));
               saddress.setPhone(phone);
               request.getSession().setAttribute("shippingAddressnew",yes);  //mark: new a shipping address
               request.getSession().setAttribute("shippingAddress", saddress);
           }else{
               request.getSession().setAttribute("shippingAddressnew",no);           
               CustomerService customerService = new CustomerService();
               Address saddress = customerService.findAddress(selectAddress+"");                             
               request.getSession().setAttribute("shippingAddress", saddress);
           
           }
           /*
           String sameBillAdd = request.getParameter("sameAdd");
           if(sameBillAdd == null){
               request.setAttribute("newBillAdd", "Y");
           }else{
               request.setAttribute("newBillAdd", "N");               
           }
           */
           request.getRequestDispatcher("paymentInfo.jsp").forward(request, response);

        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
                
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }



    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
