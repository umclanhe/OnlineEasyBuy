package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;


public class SqlHelper {
    private Connection ct = null;
    
    private ResultSet rs = null;
    private PreparedStatement ps = null;
       
    public ArrayList executeQuery(String sql, String[] paras){
       
        ArrayList al=new ArrayList();
        try{
            ct=DBUtil.getConnection();
            ps=ct.prepareStatement(sql);
                //sql set value of ? 
            for(int i=0; i< paras.length; i++){
                ps.setString(i+1,paras[i]);
            }
            rs=ps.executeQuery();           
            
            ResultSetMetaData rsmd = rs.getMetaData();           
            int columnNum = rsmd.getColumnCount();  //get the column number
            while(rs.next()){
                Object[] objects=new Object[columnNum];
                for(int i=0; i<objects.length; i++){
                    objects[i]=rs.getObject(i+1);
                }
                al.add(objects);
            }
        } catch(Exception e){
            e.printStackTrace();
            System.out.println("sql exception");
        }
        return al;
    }
}
