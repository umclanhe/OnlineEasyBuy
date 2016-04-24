/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.io.Serializable;
import java.util.*;
/**
 *
 * @author Lan
 */
public class Category extends Object implements Serializable {
    private String cname;
    List<Product> cproducts;
    
    public Category() {
        cname = "";
        cproducts = new ArrayList<> ();
    }
    
    public String getCategoryname() {
        return cname;
    }
    
    public void setCategoryname(String name) {
        this.cname = name;        
    }
    
    public synchronized void addCproduct (Product product) {      
       cproducts.add(product); 
    }
     
    public synchronized List<Product> getCproducts () {
        return cproducts;
    }
    
     public synchronized void setCproducts (List<Product> productList) {
        cproducts = productList;
    }
     
     public synchronized void clear() {
        cproducts.clear();
    }        
}
