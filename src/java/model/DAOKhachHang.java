/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.KhachHang;
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
public class DAOKhachHang {

    DBConnection dbCon;
    Connection conn;

    public DAOKhachHang(DBConnection dbcon) {
        this.dbCon = dbcon;
        conn = dbcon.getConection();
    }

    public boolean login(String userName, String pass) {
        String sql = "Select * from KhachHang where username=? and"
                + " password=? where status=1";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, userName);
            pre.setString(2, pass);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public int addKhachHang(KhachHang obj) {
        int n = 0;
        String sql = "Insert into KhachHang(cname,address,phone,username,password)"
                + " values(?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getCname());
            pre.setString(2, obj.getAddress());
            pre.setString(3, obj.getPhone());
            pre.setString(4, obj.getUsername());
            pre.setString(5, obj.getPassword());
            n = pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateInforKhachHang(KhachHang obj) {
        int n = 0;
        String sql = "update KhachHang set cname=?,address=?,phone=?,status=? where cid=?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getCname());
            pre.setString(2, obj.getAddress());
            pre.setString(3, obj.getPhone());
            pre.setInt(4, obj.getStatus());
            pre.setInt(5, obj.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }
    public int updateInfor(KhachHang obj) {
        int n = 0;
        String sql = "update KhachHang set cname=?,address=?,phone=?,password=? where cid=?";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getCname());
            pre.setString(2, obj.getAddress());
            pre.setString(3, obj.getPhone());
            pre.setString(4, obj.getPassword());
            pre.setInt(5, obj.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int changePassword(String userName, String oldPass, String newPass) {
        int n = 0;
        String sql = "select * from KhachHang where username='" + userName + "' "
                + " and password='" + oldPass + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if (rs.next()) {
                String sqlUpdate = "update KhachHang set password=? where username=?";
                PreparedStatement pre = conn.prepareStatement(sqlUpdate);
                pre.setString(1, newPass);
                pre.setString(2, userName);
                n = pre.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;

    }

    public int changeStatus(String userName, int status) {
        int n = 0;
        String sql = "update KhachHang set status=" + (status == 1 ? 0 : 1) + " where username='" + userName + "'";
        try {
            n = conn.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int removeKhachHang(int id) {
        int n = 0;
        try {
                String sqlDelete = "delete KhachHang where cid=" + id;
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public boolean checkDuplicate(String username) {
        String sql = "SELECT * FROM KhachHang WHERE cname = '" + username + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if (rs.next()) return true;
        } catch (Exception e) {
        }
        return false;
    }

}
