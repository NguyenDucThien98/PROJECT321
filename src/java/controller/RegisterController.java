/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.KhachHang;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOKhachHang;
import model.DBConnection;

/**
 *
 * @author NguyenDucThien
 */
public class RegisterController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            getSessionProduct(session, request);
            request.setAttribute("mess", " ");
            if (service == null) {
                service = "Display";
            }
            if (service.equalsIgnoreCase("Display")) {
                dispatch(request, response, "Register.jsp");
            }
            if (service.equalsIgnoreCase("Register")) {
                register(request, Dao);
                dispatch(request, response, "Register.jsp");
            }

        }
    }

    private void register(HttpServletRequest request, DAOKhachHang Dao) {
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
                KhachHang kh = new KhachHang(name, Address, Telephone, UserName, Password, 1);
                int n = Dao.addKhachHang(kh);
                if (n > 0) {
                    mess = "Đăng Kí thành Công";
                }
                else{
                    mess = "Tài khoản đã tồn tại hoặc sai thông tin";
                }
            } else {
                mess = "Mật Khẩu không khớp";
            }
        }
        request.setAttribute("mess", mess);
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

    private void dispatch(HttpServletRequest request, HttpServletResponse response,
            String page) {
        try {
            RequestDispatcher dispath = request.getRequestDispatcher(page);
            dispath.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
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
