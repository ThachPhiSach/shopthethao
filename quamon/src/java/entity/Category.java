/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ACER
 */
public class Category {
    private long cateId;
    private String cateName;

    public Category() {
    }

    public Category(long cateId, String cateName) {
        this.cateId = cateId;
        this.cateName = cateName;
    }

    public long getCateId() {
        return cateId;
    }

    public void setCateId(long cateId) {
        this.cateId = cateId;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    @Override
    public String toString() {
        return "Category{" + "cateId=" + cateId + ", cateName=" + cateName + '}';
    }
    
    
}
