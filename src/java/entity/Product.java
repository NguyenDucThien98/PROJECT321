/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author NguyenDucThien
 */
public class Product {
    
    private String sid;
    private String sname;
    private int quantity;
    private double price;
    private String picture, description;
    private int status;
    private int hid;

    public Product() {
    }
    
    public Product(String sid, String sname, int quantity, double price, String picture, String description, int hid) {
        this.sid = sid;
        this.sname = sname;
        this.quantity = quantity;
        this.price = price;
        this.picture = picture;
        this.description = description;
        this.hid = hid;
        this.status = 1;
    }

    public Product(String sid, String sname, int quantity, double price, String picture, String description, int status, int hid) {
        this.sid = sid;
        this.sname = sname;
        this.quantity = quantity;
        this.price = price;
        this.picture = picture;
        this.description = description;
        this.status = status;
        this.hid = hid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }
    
    
    
}
