package service;

import domain.Address;
import domain.Customer;
import domain.Product;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import utils.SqlHelper;


public class PlaceOrder {
    
    public void addAddress(Address address, Customer customer){
        String sql = "insert into address (cid, aname, street, city, state, zip, phone) values(?, ?, ?, ?, ?, ?, ?) ";
        String paras[] = {customer.getCid()+"", address.getAname(), address.getStreet(),
            address.getCity(), address.getState(), address.getState(), address.getZip()+"",address.getPhone() }; 
        SqlHelper dosql= new SqlHelper();
        dosql.insertQuery(sql, paras);          
    }
    
    public String getAid(Customer customer){
        String sql = "select max(aid) from address where cid = ? ";
        String paras[] = {customer.getCid()+""};
        String aid = new SqlHelper().getIdQuery(sql,paras);
        return aid;
    }
    
    public void addOrder(Customer customer,MyCart myCart, String sid, String bid){
        //time
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp nowdate = new Timestamp(System.currentTimeMillis());
        String otime = sdf.format(nowdate);
        //generate unique and random order number
        int r1=(int)(Math.random()*(10));
        int r2=(int)(Math.random()*(10));
        long now = System.currentTimeMillis();
        String oid =String.valueOf(r1)+String.valueOf(r2)+String.valueOf(now);
        //order table
        String sql = "insert into corder(oid, cid, otime, sadr, badr) values(?,?,?,?,?)";
        String paras[] = {oid, customer.getCid()+"", otime, sid, bid};
        SqlHelper dosql= new SqlHelper();
        dosql.insertQuery(sql, paras);
        
        //
        ArrayList al=myCart.showMyCart();
        for(int i=0;i<al.size();i++){
            Product item = (Product)al.get(i);
            
            //transaction table
            String sql2 = "insert into ctransaction(pid, quantity, oid) values(?,?,?)";
            String paras2[] = {item.getPid()+"", item.getQuantity()+"", oid};
            SqlHelper dosql2= new SqlHelper();
            dosql2.insertQuery(sql2, paras2);
            
            //product table  --update inventory
            String sql3 = "select inventory from product where pid=?";
            String paras3[] ={item.getPid()+""};
            SqlHelper dosql3= new SqlHelper();
            int quantity = Integer.parseInt(dosql3.getIdQuery(sql3, paras3));//get quantity
            quantity = quantity - item.getQuantity();        //update quantity    
            String sql4 = "update product set inventory = ? where pid=?";
            String paras4[] ={quantity+"", item.getPid()+"" };
            SqlHelper dosql5= new SqlHelper();
            dosql5.insertQuery(sql4, paras4);//update
        }
        
    }
    
}
