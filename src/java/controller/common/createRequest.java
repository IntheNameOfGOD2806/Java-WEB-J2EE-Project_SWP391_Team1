/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.AccountDAO;
import dal.HouseDAO;
import dal.ProfileDAO;
import dal.RequestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Calendar;
import model.House;

/**
 *
 * @author Admin
 */
@WebServlet(name = "createRequest", urlPatterns = {"/createrequest"})
public class createRequest extends HttpServlet {

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
            out.println("<title>Servlet createRequest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createRequest at " + request.getContextPath() + "</h1>");
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
        HouseDAO hd = new HouseDAO();
        RequestDAO requestDao = new RequestDAO();
        AccountDAO accDao = new AccountDAO();
//        processRequest(request, response);
        HttpSession ss = request.getSession();
        int accountid = (int) ss.getAttribute("accountid");
        String roomid_raw = request.getParameter("roomid");

        try {
            // Lấy ngày hiện tại
            Calendar calendar = Calendar.getInstance();
            java.util.Date utilDate = calendar.getTime();

            // Chuyển đổi từ java.util.Date sang java.sql.Date
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            int roomid = Integer.parseInt(roomid_raw);
            RequestDAO rd = new RequestDAO();

            House house = hd.getHouseByRoomId(roomid);
            int houseid = house.getHouseID();
            boolean checkduprequest = hd.checkDuplicateRequest(accountid, roomid);
            if (checkduprequest) {
                request.setAttribute("duprequest", "you alredy create a request for this room");
                request.getRequestDispatcher("viewhouse?houseId=" + houseid).forward(request, response);
            } else {
                rd.createRequest(accountid, roomid, sqlDate);
                request.setAttribute("success", "request created successfully");

                int landlordId = house.getAccountID();
                ProfileDAO proDao = new ProfileDAO();
                int profileId = proDao.getProfileIdByAccountId(landlordId);
                requestDao.sendMail(proDao.getEmailByProfileId(profileId),
                        "New Request for your room",
                        "There's a new rental request for a room in " + house.getName());

                request.getRequestDispatcher("viewhouse?houseId=" + houseid).forward(request, response);

            }

        } catch (Exception e) {

        }
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
