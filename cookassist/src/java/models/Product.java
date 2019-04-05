package models;

import java.util.HashMap;
import util.Messages;

public class Product {
    public static HashMap<String,String> categories = new HashMap<String,String>(){{
        put("1","Bebidas");
        put("2","Entradas");
        put("3","Plato fuerte");
    }
    };
    
    public static int cons = 0;
    private int code;
    private String name;
    private String description;
    private int price;
    private String category;
    private boolean available;
    private String image_url;
    private HashMap<String,OrderDetail> ListOrderDetails = new HashMap<String,OrderDetail>();
    
    public Product(int code, String name, String description, int price, 
            String category, String image_url, boolean available){
        if(code == 0){
            Product.cons ++;
            this.code = Product.cons;
        }else{
            if(Product.cons<code){
                Product.cons = code;
            }
            this.code = code;
        }
        System.out.println(Product.cons);
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

    public HashMap<String,OrderDetail> getListOrderDetails() {
        return ListOrderDetails;
    }

    public void setListOrderDetails(HashMap<String, OrderDetail> ListOrderDetails) {
        this.ListOrderDetails = ListOrderDetails;
    }
    
    public void setOrderDetail(OrderDetail order_detail) {
        this.ListOrderDetails.put(order_detail.getCode(), order_detail);
    }
    
    public static String category_interpreter(String category){
        return Product.categories.get(category);
    }
    
    public static String available_interpreter(Boolean available){
        String str;
        if (available){
            str = Messages.list_texts.get("available");
        }else{
            str = Messages.list_texts.get("not_available");
        }
        return str;
    }
    
    public static Product getProductbycode(HashMap<Integer,Product> products, int code){
        return products.get(code);
    }
    
    public void editProduct(String name, String description,
            int price, String category, boolean available){
        //Validar
        this.setName(name);
        this.setDescription(description);
        this.setPrice(price);
        this.setCategory(category);
        this.setAvailable(available);
        
    }
    
 
}