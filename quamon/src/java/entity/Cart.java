/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.*;

/**
 *
 * @author ACER
 */
public class Cart implements Serializable {
    
    private ArrayList<LineItem> items;
    
    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<LineItem> items) {
        this.items = items;
    }
    
    public int getCount() {
        return items.size();
    }
    
    public void addItem(LineItem item) {
        items.add(item);
    }
    
    public void updateQuantity(String code, int quantity) {
        for (LineItem item : items) {
            if (item.getProduct().getCode().equals(code)) {
                item.setQuantity(quantity);
                return;
            }
        }
    }
    
    public void removeItem(String code) {
        items.removeIf(item -> item.getProduct().getCode().equals(code));
    }
    
    public int getTotalQuantity() {
        int totalQuantity = 0;
        for (LineItem item : items) {
            totalQuantity += item.getQuantity();
        }
        return totalQuantity;
    }
    
    public int getTotalPrice() {
        int totalPrice = 0;
        for (LineItem item : items) {
            totalPrice += item.getProduct().getPrice();
        }
        return totalPrice;
    }
}
