/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import domain.*;
import java.util.*;
import utils.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lan
 */
public class CategoryService {
    public CategoryService() {
        
    }
   public List<Product> getProductList(String cname) {      
      List<Product> productList = new ArrayList<>();
      Connection conn;
      conn=DBUtil.getConnection();
      String q1 = new String("SELECT * FROM PRODUCT WHERE UPPER(PCATEGORY) LIKE UPPER('%"+cname+"%')");
      Product item = new Product();    
      try {
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(q1);

            while(rs.next()){
                item.setPid(Integer.parseInt(rs.getString(1)));
                item.setPname(rs.getString(2));
                item.setCategory(rs.getString(3));
                item.setPrice(Double.parseDouble(rs.getString(4)));
                item.setInventory(Integer.parseInt(rs.getString(5)));
                item.setFeature(rs.getString(6));
                item.setPicture(rs.getString(7));
                productList.add(item);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductService.class.getName()).log(Level.SEVERE, null, ex);
        }
      
      return productList;
   }
    
}
