/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.KhachHang;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOInvoice;
import model.DAOKhachHang;
import model.DBConnection;

/**
 *
 * @author NguyenDucThien
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DBConnection dbconn = new DBConnection();
        HttpSession session = request.getSession();
        DAOKhachHang Dao = new DAOKhachHang(dbconn);
        request.setAttribute("mess", " ");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            getSessionProduct(session, request);
            getUser(session, request);
            if (service == null) {
                service = "Login";
            }
            if (service.equalsIgnoreCase("Login")) {
                request.setAttribute("Mess", " ");
                login(request, response, dbconn, session);
            }
            if (service.equalsIgnoreCase("signout")) {
                removeSessionUser(session, request);
                dispatch(request, response, "/Login.jsp");
            }
            if (service.equalsIgnoreCase("Infor")) {
                request.setAttribute("mess", " ");
                getSessionProduct(session, request);
                getUser(session, request);
                infor(request, response, dbconn, session);
            }
            if (service.equalsIgnoreCase("updateInfor")) {
                updateInfor(request, Dao);
                getSessionProduct(session, request);
                getUser(session, request);
                infor(request, response, dbconn, session);
            }
            if (service.equalsIgnoreCase("detailProduct")) {
                detailProduct(request, dbconn);
                getSessionProduct(session, request);
                getUser(session, request);
                infor(request, response, dbconn, session);
            }
             if (service.equalsIgnoreCase("huydon")) {
                 huydon(request, dbconn, service);
                getSessionProduct(session, request);
                getUser(session, request);
                infor(request, response, dbconn, session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void detailProduct(HttpServletRequest request, DBConnection dbconn) throws SQLException {
        String hid = request.getParameter("id");
        request.setAttribute("mess", " ");
        request.setAttribute("check", "true");
        String sql = "select * from HoaDonChiTiet as a join SanPham as b on a.sid = b.sid where a.hdid = '" + hid + "'";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsBill", rs);
        request.setAttribute("hid", hid);
        sql = "select * from HoaDon where hdid = '" + hid + "'";
        System.out.println(sql);
        rs = dbconn.getData(sql);
        if (rs.next()) {
            request.setAttribute("status", rs.getString(8));
        }
    }

    private void getSessionProduct(HttpSession session, HttpServletRequest request) {
        String countProduct;
        if (session.getAttribute("countProduct") == null) {
            countProduct = "0";
        } else {
            countProduct = session.getAttribute("countProduct").toString();
        }
        request.setAttribute("countProduct", countProduct);
    }

    private void login(HttpServletRequest request, HttpServletResponse response, DBConnection dbconn, HttpSession session) throws SQLException {
        String username = request.getParameter("username");
        request.setAttribute("mess", " ");
        if (username != null) { // da submit
            String password = request.getParameter("password");
            String sql = "select * from KhachHang  where username='"
                    + username + "' and password='" + password
                    + "'";
            ResultSet rs = dbconn.getData(sql);
            if (rs.next()) {
                if (rs.getInt("status") == 1) {
                    Object value = session.getAttribute(username);
                    if (value == null) {
                        session.setAttribute("Login", username); // put(key,value)
                    } //the second/third... time the product is selected
                    else {
                        session.setAttribute("Login", username);
                    }
                    request.setAttribute("username", username);
                    session.setAttribute("cid", rs.getString(1));
                    infor(request, response, dbconn, session);
                } else {
                    request.setAttribute("username", "Login");
                    request.setAttribute("mess", "Tài khoản bạn đã bị khóa!");
                    dispatch(request, response, "/Login.jsp");
                }
            } else {
                request.setAttribute("username", "Login");
                request.setAttribute("mess", "UserName or Password wrong!");
                dispatch(request, response, "/Login.jsp");
            }
        } else {
            getSessionProduct(session, request);
            getUser(session, request);
            dispatch(request, response, "/Login.jsp");
        }
    }

    private void infor(HttpServletRequest request, HttpServletResponse response, DBConnection dbconn, HttpSession session) throws SQLException {
        String CID = (String) session.getAttribute("cid");
        String sql = "Select * from KhachHang where cid ='" + CID + "'";
        System.out.println(sql);
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsInfor", rs);
        billManager(request, dbconn, CID);
        dispatch(request, response, "/inforCustomer.jsp");
    }

    private void updateInfor(HttpServletRequest request, DAOKhachHang Dao) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("Name");
        String Telephone = request.getParameter("Telephone");
        String Address = request.getParameter("Address");
        String UserName = request.getParameter("UserName");
        String Password = request.getParameter("Password");
        String Password2 = request.getParameter("Password2");
        String mess = "";
        if (UserName.length() < 6 || Password.length() < 6) {
            mess = "Tài Khoản và Mật Khẩu phải tử 6 kí tự trở lên!";
        } else {
            if (Password.equals(Password2)) {
                KhachHang kh = new KhachHang(cid, name, Address, Telephone, Password);
                int n = Dao.updateInfor(kh);
                if (n > 0) {
                    mess = "Update thành Công";
                }
            } else {
                mess = "Mật Khẩu không khớp";
            }
        }
        request.setAttribute("mess", mess);

    }

    private void billManager(HttpServletRequest request, DBConnection dbconn, String CID) {
        String sql = "select * from HoaDon where cid ='" + CID + "'";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsBillManager", rs);

    }
     private void huydon(HttpServletRequest request, DBConnection dbconn, String HID) {
       DAOInvoice dao = new DAOInvoice(dbconn);
       HID = request.getParameter("id");
       dao.updateInvoice2(5, Integer.parseInt(HID));
    }

    private void getUser(HttpSession session, HttpServletRequest request) {
        String userName;
        if (session.getAttribute("Login") == null) {
            userName = "Login";
        } else {
            userName = session.getAttribute("Login").toString();
        }
        request.setAttribute("username", userName);
    }

    private void removeSessionUser(HttpSession session, HttpServletRequest request) {
        java.util.Enumeration em = session.getAttributeNames();
        session.removeAttribute("Login");
        em = session.getAttributeNames();
        while (em.hasMoreElements()) {
            String id = em.nextElement().toString();
            if (id.matches("[0-9]+$")) {
                session.removeAttribute(id);
            }
        }
        session.setAttribute("countProduct", 0);
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response,
            String page) {
        try {
            RequestDispatcher dispath = request.getRequestDispatcher(page);
            dispath.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
