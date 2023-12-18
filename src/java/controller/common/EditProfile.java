/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import dal.ProfileDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import model.Profile;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "EditProfile", urlPatterns = {"/edit"})
public class EditProfile extends HttpServlet {

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
        ProfileDAO profileDAO = new ProfileDAO();
        String submit = request.getParameter("submit");
        String service = request.getParameter("go");
        AccountDAO accountDAO = new AccountDAO();

        if (service == null) {
            service = "edit";
        }
        if (service.equals("edit")) {
            if (submit == null) {
                int aID = Integer.parseInt(session.getAttribute("accountid").toString());
                Profile p = profileDAO.getProfileByAccountId(aID);
                request.setAttribute("dataprofile", p);
                if (accountDAO.getRoleByAccountID(aID) == 2) {
                    request.getRequestDispatcher("EditProfileTenent.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("EditProfile.jsp").forward(request, response);
                }
            } else {
                Profile pro = (Profile) session.getAttribute("profile");
                String FullName = request.getParameter("fullname");
                String Photo = (String) request.getParameter("Photo");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String DOB = request.getParameter("DOB");
                String gender = request.getParameter("gender");
                System.out.println(gender);
                Date DOBdate = Date.valueOf(DOB);
                int genderint = Integer.parseInt(gender);
                Profile p = new Profile(pro.getProfileID(), FullName, phone, DOBdate, genderint, email, Photo);
                profileDAO.updateProfile(p);
                response.sendRedirect("profile");

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
