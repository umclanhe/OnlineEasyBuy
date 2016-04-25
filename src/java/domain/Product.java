package domain;

/**
 *
 * @author zjy 
 */
public class Product {
    private int pid;
    private String pname;
    private double price;
    private int inventory;
    private int quantity=1;
    private String picture;
    private String feature;
    private String pcategory;
    
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
        public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
    
    public String getFeature() {
        return feature;
    }
    
    public void setFeature(String feature) {
        this.feature = feature;
    } 
    
    public String getCategory() {
        return pcategory;
    }
    
    public void setCategory(String pcategory) {
        this.pcategory = pcategory;
    }
}
