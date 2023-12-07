/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.*;
import java.util.*;
/**
 *
 * @author ACER
 */
public class DBContext {
    
    public Connection getSQLConnection() throws Exception {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, username, password);
    }
    
    
    private final String serverName = "localhost";
    private final String portNumber = "3306";
    private final String dbName = "productdb";
    private final String username = "root";
    private final String password = "20146411";
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getSQLConnection());
        } catch (Exception e) {
            
        }
    }
}

