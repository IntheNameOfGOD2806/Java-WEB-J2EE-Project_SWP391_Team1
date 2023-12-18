/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import controller.*;
import dal.HouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author trant
 */
@WebServlet(name = "createroomsServlet", urlPatterns = {"/createroom"})
public class createroomsServlet extends HttpServlet {

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
            out.println("<title>Servlet createroomsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createroomsServlet at " + request.getContextPath() + "</h1>");
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
        String houseid_raw = request.getParameter("houseid");
        try {
            int houseid = Integer.parseInt(houseid_raw);
            request.setAttribute("houseid", houseid);
            request.getRequestDispatcher("landlord/create-room.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
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
//        processRequest(request, response);
        HttpSession ss = request.getSession();
        int accountid = (Integer) (ss.getAttribute("accountid"));
        String houseid_raw = request.getParameter("houseid");
        String price_raw = request.getParameter("price");
        String description = request.getParameter("description");
        String area_raw = request.getParameter("area");
        String status_raw = request.getParameter("status");
        try {
            double price = Double.parseDouble(price_raw);
            int area = Integer.parseInt(area_raw);
            int status = Integer.parseInt(status_raw);
            int houseid = Integer.parseInt(houseid_raw);
            HouseDAO hd = new HouseDAO();
            hd.createRoom(houseid, accountid, price, description, area, status);
            response.sendRedirect("viewyourhouses?accountId="+accountid);
        } catch (NumberFormatException e) {
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
