/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
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
import model.DAOProduct;
import model.DBConnection;

/**
 *
 * @author NguyenDucThien
 */
public class AdminController extends HttpServlet {

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
        DAOKhachHang daoKH = new DAOKhachHang(dbconn);
        DAOProduct daoProduct = new DAOProduct(dbconn);
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            request.setAttribute("mess", "");
            if (service == null) {
                service = "customerManager";
            }
            if (service.equalsIgnoreCase("customerManager")) {
                if (getUser(session, request, response)) {
                    customerManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equalsIgnoreCase("signout")) {
                removeSessionUser(session, request);
                getUser(session, request, response);
            }
            if (service.equals("preDeleteCustomer")) {
                if (getUser(session, request, response)) {
                    preDeleteCustomer(request, daoKH, dbconn, out);
                    customerManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equals("StatusCustomer")) {
                if (getUser(session, request, response)) {
                    changeSttCustomer(request, daoKH);
                    customerManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equalsIgnoreCase("productManager")) {
                if (getUser(session, request, response)) {
                    productManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equals("StatusProduct")) {
                if (getUser(session, request, response)) {
                    changeSttProduct(request, daoProduct);
                    productManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equals("preDeleteProduct")) {
                if (getUser(session, request, response)) {
                    preDeleteProduct(request, daoProduct, dbconn, out);
                    productManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equalsIgnoreCase("billManager")) {
                if (getUser(session, request, response)) {
                    billManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equals("updateProductForm")) {
                if (getUser(session, request, response)) {
                    updateProductForm(request, dbconn);
                    dispatch(request, response, "/UpdateProduct.jsp");
                }
            }
            if (service.equals("updateProduct")) {
                if (getUser(session, request, response)) {
                    updateProduct(request, daoProduct);
                    productManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equals("detailProduct")) {
                if (getUser(session, request, response)) {
                    billForBillId(request, dbconn);
                    dispatch(request, response, "/Detail.jsp");
                }
            }
            if (service.equals("updateStatus")) {
                if (getUser(session, request, response)) {
                    updateStatus(request, dbconn);
                    billManager(request, dbconn);
                    dispatch(request, response, "/AdminManager.jsp");
                }
            }
            if (service.equalsIgnoreCase("displayInsertForm")) {
                if (getUser(session, request, response)) {
                    displayInsertForm(request, dbconn);
                    dispatch(request, response, "/InsertProduct.jsp");
                }
            }
            if (service.equalsIgnoreCase("addProduct")) {
                if (getUser(session, request, response)) {
                    addProduct(request, dbconn, response);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void addProduct(HttpServletRequest request, DBConnection dbconn, HttpServletResponse response) throws SQLException {
        String sql = "SELECT MAX(sid) FROM SanPham";
        ResultSet rs = dbconn.getData(sql);
        String sid = request.getParameter("id");
        String name = request.getParameter("sname");
        int status = Integer.parseInt(request.getParameter("status"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String picture = request.getParameter("picture");
        String description = request.getParameter("description");
        int hid = Integer.parseInt(request.getParameter("hid"));
        DAOProduct dao = new DAOProduct(dbconn);
        Product p = new Product(sid, name, quantity, price, picture, description, status, hid);
        int n = dao.addProduct(p);
        if (n > 0) {
            request.setAttribute("mess", "Insert Thành Công");
            displayInsertForm(request, dbconn);
            dispatch(request, response, "/InsertProduct.jsp");
        } else {
            request.setAttribute("mess", "Insert Thất Bại");
            displayInsertForm(request, dbconn);
            dispatch(request, response, "/InsertProduct.jsp");
        }
    }

    private void displayInsertForm(HttpServletRequest request, DBConnection dbconn) {
        String sql = "select * from HangSanXuat";
        ResultSet rs2 = dbconn.getData(sql);
        request.setAttribute("rsHangSanXuat", rs2);
    }

    private void updateStatus(HttpServletRequest request, DBConnection dbconn) throws SQLException {
        int status = Integer.parseInt(request.getParameter("status"));
        int statusOld = Integer.parseInt(request.getParameter("statusOld"));
        if (status != statusOld) {
            int hdid = Integer.parseInt(request.getParameter("hdid"));
            DAOInvoice dao = new DAOInvoice(dbconn);
            DAOProduct daopro = new DAOProduct(dbconn);
            dao.updateInvoice2(status, hdid);
            String sql = "select * from HoaDonChiTiet where hdid= '" + hdid + "'";
            ResultSet rs = dbconn.getData(sql);
            ResultSet rs2;
            if (status == 2) {// khi ship thi - quantity
                while (rs.next()) {
                    sql = "select * from SanPham where sid = '" + rs.getString(2) + "'";
                    System.out.println(sql);
                    rs2 = dbconn.getData(sql);
                    if (rs2.next()) {
                        int Quantity = rs2.getInt(3);
                        Quantity = Quantity - rs.getInt(3);
                        if (Quantity <= 0) {
                            daopro.updateDes("Het Hang", rs.getInt(2));
                        }
                        int n = daopro.updateQuantity(Quantity, rs.getInt(2));
                        if (n > 0) {
                            System.out.println("update thanh cong");
                        }
                    }
                }
            } else if (status == 3) {// khach khong nhan + lai quantity
                while (rs.next()) {
                    sql = "select * from SanPham where sid = '" + rs.getString(2) + "'";
                    System.out.println(sql);
                    rs2 = dbconn.getData(sql);
                    if (rs2.next()) {
                        int Quantity = rs2.getInt(3);
                        Quantity = Quantity + rs.getInt(3);
                        int n = daopro.updateQuantity(Quantity, rs.getInt(2));
                        if (n > 0) {
                            System.out.println("update thanh cong");
                        }
                    }
                }
            }
            request.setAttribute("mess", "update thành công");
        }
    }

    private void billForBillId(HttpServletRequest request, DBConnection dbconn) throws SQLException {
        String id = request.getParameter("id");
        String total = request.getParameter("total");
        String sql = "select * from HoaDonChiTiet as a join SanPham as b on a.sid = b.sid where a.hdid = '" + id + "'";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("finalTotal", total);
        request.setAttribute("rsBill", rs);
        request.setAttribute("hid", id);
        sql = "select * from HoaDon where hdid = '" + id + "'";
        rs = dbconn.getData(sql);
        if (rs.next()) {
            request.setAttribute("status", rs.getString(8));
        }
    }

    private void updateProduct(HttpServletRequest request, DAOProduct daoProduct) {
        String sid = request.getParameter("sid");
        String name = request.getParameter("sname");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String picture = request.getParameter("picture");
        String description = request.getParameter("description");
        if (quantity <= 0) {
            description = "Het Hang";
        }
        int hid = Integer.parseInt(request.getParameter("hid"));
        Product p = new Product(sid, name, quantity, price, picture, description, hid);
        int n = daoProduct.updateProduct(p);
        if (n > 0) {
            request.setAttribute("mess", "Update thành công");
        } else {
            request.setAttribute("mess", "Update thất bại");
        }
    }

    private void updateProductForm(HttpServletRequest request, DBConnection dbconn) {
        String id = request.getParameter("id");
        String sql = "select * from SanPham as a join HangSanXuat as b on a.hid = b.hid where sid = '" + id + "'";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsSanPham", rs);
        sql = "select * from HangSanXuat";
        ResultSet rs2 = dbconn.getData(sql);
        request.setAttribute("rsHangSanXuat", rs2);
    }

    private void billManager(HttpServletRequest request, DBConnection dbconn) {
        request.setAttribute("Select", "billManager");
        String sql = "select * from HoaDon";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsBillManager", rs);

    }

    private void preDeleteProduct(HttpServletRequest request, DAOProduct dao, DBConnection dbconn, PrintWriter out) throws SQLException {
        String id = request.getParameter("id");
        String sql = "select * from HoaDonChiTiet where sid='" + id + "'";
        ResultSet rs = dbconn.getData(sql);
        if (!rs.next()) {
            dao.removeProduct(id);
            request.setAttribute("mess", "Xóa thành công");
        } else {
            request.setAttribute("mess", "Bạn không thể xóa vì sản phẩm này đã từng được mua");
        }
    }

    private void changeSttProduct(HttpServletRequest request, DAOProduct dao) {
        String username = request.getParameter("id");
        int status = Integer.parseInt(request.getParameter("status"));
        dao.changeStatus(username, status);
    }

    private void productManager(HttpServletRequest request, DBConnection dbconn) {
        request.setAttribute("Select", "productManager");
        String sql = "select * from SanPham as a join HangSanXuat as b on a.hid = b.hid";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsProductManager", rs);
    }

    private void changeSttCustomer(HttpServletRequest request, DAOKhachHang dao) {
        String username = request.getParameter("username");
        int status = Integer.parseInt(request.getParameter("status"));
        dao.changeStatus(username, status);
    }

    private void preDeleteCustomer(HttpServletRequest request, DAOKhachHang dao, DBConnection dbconn, PrintWriter out) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "select * from HoaDon where cid='" + id + "'";
        ResultSet rs = dbconn.getData(sql);
        if (!rs.next()) {
            dao.removeKhachHang(id);
            request.setAttribute("mess", "Xóa thành công");
        } else {
            request.setAttribute("mess", "Bạn không thể xóa vì khách hàng này đã từng mua sản phẩm");
        }
    }

    private void customerManager(HttpServletRequest request, DBConnection dbconn) {
        request.setAttribute("Select", "customerManager");
        String sql = "select * from KhachHang";
        ResultSet rs = dbconn.getData(sql);
        request.setAttribute("rsCustomerManager", rs);
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response,
            String page) {
        try {
            RequestDispatcher dispath = request.getRequestDispatcher(page);
            dispath.forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(AdminLoginController.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (IOException ex) {
            Logger.getLogger(AdminLoginController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    private boolean getUser(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        String userName;
        if (session.getAttribute("LoginAdmin") == null) {
            userName = "Login";
        } else {
            userName = session.getAttribute("LoginAdmin").toString();
        }
        request.setAttribute("LoginAdmin", userName);
        if (userName.equals("Login")) {
            request.setAttribute("mess", " ");
            dispatch(request, response, "/adminLogin.jsp");
        } else {
            return true;
        }
        return false;
    }

    private void removeSessionUser(HttpSession session, HttpServletRequest request) {
        java.util.Enumeration em = session.getAttributeNames();
        session.removeAttribute("LoginAdmin");
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
