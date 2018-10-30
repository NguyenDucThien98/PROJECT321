/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.KhachHang;
import entity.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NguyenDucThien
 */
public class DAOInvoice {
    
    DBConnection dbCon;
    Connection conn;

    public DAOInvoice(DBConnection dbcon) {
        this.dbCon = dbcon;
        conn = dbcon.getConection();
    }
    
    public int addInvoice(Invoice obj) {
        int n = 0;
        String sql = "INSERT INTO HoaDon( date, cid, Rcname, Raddress,Rphone, total, status) VALUES( ?,?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setTimestamp(1, obj.getDate());
            pre.setInt(2, obj.getCid());
            pre.setString(3, obj.getRcname());
            pre.setString(4, obj.getRaddress());
            pre.setString(5, obj.getRphone());
            pre.setDouble(6, obj.getTotal());
            pre.setInt(7, obj.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateInvoice(Invoice obj) {
        int n = 0;
        String sql = "UPDATE HoaDon SET date = ?, cid = ?, Rcname = ?, Raddress = ?, total = ?, status = ? WHERE hdid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setTimestamp(1, obj.getDate());
            pre.setInt(2, obj.getCid());
            pre.setString(3, obj.getRcname());
            pre.setString(4, obj.getRaddress());
            pre.setDouble(5, obj.getTotal());
            pre.setInt(6, obj.getStatus());
            pre.setInt(7, obj.getHdid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

        
    public int updateInvoice2(int stt , int hid) {
        int n = 0;
        String sql = "UPDATE HoaDon SET  status = ? WHERE hdid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1,stt);
            pre.setInt(2,hid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

        public int changeStatus(String hid, int status) {
        int n = 0;
        String sql = "update HoaDon set status=" + (status == 1 ? 0 : 1) + " where hid='" + hid + "'";
        try {
            n = conn.createStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }
    
}
