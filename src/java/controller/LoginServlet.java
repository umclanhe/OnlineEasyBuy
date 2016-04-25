package controller;

import domain.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CustomerService;
import service.MyCart;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String cemail = request.getParameter("cemail");
            String cpsw = request.getParameter("cpsw"); 

            Customer loginCustomer = new Customer(cemail,cpsw);
            //check user identity
            CustomerService customerService = new CustomerService();
            if(customerService.checkCustomer(loginCustomer)){
                //login user session
                request.getSession().setAttribute("loginCustomer", loginCustomer);
                //shopping cart session
                MyCart myCart;
                if(request.getSession(false).getAttribute("myCart")==null){            
                    myCart = new MyCart();
                    request.getSession(false).setAttribute("myCart", myCart);
                }else{
                    myCart=(MyCart)request.getSession(false).getAttribute("myCart");
                }
                
                request.getRequestDispatcher("home.jsp").forward(request,response);
                
            }else{
                request.getRequestDispatcher("loginfailed.jsp").forward(request,response);
            }
                    
        }catch(Exception e){
            e.printStackTrace();
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
