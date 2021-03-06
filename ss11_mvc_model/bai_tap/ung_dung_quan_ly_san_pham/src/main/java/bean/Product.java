package bean;

public class Product {
    private Integer id;
    private String name;
    private Double price;
    private Integer quantity;
    private String country;

    public Product(Integer id, String name, Double price, Integer quantity, String country) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.country = country;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
