package service;

import utils.DBUtil;
import domain.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductService {
    
    public Product getProduct(String pid){
        String sql="select * from product where pid="+pid+"";            
        Connection conn;
        conn=DBUtil.getConnection();
        Product item = new Product();
        try {
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery(sql);

            while(rs.next()){
                item.setPid(Integer.parseInt(rs.getString(1)));
                item.setPname(rs.getString(2));
                item.setCategory(rs.getString(3));
                item.setPrice(Double.parseDouble(rs.getString(4)));
                item.setInventory(Integer.parseInt(rs.getString(5)));
                item.setFeature(rs.getString(6));
                item.setPicture(rs.getString(7));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductService.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return item;
    }
}
