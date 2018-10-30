/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.KhachHang;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NguyenDucThien
 */
public class DAOProduct {
    
    DBConnection dbCon;
    Connection conn;

    public DAOProduct(DBConnection dbcon) {
        this.dbCon = dbcon;
        conn = dbcon.getConection();
    }
    
    public int addProduct(Product obj) {
        int n = 0;
        String sql = "INSERT INTO SanPham(sid, sname, quantity, price, picture, description, hid) VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getSid());
            pre.setString(2, obj.getSname());
            pre.setInt(3, obj.getQuantity());
            pre.setDouble(4, obj.getPrice());
            pre.setString(5, obj.getPicture());
            pre.setString(6, obj.getDescription());
            pre.setInt(7, obj.getHid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateProduct(Product obj) {
        int n = 0;
        String sql = "UPDATE SanPham SET sname = ?, quantity = ?, price = ?, picture = ?, description = ?, hid = ? WHERE sid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getSname());
            pre.setInt(2, obj.getQuantity());
            pre.setDouble(3, obj.getPrice());
            pre.setString(4, obj.getPicture());
            pre.setString(5, obj.getDescription());
            pre.setInt(6, obj.getHid());
            pre.setString(7, obj.getSid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
        public int updateQuantity(int quantity, int sid) {
        int n = 0;
        String sql = "UPDATE SanPham SET quantity = ? WHERE sid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1,quantity);
            pre.setInt(2, sid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
         public int updateDes(String des, int sid) {
        int n = 0;
        String sql = "UPDATE SanPham SET  description = ? WHERE sid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, des);
            pre.setInt(2, sid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changeStatus(String sname, int status) {
        int n = 0;
        String sql = "UPDATE SanPham SET status = '" + (status==0?1:0) + "' WHERE sid = '" + sname + "'";
        try {
            n = conn.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeProduct(String sid) {
       int n = 0;
        try {
            String sqlDelete = "delete SanPham WHERE sid = '" + sid + "'";
            Statement state = conn.createStatement();
            n = state.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
         return n;
    }
    
    public int impProduct(String sid, int impQuantity) {
        int n = 0;
        String sql = "SELECT * FROM SanPham WHERE sid = '" + sid + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if (rs.next()) {
                String sname = rs.getString("sname");
                int quantity = rs.getInt("quantity") + impQuantity;
                Double price = rs.getDouble("price");
                String picture = rs.getString("picture");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                int hid = rs.getInt("hid");
                n = updateProduct(new Product(sid, sname, quantity, price, picture, description, status, hid));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int expProduct(String sid, int expQuantity) {
        int n = 0;
        String sql = "SELECT * FROM SanPham WHERE sid = '" + sid + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if(rs.next()) {
                int quantity = rs.getInt("quantity");
                if (quantity < expQuantity) return 0;
                quantity = quantity - expQuantity;
                String sname = rs.getString("sname");
                Double price = rs.getDouble("price");
                String picture = rs.getString("picture");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                int hid = rs.getInt("hid");
                n = updateProduct(new Product(sid, sname, quantity, price, picture, description, status, hid));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
}
