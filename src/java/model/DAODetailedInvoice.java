/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.DetailedInvoice;
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
public class DAODetailedInvoice {
    
    DBConnection dbCon;
    Connection conn;

    public DAODetailedInvoice(DBConnection dbcon) {
        this.dbCon = dbcon;
        conn = dbcon.getConection();
    }
    
    public int addDetailedInvoice(DetailedInvoice obj) {
        int n = 0;
        String sql = "INSERT INTO HoaDonChiTiet(hdid, sid, quantity, price) VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, obj.getHdid());
            pre.setString(2, obj.getSid());
            pre.setInt(3, obj.getQuantity());
            pre.setDouble(4, obj.getPrice());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateDetailedInvoice(DetailedInvoice obj) {
        int n = 0;
        String sql = "UPDATE HoaDonChiTiet SET sid = ?, quantity = ?, price = ? WHERE hdid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getSid());
            pre.setInt(2, obj.getQuantity());
            pre.setDouble(3, obj.getPrice());
            pre.setInt(4, obj.getHdid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOKhachHang.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}
