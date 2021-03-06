package models;
import java.util.HashMap;
import util.Messages;

public class User {
    private boolean admin;
    private String name;
    private String email;
    private String password;
    private boolean status;
    private HashMap<Integer,Order> ListOrders = new HashMap<Integer,Order>();
    private HashMap<Integer,Bill> ListBills = new HashMap<Integer,Bill>();
    
    public User(boolean admin, String name, String email, String password, boolean status){
        this.admin = admin;
        this.name = name;
        this.email = email;
        this.password = password;
        this.status = status;
    }


    public boolean getAdmin(){
        return admin;
    }
    
    public void setAdmin(boolean admin) {
        this.admin = admin;
        
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
        User u = User.getUserbyEmail(ListUsers, email);
        if (u != null){
            if(u.getEmail().equals(email) && u.getPassword().equals(password) && u.getStatus()){
                return u;
            }
        }
        return null;
    }
    
    public static String admin_interpreter(boolean admin){
        String str;
        if (admin){
            str = Messages.list_texts.get("admin");
        }else{
            str = Messages.list_texts.get("user");
        }
        return str;
    }
    
    public static String status_interpreter(boolean available){
        String str;
        if (available){
            str = Messages.list_texts.get("actived");
        }else{
            str = Messages.list_texts.get("inactived");
        }
        return str;
    }
    
}   