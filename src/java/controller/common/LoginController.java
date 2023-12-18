/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import dal.ProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Profile;

/**
 *
 * @author huyht
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //        processRequest(request, response);
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String remember = request.getParameter("remember");
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");

        AccountDAO d = new AccountDAO();
        Account accountInfo = d.getAccountInfo(username, password);
        

        if (accountInfo == null) {
            request.setAttribute("error", "Login Fail");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Cookie usernameCookie = new Cookie("usernameC", username);
            Cookie passwordCookie = new Cookie("passwordC", password);
            Cookie rememberCookie = new Cookie("rememberC", remember);
            if (remember != null) {
                rememberCookie.setMaxAge(60 * 60 * 24 * 7);
                usernameCookie.setMaxAge(60 * 60 * 24 * 7);
                usernameCookie.setMaxAge(60 * 60 * 24 * 7);
            } else {
                rememberCookie.setMaxAge(0);
                usernameCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);
            }
            //luu cookie vaof browser
            response.addCookie(rememberCookie);
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
            HttpSession session = request.getSession();
            session.setAttribute("account", accountInfo);
            session.setAttribute("name", username);
            session.setAttribute("accountid", accountInfo.getAccountId());
            session.setAttribute("roleid", accountInfo.getRoleId());
            ProfileDAO profileDAO = new ProfileDAO();
            Profile profile = profileDAO.getProfileByAccountId(accountInfo.getAccountId());
            session.setAttribute("profile", profile);
            if (accountInfo.getRoleId() == 4) {
                response.sendRedirect("view-feedback");
            } else {
                response.sendRedirect("home");
            }
        }
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
