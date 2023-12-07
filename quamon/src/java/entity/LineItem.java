/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;
/**
 *
 * @author ACER
 */
public class LineItem implements Serializable {
   
    private Product product;
    private int quantity;
    // private int total = product.getPrice() * quantity;
    
    public LineItem(){}

    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getTotal() {
        int total = product.getPrice() * quantity;
        return total;
    }
    
    public String getTotalCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currency.format(this.getTotal());
    }
    
    public String getSumTotalFormat(int total) {
        NumberFormat total_format = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return total_format.format(total);
    }

    @Override
    public String toString() {
        return "LineItem{" + ", product=" + product + ", quantity=" + quantity + '}';
    }
}
