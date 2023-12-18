/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import dal.AdvertisementDAO;
import dal.ConstractDAO;
import dal.ProfileDAO;
import dal.RequestDAO;
import dal.RoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Advertisement;
import model.Constract;
import model.Request;
import model.Room;

/**
 *
 * @author dang9
 */
@WebServlet(name = "DashBoard", urlPatterns = {"/DashBoard"})
public class DashBoard extends HttpServlet {

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

        HttpSession session = request.getSession();
        int landlordID = (int) session.getAttribute("accountid");
        RoomDAO roomDAO = new RoomDAO();
        RequestDAO requestDAO = new RequestDAO();
        ConstractDAO contractDAO = new ConstractDAO();
        AdvertisementDAO adsDAO = new AdvertisementDAO();

        List<Room> listRoom = roomDAO.getRoomByLandlordID(landlordID);
        List<Room> rentedRoom = roomDAO.getRoomByStatusAndLandlordID(landlordID, 1);
        List<Request> listRequest = requestDAO.getRequestByLandlordID(landlordID, "DESC");
        List<Constract> listContract = contractDAO.getContractByLandlordID(landlordID, "ASC");
        List<Constract> listNewContract = contractDAO.getContractByLandlordID(landlordID, "DESC");
        List<Advertisement> listAds = adsDAO.getAdsByLandlordId(landlordID);

        String allProfit = "SELECT SUM(Price*[month]) FROM (select Price,CEILING(DATEDIFF(DAY, StartDate, CURRENT_TIMESTAMP)/30.0) as [month] from Room r\n"
                + "join Constract c on r.RoomID = c.RoomID\n"
                + "where c.[Status] = 1 and HouseID in\n"
                + "(select HouseID from House\n"
                + "where AccountID = " + landlordID + ")\n"
                + "UNION ALL\n"
                + "select Price,CEILING(DATEDIFF(DAY, StartDate, EndDate)/30.0) as [month] from Room r\n"
                + "join Constract c on r.RoomID = c.RoomID\n"
                + "where c.[Status] = 0 and HouseID in\n"
                + "(select HouseID from House\n"
                + "where AccountID = " + landlordID + ")) as uni";

        int profit = 0;
        try {
            ResultSet rs = contractDAO.getData(allProfit);
            if (rs.next()) {
                profit = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
        }

        LocalDate localDate = LocalDate.now();
        int month = localDate.getMonth().getValue();
        int year = localDate.getYear();
        List<Integer> profitpm = new ArrayList<>();
        List<String> profitmonth = new ArrayList<>();
        String[] months = {"January", "February", "March","April","May","June","July","August","September","October","November","December"};
        for (int i = 0; i < 12; i++) {
            if (month == 0) {
                month = 12;
                year -= 1;
            }
            profitpm.add(0,contractDAO.calcProfitByTime(landlordID, month, year));
            profitmonth.add(0,"\"" + months[month-1] + "\"");
            month--;
        }

        request.setAttribute("profit", profit);
        request.setAttribute("rentedRoom", rentedRoom.size());
        request.setAttribute("allRoom", listRoom.size());

        request.setAttribute("listRequest", listRequest);
        request.setAttribute("listContract", listContract);
        request.setAttribute("listNewContract", listNewContract);
        request.setAttribute("listAds", listAds);

        request.setAttribute("profitpm", profitpm);
        request.setAttribute("profitmonth", profitmonth);

        request.getRequestDispatcher("landlord/DashBoard.jsp").forward(request, response);
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
