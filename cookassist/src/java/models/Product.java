package models;

import java.util.ArrayList;
import java.util.List;

public class Product {
    public static int cons = 0;
    private int code;
    private String name;
    private String description;
    private int price;
    private String category;
    private boolean available;
    private String image_url;
    private  List<Rating> ListRatings = new ArrayList<Rating>(){};
    private  List<OrderDetail> ListOrderDetails = new ArrayList<OrderDetail>(){};
    
    public Product(int code, String name, String description, int price, 
            String category, String image_url, boolean available){
        if(code == 0){
            Product.cons ++;
            this.code = Product.cons;
        }else{
            this.code = code;
        }
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.image_url = image_url;
        this.available = available;
    }

    public String getImageUrl() {
        return image_url;
    }

    public void setImageUrl(String image_url) {
        this.image_url = image_url;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    public Product(){
    }

    public int getCode(){
        return code;
    }
    
    public void setCode(int code){
        this.code = code;
    }
    
    public String getName(){
        return name;
    }
    
    public void setName(String name){
        this.name = name; 
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
    public String getCategory(){
        return category;
    }
    
    public void setCategory(String category){
        this.category = category;
    }
    
    public boolean getAvailable(){
        return available;
    }
    
    public void setAvailable(boolean available){
        this.available = available; 
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

    public List<OrderDetail> getListOrderDetails() {
        return ListOrderDetails;
    }

    public void setListOrderDetails(List<OrderDetail> ListOrderDetails) {
        this.ListOrderDetails = ListOrderDetails;
    }
    
    public void setOrderDetail(OrderDetail order_detail) {
        this.ListOrderDetails.add(order_detail);
    }
    
    public static String category_interpreter(String category){
        String str;
        //Remplazar por hashmap
        if (category.equals("1")){
            str = "Bebidas";
        }else{
            str = "Entradas";
        }
        return str;
    }
    
    public static String available_interpreter(Boolean available){
        String str;
        if (available){
            str = "Disponible";
        }else{
            str = "No disponible";
        }
        return str;
    }
 
}