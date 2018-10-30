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
public class KhachHang {

    private int cid;
    private String cname, address, phone, username, password;
    private int status;

    public KhachHang() {
    }

    public KhachHang(int cid, String cname, String address, String phone, String username, String password, int status) {
        this.cid = cid;
        this.cname = cname;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public KhachHang(String cname, String address, String phone, String username, String password, int status) {
        this.cname = cname;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public KhachHang(String cname, String address, String phone, String username, String password) {
        this.cname = cname;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
    }

    public KhachHang(int cid, String cname, String address, String phone, String password) {
        this.cid = cid;
        this.cname = cname;
        this.address = address;
        this.phone = phone;
        this.password = password;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
