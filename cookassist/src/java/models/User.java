package models;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class User {
    private String type_user;
    private String name;
    private String email;
    private Date born_date;
    private boolean status;
    private  List<Rating> ListRatings = new ArrayList<Rating>(){};
    private  List<Order> ListOrders = new ArrayList<Order>(){};
    private  List<Bill> ListBills = new ArrayList<Bill>(){};
    
    public User(String type_user, String name, String email, Date born_date, boolean status){
        this.type_user = type_user;
        this.name = name;
        this.email = email;
        this.born_date = born_date;
        this.status = status;
    }


    public String getTypeUser(){
        return type_user;
    }
    
    public void setTypeUser(String typeuser) {
        this.type_user = typeuser;
        
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

    public List<Order> getListOrders() {
        return ListOrders;
    }

    public void setListOrders(List<Order> ListOrders) {
        this.ListOrders = ListOrders;
    }
    
    public void setOrder(Order order) {
        this.ListOrders.add(order);
    }

    public List<Bill> getListBills() {
        return ListBills;
    }

    public void setListBills(List<Bill> ListBills) {
        this.ListBills = ListBills;
    }
    
    public void setBill(Bill bill) {
        this.ListBills.add(bill);
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public Date getBornDate(){
        return born_date;
    }
    
    public void setBornDate(Date born){
        this.born_date = born;
    }
    
    public boolean getStatus(){
        return status;
    } 
    
    public void setStatus(boolean status){
        this.status = status;
    }
    
}   