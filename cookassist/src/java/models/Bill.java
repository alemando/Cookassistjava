package models;
import java.util.HashMap;
import java.util.Map;

public class Bill {
    public static int cons = 0;
    public int code;
    public User user;
    private HashMap<Integer,Order> ListOrders = new HashMap<Integer,Order>();
    
    public Bill(int code, User user, HashMap<Integer,Order> ListOrders){
        if(code == 0){
            Bill.cons ++;
            this.code = Bill.cons;
        }else{
            this.code = code;
        }
        this.setUser(user);
        for (Map.Entry<Integer, Order> entry : ListOrders.entrySet()) {
            this.setOrder(entry.getValue());
        }
        
        this.ListOrders = ListOrders;
    }
    
    public int getCode(){
        return code;
    }
    
    public void setCode(int code){
        this.code = code; 
    }
    
    public User getUser(){
        return user;
    }
    
    public void setUser(User user){
        this.user = user;
        user.setBill(this);
    }

    public HashMap<Integer,Order> getListOrders() {
        return ListOrders;
    }

    public void setListOrders(HashMap<Integer,Order> ListOrders) {
        this.ListOrders = ListOrders;
    }
    
    public void setOrder(Order order) {
        this.ListOrders.put(order.getCode(), order);
        order.setBill(this);
    }
    
    public int total_price(){
        HashMap<Integer, Order> orders = this.getListOrders();
        int total_price = 0;
        for (Map.Entry<Integer, Order> entry : orders.entrySet()) {
            total_price += entry.getValue().total_price();
        }
        return total_price;
    }
    
    public static Bill getBillbycode(HashMap<Integer,Bill> bills, int code){
        return bills.get(code);
    }
    
}
