package models;

public class OrderDetail {
    private String code;
    private int quantity;
    private Order order;
    private Product product;
    
    public OrderDetail(String code, int quantity, Order order, Product product){
        this.code = code;
        this.quantity = quantity;
        this.order = order;
        this.product = product;
    }
    
    public String getCode(){
        return code;
    }
    
    public void setCode(String code){
        this.code = code;
    }
    
    public int getQuantity(){
        return quantity;
    }
    
    public void setQuantity(int quantity){
        this.quantity = quantity;
    }
    
    public Order getOrder(){
        return order;
    }
    
    public void setOrder(Order order){
        this.order = order;
    }
    
    public Product getProduct(){
        return product;
    }
    
    public void setProduct(Product product){
        this.product = product;
    }
}
