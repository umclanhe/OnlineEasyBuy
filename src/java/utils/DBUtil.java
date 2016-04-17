package utils;


import java.sql.*;

/**
 *
 * @author zjy
 */
public class DBUtil {
    
    public static Connection getConnection(){
        Connection conn=null;
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String connectionURL = "jdbc:derby://localhost:1527/easybuy";
            conn = DriverManager.getConnection(connectionURL, "IS2730", "IS2730");    
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }catch(SQLException es){
            es.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }

    public static void closeResultSet(ResultSet rs){
        if(rs!=null){
            try{
                rs.close();
            }catch(SQLException e){}
        }
    }

    public static void closeStatement(Statement stmt){
        if(stmt!=null){
            try{
                stmt.close();
            }catch(SQLException e){}
        }
    }

    public static void closeConnection(Connection conn){
        if(conn!=null){
            try{
                conn.close();
            }catch(SQLException e){}
        }
    }
    public static void main(String args[]){
        System.out.println(getConnection());
    }    
    
    
    
}
