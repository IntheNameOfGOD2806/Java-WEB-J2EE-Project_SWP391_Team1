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
import java.sql.Date;
import model.Account;

/**
 *
 * @author adm
 */
public class RegisterSucceedController extends HttpServlet {

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
        AccountDAO accDao = new AccountDAO();
        ProfileDAO proDao = new ProfileDAO();
        HttpSession session = request.getSession();

        String userName = (String) session.getAttribute("userName");
        String fullName = (String) session.getAttribute("fullName");
        String phone = (String) session.getAttribute("phone");
        String email = (String) session.getAttribute("email");
        String dob = (String) session.getAttribute("dob");
        String gender = (String) session.getAttribute("gender");
        String password = (String) session.getAttribute("password");

        int gender_int = Integer.parseInt(gender);
        Date dob_date = Date.valueOf(dob);

        proDao.addProfile(proDao.getNewestProfileID() + 1, fullName, phone,
                dob_date, gender_int, email, "images/avatar/macdinh.jpg");

        accDao.addAccount(userName, password, 2, proDao.getNewestProfileID(),
                1, 0);

        AccountDAO d = new AccountDAO();
        Account accountInfo = d.getAccountInfo(userName, password);
        if (accountInfo == null) {
            request.setAttribute("error", "Tai khoan khong ton tai");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            session.setAttribute("account", accountInfo);

            session.setAttribute("name", userName);
            session.setAttribute("accountid", accountInfo.getAccountId());
            session.setAttribute("roleid", accountInfo.getRoleId());
            if (accountInfo.getRoleId() == 4) {
                response.sendRedirect("view-feedback");
            } else {
                response.sendRedirect("home");
            }
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
     * '
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