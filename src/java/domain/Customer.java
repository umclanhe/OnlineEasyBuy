package domain;
//javabean   ---  database customer table
public class Customer {
    private int cid;
    private String name;
    private String email;
    private String psw;
    
    public Customer(String email, String psw){
        super();
        this.email=email;
        this.psw=psw;
    }
    
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }
    

    
}
