/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/change-password"})
public class ChangePasswordController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String submit = request.getParameter("submit");

        int aID = Integer.parseInt(session.getAttribute("accountid").toString());
        AccountDAO d = new AccountDAO();
        if (submit == null) {
            if (d.getRoleByAccountID(aID) == 2) {
                request.getRequestDispatcher("ChangePasswordTenant.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            }
        } else {
            String username = (String) request.getParameter("username");
            String oldpassword = (String) request.getParameter("oldpassword");
            String newpassword = (String) request.getParameter("newpassword");
            String repassword = (String) request.getParameter("repassword");
            Account accountInfo = d.getAccountInfo(username, oldpassword);
            if (accountInfo == null) {
                String ms = "Không đúng mật khẩu cũ";
                request.setAttribute("ms", ms);
                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            } else {
                if (!newpassword.equals(repassword)) {
                    String re = "Hai mât khẩu không trùng nhau";
                    request.setAttribute("re", re);
                    request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);

                } else {
                    Account ac = new Account(accountInfo.getAccountId(), username, newpassword, accountInfo.getRoleId(), accountInfo.getProfileId(), accountInfo.isStatus(), accountInfo.getBalance());
                    d.ChangePass(ac);
                    session.setAttribute("account", ac);
                    String sucess = "Đổi mật khẩu thành công";
                    request.setAttribute("sucess", sucess);
                    request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);

                }
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
