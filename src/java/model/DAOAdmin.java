/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Admin;
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
public class DAOAdmin {
    
    DBConnection dbCon;
    Connection conn;

    public DAOAdmin(DBConnection dbcon) {
        this.dbCon = dbcon;
        conn = dbcon.getConection();
    }
    
    public boolean login(String userName, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ? WHERE status = 1";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, userName);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public int addAdmin(Admin obj) {
        int n = 0;
        String sql = "INSERT INTO admin(username, password) VALUES(?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getUsername());
            pre.setString(2, obj.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changePassword(String username, String oldPass, String newPass) {
        int n = 0;
        String sql = "SELECT * FROM admin WHERE username = '" + username + "' AND password = '" + oldPass + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if (rs.next()) {
                String sqlUpdate = "UPDATE KhachHang SET password = '" + newPass + "' WHERE username = '" + username + "'";
                n = conn.createStatement().executeUpdate(sqlUpdate);
            } 
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changeStatus(String username, int status) {
        int n = 0;
        String sql = "UPDATE admin SET status = '" + (status==0?1:0) + "' WHERE username = '" + username + "'";
        try {
            n = conn.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeAdmin(String username) {
        int n = 0;
        try {
            String sqlDelete = "DELETE FROM admin WHERE username = '" + username + "'";
            Statement state = conn.createStatement();
            n = state.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public boolean checkDuplicate(String username) {
        String sql = "SELECT * FROM admin WHERE username = '" + username + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if (rs.next()) return true;
        } catch (Exception e) {
        }
        return false;
    }
}
