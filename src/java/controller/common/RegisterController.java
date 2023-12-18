/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import dal.ProfileDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author adm
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
        response.sendRedirect("register.jsp");
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
        AccountDAO accDao = new AccountDAO();
        ProfileDAO proDao = new ProfileDAO();
        HttpSession session = request.getSession();

        request.setAttribute("error", null);

        String userName = (String) request.getParameter("userName");
        String fullName = (String) request.getParameter("fullName");
        String phone = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String dob = (String) request.getParameter("dob");
        String gender = (String) request.getParameter("gender");
        String password = (String) request.getParameter("password");
        String re_password = (String) request.getParameter("re_password");

        session.setAttribute("userName", userName);
        session.setAttribute("fullName", fullName);
        session.setAttribute("phone", phone);
        session.setAttribute("email", email);
        session.setAttribute("dob", dob);
        session.setAttribute("gender", gender);
        session.setAttribute("password", password);
        session.setAttribute("re_password", re_password);

        Account accountInfo = accDao.getAccountInfo(userName, password);
        boolean mail_existed = proDao.checkEmail(email);
        boolean error = false;
        //neu tai khoan da ton tai thi hien loi
        if (accountInfo != null) {
            error = true;
            request.setAttribute("error_account", "account-existed");
        }
        if (mail_existed) {
            error = true;
            request.setAttribute("error_mail", "email-existed");
        }
        if (!password.equals(re_password)) {
            error = true;
            request.setAttribute("error_repass", "pass-unmatched");
        } if (error == false) { //neu tai khoan chua ton tai thi tao tai khoan
            //check valid email_session
            session.setAttribute("otpAction", "register");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/sendMail").forward(request, response);
        } else if(error == true){
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
