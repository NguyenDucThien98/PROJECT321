/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.DetailedInvoice;
import entity.Invoice;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import static java.sql.DriverManager.getConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAODetailedInvoice;
import model.DAOInvoice;
import model.DBConnection;

/**
 *
 * @author NguyenDucThien
 */
public class CartController extends HttpServlet {

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
        ResultSet rs = null;
        HttpSession session = request.getSession();
        java.util.Enumeration em = session.getAttributeNames();
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            request.setAttribute("mess", "");
            countProduct(session, em);
            getSessionProduct(session, request);
            getUser(session, request);
            if (service == null) {
                service = "Display";
            }
            if (service.equalsIgnoreCase("Display")) {
                displayListProduct(response, request, session, em, dbconn, rs);
            }
            if (service.equalsIgnoreCase("signout")) {
                removeSessionUser(session, request);
                displayListProduct(response, request, session, em, dbconn, rs);
            }
            if (service.equalsIgnoreCase("insertDB")) {
                insertDB(request, dbconn, em, session, rs, response);

            }
            if (service.equalsIgnoreCase("removeAProduct")) {
                removeAProduct(request, session);
                countProduct(session, em);
                getSessionProduct(session, request);
                displayListProduct(response, request, session, em, dbconn, rs);
            }
            if (service.equalsIgnoreCase("removeAllProduct")) {
                removeAllProduct(em, session);
                displayListProduct(response, request, session, em, dbconn, rs);
            }
            if (service.equalsIgnoreCase("AddProduct")) {
                addProduct(request, session, em);
                displayListProduct(response, request, session, em, dbconn, rs);
            }
            if (service.equalsIgnoreCase("update")) {
                update(request, session, em, dbconn);
                displayListProduct(response, request, session, em, dbconn, rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    double finalTotal = 0;
    boolean check = false;

    private void update(HttpServletRequest request, HttpSession session, java.util.Enumeration em,DBConnection dbconn) throws SQLException {
        int n = Integer.parseInt(request.getParameter("i"));
        for (int i = 0; i < n; i++) {
            String id = request.getParameter("id" + i);
            int xcount = Integer.parseInt(request.getParameter("quantity" + i));
            if (xcount < 0) {
                xcount = 1;
            }
            if (xcount > 10) {
                xcount = 10;
            }
            String sql = "SELECT * FROM SanPham WHERE sid in (" + id + ")";
            ResultSet rs = dbconn.getData(sql);
            if(rs.next()){
                if(rs.getInt(3) < xcount){
                    xcount = rs.getInt(3);
                    request.setAttribute("mess", "San pham \""+rs.getString(2)+"\" hien chi con "+xcount+" cai trong kho");
                }
                
            }
            
            session.setAttribute(id, String.valueOf(xcount));
        }
    }

    private void displayListProduct(HttpServletResponse response, HttpServletRequest request, HttpSession session, java.util.Enumeration em, DBConnection dbconn, ResultSet rs) throws SQLException {
        countProduct(session, em);
        getSessionProduct(session, request);
        getUser(session, request);
        em = session.getAttributeNames();
        int countQuantity = 0;
        finalTotal = 0;
        check = false;
        String xID = "";
        while (em.hasMoreElements()) {
            String id = em.nextElement().toString();
            if (id.matches("[0-9]+$")) {
                xID += id + ",";
                check = true;
            }
        }
        if (check == true) {
            xID = xID.substring(0, xID.length() - 1);
            String sql = "SELECT * FROM SanPham WHERE sid in (" + xID + ")";
            System.out.println(sql);
            rs = dbconn.getData(sql);
            ResultSet rs2 = dbconn.getData(sql);
            request.setAttribute("rsDisProduct", rs);
            while (rs2.next()) {
                int id = rs2.getInt("sid");
                String quantity = session.getAttribute(id + "").toString();
                Double price = rs2.getDouble("price");
                Double t = Integer.parseInt(quantity) * price;
                finalTotal += t;
            }
        }
        request.setAttribute("check", check + "");
        request.setAttribute("finalTotal", finalTotal);
        dispatch(request, response, "/Cart.jsp");

    }

    private void countProduct(HttpSession session, java.util.Enumeration em) {
        int countProduct = 0;
        em = session.getAttributeNames();
        while (em.hasMoreElements()) {
            String id = em.nextElement().toString();
            if (id.matches("[0-9]+$")) {
                countProduct++;
            }
        }
        session.setAttribute("countProduct", countProduct);
    }

    private void addProduct(HttpServletRequest request, HttpSession session, java.util.Enumeration em) {
        String xid = request.getParameter("id"); // id - key
        if (xid != null) {
            Object xvalue = session.getAttribute(xid);//getKey(id)
            //   Product pro=(Product)session.getAttribute(id);
            //the first time the product is selected
            if (xvalue == null) {
                //put name-value pair into session object (see HttpSession)
                session.setAttribute(xid, "1"); // put(key,value)
            } //the second/third... time the product is selected
            else {
                int xcount = Integer.parseInt(xvalue.toString()) + 1;
                //put name-value pair into session object (see HttpSession)
                session.setAttribute(xid, String.valueOf(xcount));
            }
            countProduct(session, em);
            getSessionProduct(session, request);
        }
    }

    private void removeAProduct(HttpServletRequest request, HttpSession session) {
        String idRemove = request.getParameter("idRemove");
        if (idRemove != null) {
            session.removeAttribute(idRemove);
        }

    }

    private void removeAllProduct(java.util.Enumeration em, HttpSession session) {
        em = session.getAttributeNames();
        while (em.hasMoreElements()) {
            String id = em.nextElement().toString();
            if (id.matches("[0-9]+$")) {
                session.removeAttribute(id);
            }
        }
        session.setAttribute("countProduct", 0);
    }

    private void insertDB(HttpServletRequest request, DBConnection dbconn, java.util.Enumeration em, HttpSession session, ResultSet rs, HttpServletResponse response) throws SQLException, IOException {
        if (session.getAttribute("Login") != null) {
            String username = session.getAttribute("Login").toString();
            DAOInvoice dao = new DAOInvoice(dbconn);
            String sql = "SELECT * FROM KhachHang WHERE username = '" + username + "'";
            rs = dbconn.getData(sql);
            if (rs.next()) {
                int cid = rs.getInt("cid");
                String rcname = rs.getString("cname");
                String raddress = rs.getString("address");
                String rphone = rs.getString("phone");
                Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
                Invoice invoice = new Invoice(date, cid, rcname, raddress, rphone, finalTotal, 1);
                int n = dao.addInvoice(invoice);
                if (n > 0) {
                    sql = "SELECT MAX(hdid) FROM HoaDon";
                    rs = dbconn.getData(sql);
                    int hdid = 1;
                    if (rs.next()) {
                        hdid = rs.getInt(1);
                    }
                    em = session.getAttributeNames();
                    while (em.hasMoreElements()) {
                        String sid = em.nextElement().toString();
                        sql = "SELECT * FROM SanPham WHERE sid = '" + sid + "'";
                        rs = dbconn.getData(sql);
                        if (rs.next()) {
                            int quantity = Integer.parseInt(session.getAttribute(sid).toString());
                            Double price = rs.getDouble("price");
                            Double total = quantity * price;
                            DAODetailedInvoice daoDetailedInvoice = new DAODetailedInvoice(dbconn);
                            DetailedInvoice detailedInvoice = new DetailedInvoice(hdid, sid, quantity, total);
                            daoDetailedInvoice.addDetailedInvoice(detailedInvoice);
                        }
                    }
                }
                request.setAttribute("mess", "Đặt hàng thành công");
                removeAllProduct(em, session);
                countProduct(session, em);
                getSessionProduct(session, request);
                displayListProduct(response, request, session, em, dbconn, rs);
            }

        } else {
            request.setAttribute("Mess", " ");
            dispatch(request, response, "/Login.jsp");
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
        getUser(session, request);
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response,
            String page) {
        try {
            RequestDispatcher dispath = request.getRequestDispatcher(page);
            dispath.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
