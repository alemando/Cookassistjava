package models;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Bill {
    public int code;
    public Date date;
    public User user;
    private  List<Order> ListOrders = new ArrayList<Order>(){};
    
    public Bill(int code, Date date, User user, List<Order> ListOrders){
        this.code = code;
        this.date = date;
        this.user = user;
        this.ListOrders = ListOrders;
    }
    
    public int getCode(){
        return code;
    }
    
    public void setCode(int code){
        this.code = code; 
    }
    
    public Date getDate(){
        return date;
    }
    
    public void setDate(Date date){
        this.date = date;
    }
    
    public User getUser(){
        return user;
    }
    
    public void setUser(User user){
        this.user = user;
    }

    public List<Order> getListOrders() {
        return ListOrders;
    }

    public void setListOrders(List<Order> ListOrders) {
        this.ListOrders = ListOrders;
    }
    
    public void setOrder(Order order) {
        this.ListOrders.add(order);
    }
    
}
