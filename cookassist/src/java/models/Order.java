package models;

import java.util.HashMap;
import java.util.Map;
import util.Messages;

public class Order {
    public static int cons = 0;
    private int code;
    private String description;
    private User user;
    private Chef chef;
    private Bill bill;
    private boolean ready;
    private HashMap<String,OrderDetail> ListOrderDetails = new HashMap<String,OrderDetail>();
    
    public Order(int code, String description, User user, HashMap<Integer,Object []> ListProducts, boolean ready){
        if(code == 0){
            Order.cons ++;
            this.code = Order.cons;
        }else{
            this.code = code;
        }
        this.description = description;
        this.user = user;
        this.ready = ready;
        user.setOrder(this);
        for (Map.Entry<Integer, Object[]> entry : ListProducts.entrySet()) {
            String id = this.getCode()+"-"+entry.getKey();
            int quantity = (int) entry.getValue()[1];
            Product p = (Product) entry.getValue()[0];
            OrderDetail od = new OrderDetail(id, quantity, p.getPrice(), this, p);
            this.setOrderDetail(od);
        }
    }
    
    public int getCode(){
        return code;
    }
    
    public void setCode(int code){
        this.code = code;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }

    public HashMap<String,OrderDetail> getListOrderDetails() {
        return ListOrderDetails;
    }

    public void setListOrderDetails(HashMap<String, OrderDetail> ListOrderDetails) {
        this.ListOrderDetails = ListOrderDetails;
    }
    
    public void setOrderDetail(OrderDetail order_detail) {
        this.ListOrderDetails.put(order_detail.getCode(), order_detail);
    }
    
    
    public User getUser(){
        return user;
    }
    
    public void setUser(User user){
        this.user = user;
    }
    
    public Chef  getChef(){
        return chef;
    }
    
    public void setChef(Chef chef){
        this.chef = chef;
        chef.setOrderChef(this);
    }
    
    public Bill getBill(){
        return bill;
    }
    
    public void setBill(Bill bill){
        this.bill = bill;
    }
    
    public boolean getReady() {
        return ready;
    }

    public void setReady(boolean ready) {
        this.ready = ready;
    }
    
    public int total_price(){
        HashMap<String, OrderDetail> order_details = this.getListOrderDetails();
        int total_price = 0;
        for (Map.Entry<String, OrderDetail> entry : order_details.entrySet()) {
            total_price += entry.getValue().getPrice()*entry.getValue().getQuantity();
        }
        return total_price;
    }
    
    public static Order getOrderbycode(HashMap<Integer,Order> orders, int code){
        return orders.get(code);
    }
    
    
    
    public static String ready_interpreter(Boolean ready){
        String str;
        if (ready){
            str = Messages.list_texts.get("finish");
        }else{
            str = Messages.list_texts.get("not_finish");
        }
        return str;
    }
    
}
