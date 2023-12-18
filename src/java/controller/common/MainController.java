/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import dal.AccountDAO;
import dal.HouseDAO;
import dal.ImageDAO;
import dal.RoomDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;

/**
 *
 * @author huyht
 */
public class MainController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("go");
            ImageDAO imageDAO = new ImageDAO();
            AccountDAO accountDAO = new AccountDAO();
            RoomDAO roomDAO = new RoomDAO();
            HouseDAO houseDAO = new HouseDAO();
            int numOfUser = accountDAO.getAllAccount().size();
            int numOfRoom = roomDAO.getAllRooms().size();
            int numOfHouse = houseDAO.getHouses().size();
            if (service == null) {
                ResultSet resultSetImage = imageDAO.getSliderInfo();
                ResultSet resultSetImage2 = imageDAO.getSliderBelowInfo();
                RequestDispatcher dispatcher = request.getRequestDispatcher("index1.jsp");
                request.setAttribute("resultSetImage", resultSetImage);
                request.setAttribute("resultSetImage2", resultSetImage2);
                request.setAttribute("numOfUser", numOfUser);
                request.setAttribute("numOfRoom", numOfRoom);
                request.setAttribute("numOfHouse", numOfHouse);
                dispatcher.forward(request, response);
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
