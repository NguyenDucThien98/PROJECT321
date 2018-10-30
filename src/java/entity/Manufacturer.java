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
public class Manufacturer {
    
    private int hid;
    private String hname, website;
    private int status;

    public Manufacturer() {
    }
    
    public Manufacturer(String hname, String website) {
        this.hname = hname;
        this.website = website;
        this.status = 1;
    }
    
    public Manufacturer(int hid, String hname, String website) {
        this.hid = hid;
        this.hname = hname;
        this.website = website;
        this.status = 1;
    }

    public Manufacturer(int hid, String hname, String website, int status) {
        this.hid = hid;
        this.hname = hname;
        this.website = website;
        this.status = status;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
