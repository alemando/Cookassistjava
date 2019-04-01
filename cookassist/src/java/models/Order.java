package models;

import java.util.HashMap;

public class Order {
    public static int cons = 0;
    private int code;
    private String description;
    private User user;
    private Chef chef;
    private Bill bill;
    private HashMap<Integer,Rating> ListRatings = new HashMap<Integer,Rating >();
    private HashMap<String,OrderDetail> ListOrderDetails = new HashMap<String,OrderDetail>();
    
    public Order(int code, String description, User user, HashMap<String,OrderDetail> ListOrderDetails){
        if(code == 0){
            Product.cons ++;
            this.code = Product.cons;
        }else{
            this.code = code;
        }
        this.description = description;
        this.user = user;
        this.ListOrderDetails = ListOrderDetails;
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

    public HashMap<Integer,Rating> getListRatings() {
        return ListRatings;
    }

    public void setListRatings(HashMap<Integer, Rating> ListRatings) {
        this.ListRatings = ListRatings;
    }
    
    public void setRating(Rating rating) {
        this.ListRatings.put(rating.getCode(), rating);
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
    }
    
    public Bill getBill(){
        return bill;
    }
    
    public void setBill(Bill bill){
        this.bill = bill;
    }
}
