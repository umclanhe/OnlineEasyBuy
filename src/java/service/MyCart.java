package service;
import service.ProductService;
import java.util.*;
import domain.Product;

public class MyCart {
    HashMap<String, Product> hm = new HashMap<String, Product>(); 
    //add
    public void addProduct(String pid){
        if(hm.containsKey(pid)){
            Product item= hm.get(pid);
            int quantity= item.getQuantity();
            item.setQuantity(quantity+1);            
        }else{
            hm.put(pid, new ProductService().getProduct(pid));
        }
    }
    
    public void addOne(String pid){        
        Product item= hm.get(pid);
        int quantity= item.getQuantity();
        item.setQuantity(quantity+1);            
    }   
    public void delOne(String pid){        
        Product item= hm.get(pid);
        int quantity= item.getQuantity();
        if(quantity ==1){
            hm.remove(pid);
        }
        item.setQuantity(quantity-1);            
    }
    
    //delete
    public void deleteProduct(String pid){
        hm.remove(pid);
    }
    
    //update
    public void  updateProduct(String pid, String nums){
        
    }
       
    //delete all
    public void deleteAll(){
        hm.clear();
    }
    
    //show products in shopping cart
    public ArrayList showMyCart(){
        ArrayList<Product> al=new ArrayList<Product>();
        Iterator iterator=hm.keySet().iterator();
        while(iterator.hasNext()){
            String pid=(String)iterator.next();
            Product item = hm.get(pid);
            al.add(item);
        }       
        return al;
    }
    
    //total price
    public int getTotalPrice(){
        int totalprice=0;        
        ArrayList<Product> al=new ArrayList<Product>();
        Iterator iterator = hm.keySet().iterator();
        while(iterator.hasNext()){
            String pid=(String) iterator.next();
            Product item = hm.get(pid);
            totalprice += item.getPrice()*item.getQuantity();
        }       
        return totalprice;
    }
    
    
    public int getTotalNum(){
        int totalnum=0;        
        ArrayList<Product> al=new ArrayList<Product>();
        Iterator iterator = hm.keySet().iterator();
        while(iterator.hasNext()){
            String pid=(String) iterator.next();
            Product item = hm.get(pid);
            totalnum += item.getQuantity();
        }       
        return totalnum;
    }
    
}
