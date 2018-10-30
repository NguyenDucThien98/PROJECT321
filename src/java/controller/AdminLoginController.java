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
public class AdminLoginController extends HttpServlet {

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

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
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
                dispatch(request, response, "/adminLogin.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminLoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response, DBConnection dbconn, HttpSession session) throws SQLException {
        String username = request.getParameter("username");
        request.setAttribute("mess", " ");
        if (username != null) { // da submit
            String password = request.getParameter("password");
            String sql = "select * from admin  where username='"
                    + username + "' and password='" + password
                    + "' and status=1";
            ResultSet rs = dbconn.getData(sql);
            if (rs.next()) {
                Object value = session.getAttribute(username);
                if (value == null) {
                    session.setAttribute("LoginAdmin", username); // put(key,value)
                } //the second/third... time the product is selected
                else {
                    session.setAttribute("LoginAdmin", username);
                }
                request.setAttribute("LoginAdmin", username);
                dispatch(request, response, "/adminLogin.jsp");
            } else {
                request.setAttribute("LoginAdmin", "Login");
                request.setAttribute("mess", "UserName or Password wrong!");
                dispatch(request, response, "/adminLogin.jsp");
            }
        } else {
            getUser(session, request);
            dispatch(request, response, "/adminLogin.jsp");
        }
    }

    private void getUser(HttpSession session, HttpServletRequest request) {
        String userName;
        if (session.getAttribute("LoginAdmin") == null) {
            userName = "Login";
        } else {
            userName = session.getAttribute("LoginAdmin").toString();
        }
        request.setAttribute("LoginAdmin", userName);
    }

    private void removeSessionUser(HttpSession session, HttpServletRequest request) {
        java.util.Enumeration em = session.getAttributeNames();
        session.removeAttribute("LoginAdmin");
       
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response,
            String page) {
        try {
            RequestDispatcher dispath = request.getRequestDispatcher(page);
            dispath.forward(request, response);
        } catch (ServletException ex) { 
            Logger.getLogger(AdminLoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AdminLoginController.class.getName()).log(Level.SEVERE, null, ex);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
            }// </editor-fold>
}

    
