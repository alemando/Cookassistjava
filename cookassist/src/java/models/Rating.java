package models;

public class Rating {
    private int code;
    private int score;
    private String description;
    private Order order;
    private User user;
    private Chef chef;
    private Product product;
    private String url;
    
    public Rating(int code, int score, String description, Order order, User user, String url){
        this.code = code;
        this.score = score;
        this.description = description;
        this.order = order;
        this.user = user;
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    public int getCode(){
        return code;
    }
    
    public void setCode(int code){
        this.code = code;
    }
    
    public int getScore(){
        return score;
    }
    
    public void setScore(int score){
        this.score = score;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }
    
    public Order getOrder(){
        return order;
    }
    
    public void setOrder(Order order){
        this.order = order;
    }
    
    public User getUser(){
        return user;
    }
    
    public void setUser(User user){
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    public Chef getChef(){
        return chef;
    }
    
    public void setChef(Chef chef){
        this.chef = chef;
    }
    
    
    
}
