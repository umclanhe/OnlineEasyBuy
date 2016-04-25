package service;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class AddProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();        
       
        String pid=request.getParameter("pid");
        
        MyCart myCart;
        if(request.getSession().getAttribute("myCart")==null){            
            myCart = new MyCart();
            request.getSession(false).setAttribute("myCart", myCart);
        }else{
            myCart=(MyCart)request.getSession(false).getAttribute("myCart");
        }
/*      ProductService newpservice = new ProductService();
        int inventory = newpservice.getProduct(pid).getInventory(); 
        int quant = newpservice.getProduct(pid).getQuantity();
        System.out.println("number of the products: "+inventory);
        String text="";
        boolean addValid = true;
        if(inventory == 0) {
            System.out.println("The product is out of stock!!");
             text = inventory+"";
             addValid = false;
        }
        if(myCart.hm.containsKey(pid) && (inventory == quant)) {       
            System.out.println("Inventory shortage: please reduce the quantity of the product!!");
            text=-1+"";
            addValid = false;           
        }
        
        if(addValid) {
            myCart.addProduct(pid);
            int num = myCart.getTotalNum();
            System.out.println(num);
            System.out.println(pid);
            text = num+"";            
        } */
        myCart.addProduct(pid);
        int num = myCart.getTotalNum();
        System.out.println(num);
        System.out.println(pid);
        String text = num+"";  
        
        response.getWriter().write(text);                      
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
