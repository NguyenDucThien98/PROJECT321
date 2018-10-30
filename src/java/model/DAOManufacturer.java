/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.KhachHang;
import entity.Manufacturer;
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
public class DAOManufacturer {
    
    DBConnection dbCon;
    Connection conn;

    public DAOManufacturer(DBConnection dbcon) {
        this.dbCon = dbcon;
        conn = dbcon.getConection();
    }
    
    public int addManufacturer(Manufacturer obj) {
        int n = 0;
        String sql = "INSERT INTO HangSanXuat(hname, website, status) VALUES(?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getHname());
            pre.setString(2, obj.getWebsite());
            pre.setInt(3, obj.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateManufacturer(Manufacturer obj) {
        int n = 0;
        String sql = "UPDATE HangSanXuat SET hname = ?, website = ?,status = ? WHERE hid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getHname());
            pre.setString(2, obj.getWebsite());
            pre.setInt(3, obj.getStatus());
            pre.setInt(4, obj.getHid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changeStatus(int hname, int status) {
        int n = 0;
        String sql = "UPDATE HangSanXuat SET status = '" + (status==0?1:0) + "' WHERE hid = '" + hname + "'";
        try {
            n = conn.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
//    public int removeManufacturer(int hid) {
//        int n = 0;
//        String sql = "SELECT * FROM HangSanXuat AS a JOIN SanPham AS b ON a.hid = b.hid";
//        ResultSet rs = dbCon.getData(sql);
//        try {
//            if (rs.next()) {
//                changeStatus(rs.getString("username"), rs.getInt("status"));
//            } else {
//                String sqlDelete = "DELETE FROM HangSanXuat WHERE hid = '" + hid + "'";
//                Statement state = conn.createStatement();
//                n = state.executeUpdate(sqlDelete);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return n;
//    }
}
