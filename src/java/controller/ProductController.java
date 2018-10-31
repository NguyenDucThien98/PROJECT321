/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.DBConnection;

/**
 *
 * @author NguyenDucThien
 */
public class ProductController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            getSessionProduct(session, request);
            getUser(session, request);
            if (service == null) {
                service = "Display";
            }
            if (service.equalsIgnoreCase("Display")) {
                Display(request, session, rs, dbconn, response);
            }
            if (service.equalsIgnoreCase("signout")) {
                removeSessionUser(session, request);
                Display(request, session, rs, dbconn, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Display(HttpServletRequest request, HttpSession session, ResultSet rs, DBConnection dbconn, HttpServletResponse response) throws SQLException {
        String sql;
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        double numberProduct = 9;
        double offset = ((numberProduct * page) - numberProduct) + 1;
        String hidInt = request.getParameter("hid");
        getUser(session, request);
        getSessionProduct(session, request);
        request.setAttribute("page", page);
        if (hidInt == null) {
            sql = "SELECT *FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY sid) AS RowNum FROM SanPham where status = 1) AS MyTable"
                    + " WHERE MyTable.RowNum BETWEEN " + offset + " AND " + page * numberProduct + "";
            rs = dbconn.getData(sql);
            request.setAttribute("listProduct", rs);
            sql = "select COUNT(sid) from SanPham where status = 1";
            ResultSet rs2 = dbconn.getData(sql);
            Double count = 0.0;
            if (rs2.next()) {
                count = rs2.getDouble(1);
            }
            Double pageNum = Math.ceil((count / numberProduct));
            request.setAttribute("countpage", pageNum.intValue());
            displayHangSanXuat(request, rs, dbconn);
            dispatch(request, response, "/Product.jsp");
        } else {
            sql = "SELECT *FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY sid) AS RowNum FROM SanPham where hid ='" + Integer.parseInt(hidInt) + "' and status = 1) AS MyTable"
                    + " WHERE MyTable.RowNum BETWEEN " + offset + " AND " + page * numberProduct + "";
            rs = dbconn.getData(sql);
            request.setAttribute("listProduct", rs);
            sql = "select COUNT(sid) from SanPham where status = 1 and hid ='" + Integer.parseInt(hidInt) + "'";
            ResultSet rs2 = dbconn.getData(sql);
            Double count = 0.0;
            if (rs2.next()) {
                count = rs2.getDouble(1);
            }
            Double pageNum = Math.ceil((count / numberProduct));
            System.out.println(pageNum);
            request.setAttribute("countpage", pageNum.intValue());
            displayHangSanXuat(request, rs, dbconn);
            dispatch(request, response, "/Product.jsp");
        }

    }

    private void displayHangSanXuat(HttpServletRequest request, ResultSet rs, DBConnection dbconn) {
        String sql = "select * from HangSanXuat where status = 1";
        rs = dbconn.getData(sql);
        request.setAttribute("listManufacturer", rs);
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
