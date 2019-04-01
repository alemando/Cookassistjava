package models;
import java.util.HashMap;

public class User {
    private String type_user;
    private String name;
    private String email;
    private String password;
    private boolean status;
    private HashMap<Integer,Rating> ListRatings = new HashMap<Integer,Rating>();
    private HashMap<Integer,Order> ListOrders = new HashMap<Integer,Order>();
    private HashMap<Integer,Bill> ListBills = new HashMap<Integer,Bill>();
    
    public User(String type_user, String name, String email, String password, boolean status){
        this.type_user = type_user;
        this.name = name;
        this.email = email;
        this.password = password;
        this.status = status;
    }


    public String getTypeUser(){
        return type_user;
    }
    
    public void setTypeUser(String type_user) {
        this.type_user = type_user;
        
    }

    public HashMap<Integer,Rating> getListRatings() {
        return ListRatings;
    }

    public void setListRatings(HashMap<Integer,Rating> ListRatings) {
        this.ListRatings = ListRatings;
    }
    
    public void setRating(Rating rating) {
        this.ListRatings.put(rating.getCode(), rating);
    }

    public HashMap<Integer,Order> getListOrders() {
        return ListOrders;
    }

    public void setListOrders(HashMap<Integer,Order> ListOrders) {
        this.ListOrders = ListOrders;
    }
    
    public void setOrder(Order order) {
        this.ListOrders.put(order.getCode(), order);
    }

    public HashMap<Integer,Bill> getListBills() {
        return ListBills;
    }

    public void setListBills(HashMap<Integer,Bill> ListBills) {
        this.ListBills = ListBills;
    }
    
    public void setBill(Bill bill) {
        this.ListBills.put(bill.getCode(), bill);
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
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public boolean getStatus(){
        return status;
    } 
    
    public void setStatus(boolean status){
        this.status = status;
    }
    
    public static User getUserbyEmail(HashMap<String, User> ListUsers, String email){
        return ListUsers.get(email);
    }
    
    public static User login(HashMap<String, User> ListUsers, String email, String password){
        System.out.println(email);
        User u = User.getUserbyEmail(ListUsers, email);
        if (u != null){
            if(u.getEmail().equals(email) && u.getPassword().equals(password) && u.getStatus()){
                return u;
            }
        }
        return null;
    }
    
    public static String type_user_interpreter(String type_user){
        String str;
        if (type_user.equals("0")){
            str = "Usuario";
        }else{
            str = "Administrador";
        }
        return str;
    }
    
    public static String status_interpreter(Boolean available){
        String str;
        if (available){
            str = "Activo";
        }else{
            str = "Inactivo";
        }
        return str;
    }
    
}   