/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.*;


/**
 *
 * @author ACER
 */
public class Product implements Serializable {
    
    private long productId;
    private String code;
    private String description;
    private int price;
    private String type;
    
    public Product() {
    }

    public Product(long productId, String code, String description, int price, String type) {
        this.productId = productId;
        this.code = code;
        this.description = description;
        this.price = price;
        this.type = type;
    }
    

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    public String getPriceFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currency.format(price);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", code=" + code + ", description=" + description + ", price=" + price + ", type=" + type + '}';
    }
    
    
}
