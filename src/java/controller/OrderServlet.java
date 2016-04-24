package controller;

import domain.Customer;
import service.MyCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();       
        //check if customer login or not
        Customer loginCustomer;        
        if(request.getSession().getAttribute("loginCustomer")==null){          
            request.getRequestDispatcher("login.jsp").forward(request, response);//go to login  
        }else{
            loginCustomer=(Customer)request.getSession().getAttribute("loginCustomer");
            CustomerService customerService = new CustomerService();
            ArrayList addlist = customerService.findAddress(loginCustomer);
            request.setAttribute("addressList", addlist);
        
        }
               
        //user view order request
        MyCart myCart = (MyCart)request.getSession().getAttribute("myCart");
        ArrayList al=myCart.showMyCart();
        double totalPrice = myCart.getTotalPrice();
        request.setAttribute("orderInfo",al);
        request.setAttribute("totalPrice", totalPrice);
        //go to the order page
        request.getRequestDispatcher("shippingInfo.jsp").forward(request, response);
                
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }



    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
