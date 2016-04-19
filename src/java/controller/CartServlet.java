package controller;

import service.MyCart;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {


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
        
        //type add/delete/update
        String type=request.getParameter("type");
        String pid=request.getParameter("pid");
        MyCart myCart;
        if(request.getSession().getAttribute("myCart")==null){            
            myCart = new MyCart();
            request.getSession().setAttribute("myCart", myCart);
        }else{
            myCart=(MyCart)request.getSession().getAttribute("myCart");
        }
                
        if(type.equals("add")){                           
            myCart.addProduct(pid);        
        }else if (type.equals("delete")){           
            myCart.deleteProduct(pid);
        }else if(type.equals("addone")){            
            myCart.addOne(pid);            
        }else if(type.equals("delone")){
            myCart.delOne(pid);
        }else if(type.equals("deleteall")){
            myCart.deleteAll();
        }else if(type.equals("continue")){
            request.setAttribute("TotalNum",myCart.getTotalNum()+"");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
            //request.setAttribute("TotalNum",myCart.getTotalNum()+"");
        }
        //product list
        request.setAttribute("ProductList", myCart.showMyCart());           
        //total price
        request.setAttribute("TotalPrice", myCart.getTotalPrice()+"");            
        request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
         
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }



    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
