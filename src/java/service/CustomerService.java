package service;

import domain.Address;
import domain.Customer;
import java.util.ArrayList;
import utils.SqlHelper;

//related with customer table
public class CustomerService {
    
    public boolean checkCustomer(Customer customer){        
        //check database;
        String sql = "select * from customer where cemail=? and cpsw=?";
        String paras[] = {customer.getEmail()+"", customer.getPsw()+""};        
        ArrayList al = new SqlHelper().executeQuery(sql,paras);
        if(al.size()==0){
            return false;
        }else{
            Object [] objects = (Object[])al.get(0);        
            //put customer information into customer
            customer.setCid(Integer.parseInt(objects[0].toString()));
            customer.setEmail((String)objects[1]);
            customer.setName((String)objects[3]);            
            return true;
        }       
    }
    
    
    public ArrayList findAddress(Customer customer){
        String sql = "select * from address where cid=?";
        String paras[] = {customer.getCid()+""};        
        ArrayList al = new SqlHelper().executeQuery(sql,paras);
        ArrayList<Address> newAl = new ArrayList<Address>();
        
        for(int i=0; i<al.size();i++){
            Object obj[] = (Object[])al.get(i);
            Address address = new Address();
            address.setAid(Integer.parseInt(obj[0].toString()));
            address.setCid(Integer.parseInt(obj[1].toString()));
            address.setAname(obj[2].toString());
            address.setStreet(obj[3].toString());
            address.setCity(obj[4].toString());
            address.setState(obj[5].toString());
            address.setZip(Integer.parseInt(obj[6].toString())); 
            address.setPhone(obj[7].toString());
            newAl.add(address);
        }     
        
        return newAl;
        }
    
    public Address findAddress(String aid){
        String sql = "select * from address where aid=?";
        String paras[] = {aid+""};        
        ArrayList al = new SqlHelper().executeQuery(sql,paras);
        Address address = new Address();
        
        for(int i=0; i<al.size();i++){
            Object obj[] = (Object[])al.get(i);
            address.setAid(Integer.parseInt(obj[0].toString()));
            address.setCid(Integer.parseInt(obj[1].toString()));
            address.setAname(obj[2].toString());
            address.setStreet(obj[3].toString());
            address.setCity(obj[4].toString());
            address.setState(obj[5].toString());
            address.setZip(Integer.parseInt(obj[6].toString())); 
            address.setPhone(obj[7].toString()); 
        }     
        
        return address;
        }

    
}
    
    
