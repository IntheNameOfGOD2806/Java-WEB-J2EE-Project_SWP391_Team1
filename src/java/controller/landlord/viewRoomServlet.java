/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import controller.*;
import static com.sun.corba.se.impl.util.Utility.printStackTrace;
import dal.AccountDAO;
import dal.HouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.House;
import model.Image;
import model.Profile;
import model.Room;

/**
 *
 * @author Admin
 */
@WebServlet(name = "viewRoomServlet", urlPatterns = {"/viewroom"})
public class viewRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet viewRoomServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewRoomServlet at " + request.getContextPath() + "</h1>");
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
     String houseId_raw = request.getParameter("houseId");
        try {

            int houseId = Integer.parseInt(houseId_raw);
            HouseDAO hd = new HouseDAO();
            //get house by id
            House house = hd.getHouseByHouseId(houseId);
            
            //lay ra danh sach phong
            List<Room> list = hd.getRooms(houseId);
            //lay ra image cua nha
            List<Image> list1 = hd.getImageByHouseId(houseId);
            //tinh square cua house
            int sqr = hd.getAreaByHouseId(houseId);
            //get entire price of house
            double price = hd.getPriceOfHouse(houseId);
            //get profile of landlord
            AccountDAO ad = new AccountDAO();
            Profile profile=ad.getProfileByProfileId(ad.getProfileIdByAccountId(house.getAccountID()));
            //
            
            request.setAttribute("house", house);
            request.setAttribute("housePrice", price);

            request.setAttribute("listRoom", list);
            request.setAttribute("listImage", list1);
            
            request.setAttribute("sqr", sqr);
                request.setAttribute("landlordInfo", profile);
            request.getRequestDispatcher("landlord/viewYourRooms.jsp").forward(request, response);
         } catch (ServletException | IOException | NumberFormatException e) {
            printStackTrace();
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

    
    public static void main(String[] args) {
         HouseDAO hd = new HouseDAO();
         List<Room> list = hd.getRooms(3);
         System.out.println(list.get(2).getDescription());
    }
}
