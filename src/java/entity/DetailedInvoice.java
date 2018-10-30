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
public class DetailedInvoice {
    
    private String  sid;
    
    private int quantity,hdid;
    private double price;

    public DetailedInvoice() {
    }

    public DetailedInvoice(int hdid, String sid, int quantity, double price) {
        this.hdid = hdid;
        this.sid = sid;
        this.quantity = quantity;
        this.price = price;
    }

    public void setHdid(int hdid) {
        this.hdid = hdid;
    }

    public int getHdid() {
        return hdid;
    }



    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
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
    
    
    
}
