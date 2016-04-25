package service;

import utils.DBUtil;
import domain.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.SqlHelper;

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
                item.setPrice(Double.parseDouble(rs.getString(4)));
                item.setInventory(Integer.parseInt(rs.getString(5)));
                item.setPicture(rs.getString(7));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProductService.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return item;
    }
    
    public ArrayList getAllProduct(){
        
        String sql = "select * from book where l=?";
        String paras[]={"1"};
        ArrayList al = new SqlHelper().executeQuery(sql,paras);
        ArrayList<Product> newAl = new ArrayList<Product>();
        
        for(int i=0; i<al.size();i++){
            Object obj[] = (Object[])al.get(i);
            Product product = new Product();
            product.setPid(Integer.parseInt(obj[0].toString()));
            product.setPname(obj[1].toString());
            product.setCategory(obj[2].toString());
            product.setPrice(Double.parseDouble(obj[3].toString()));
            product.setInventory(Integer.parseInt(obj[4].toString()));
            product.setFeature(obj[5].toString());
            product.setPicture(obj[6].toString());          
            newAl.add(product);
        }     
        
        return newAl;
    }
    
}
