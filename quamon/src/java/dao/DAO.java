/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;

import entity.*;
import context.DBContext;

/**
 *
 * @author ACER
 */
public class DAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new Product(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getString(5)));
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    public List<Product> getProductByCategory(String cateId) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE cateID = ?";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cateId);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new Product(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getString(5)));
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM category";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new Category(rs.getLong(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    public long getAllUser() {
        List<User> user_list = new ArrayList<>();
        String query = "SELECT * FROM user";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                user_list.add(new User(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7)));
            }
        } catch (Exception e) {
        }
        long size = user_list.size();
        
        return size;
    }
    
    public Product getProductByCode(String code) {
        
        String query = "SELECT * FROM product "
                + "WHERE ProductCode = ?";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, code);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new Product(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Product getProductById(long id) {
        
        String query = "SELECT * FROM product "
                + "WHERE ProductID = ?";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new Product(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Product> getProductbyName(String search) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product "
                + "WHERE ProductDescription LIKE ?";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new Product(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4),
                rs.getString(5)));
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    // add item
    public void addItem (LineItem item) {
        List<LineItem> items = new ArrayList<>();
        String code = item.getProduct().getCode();
        int quantity = item.getQuantity();
        
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(code)) {
                lineItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }
    
    // remove item
    public void removeItem (LineItem item) {
        List<LineItem> items = new ArrayList<>();
        String code = item.getProduct().getCode();
        
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(code)) {
                items.remove(i);
                return;
            }
        }
    }
    
    public User login(String email, String password) {
        String query = "SELECT * FROM user\n" +
                "WHERE Email = ?\n" +
                "AND Password = ?";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new User(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7));
            }
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public User checkEmailExist(String email) {
        String query = "SELECT * FROM user " +
                "WHERE Email = ?";
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while(rs.next()) {
                return new User(rs.getLong(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getString(6),
                rs.getString(7));
            }
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public void SignUp(long id, String email, String firstName, String lastName, String password, String phone, String address) {
        String query = "INSERT INTO user "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        long num_id = getAllUser();
        id = num_id;
        
        try {
            conn = new DBContext().getSQLConnection();
            ps = conn.prepareStatement(query);
            ps.setLong(1, id + 1);
            ps.setString(2, email);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5, password);
            ps.setString(6, phone);
            ps.setString(7, address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        for (Product o : list) {
            System.out.println(o);
        }
    }
}

