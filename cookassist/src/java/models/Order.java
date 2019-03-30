package models;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private int code;
    private String description;
    private User user;
    private Chef chef;
    private Bill bill;
    private  List<OrderDetail> ListOrderDetails = new ArrayList<OrderDetail>(){};
    private  List<Rating> ListRatings = new ArrayList<Rating>(){};
    
    
    public Order(int code, String description, List<OrderDetail> ListOrderDetails, User user){
        this.code = code;
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

    public List<OrderDetail> getListOrderDetails() {
        return ListOrderDetails;
    }

    public void setListOrderDetails(List<OrderDetail> ListOrderDetails) {
        this.ListOrderDetails = ListOrderDetails;
    }
    
    public void setOrderDetail(OrderDetail order_detail) {
        this.ListOrderDetails.add(order_detail);
    }

    public List<Rating> getListRatings() {
        return ListRatings;
    }

    public void setListRatings(List<Rating> ListRatings) {
        this.ListRatings = ListRatings;
    }
    
    public void setRating(Rating rating) {
        this.ListRatings.add(rating);
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
