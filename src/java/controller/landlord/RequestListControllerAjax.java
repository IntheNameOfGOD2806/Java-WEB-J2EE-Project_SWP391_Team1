/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import dal.AccountDAO;
import dal.ConstractDAO;
import dal.HouseDAO;
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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.House;
import model.Profile;
import model.Request;
import model.Room;

/**
 *
 * @author adm
 */
@WebServlet(name = "RequestListControllerAjax", urlPatterns = {"/request-listAjax"})

public class RequestListControllerAjax extends HttpServlet {

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
        RequestDAO requestDao = new RequestDAO();
        RoomDAO roomDao = new RoomDAO();
        HouseDAO houseDao = new HouseDAO();
        AccountDAO accDao = new AccountDAO();
        ConstractDAO conDao = new ConstractDAO();
        HttpSession session = request.getSession();

        //lay thong tin phong cho moi request va thiet lap thuoc tinh room, profile, house
        String service = request.getParameter("service");
        String getId = request.getParameter("id");
        if (service == null) {
            service = "view";
        }
        if (service.equals("agree")) {
            request.setAttribute("notification", "agree");
            request.setAttribute("getId", getId);
            int id = Integer.parseInt(getId);
            int accountId = requestDao.getAccountIdByRequestId(id);
            int roomId = requestDao.getRoomIdByRequestId(id);
            House house = houseDao.getHouseByRoomId(roomId);
            // Lấy ngày hiện tại
            LocalDate currentDate = LocalDate.now();
            // Định dạng ngày theo "YYYY-MM-DD"
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = currentDate.format(formatter);
            try {
                conDao.addConstract(accountId, roomId, formattedDate, null, true);

                conDao.updateTenantId(accountId, roomId);
                //update status of room after proccess request
                houseDao.updateStatusOfRoom(1, roomId);

                requestDao.deleteRequest(id);
            } catch (Exception e) {

            }
            int profileId = accDao.getProfileIdByAccountId(accountId);
            ProfileDAO proDao = new ProfileDAO();
            requestDao.sendMail(proDao.getEmailByProfileId(profileId),
                    "You have successfully rented a room",
                    "Your rental request for a room in " + house.getName() + " has been accepted");
        }
        if (service.equals("decline")) {

            request.setAttribute("notification", "decline");
            request.setAttribute("getId", getId);
            int id = Integer.parseInt(getId);
            int accountId = requestDao.getAccountIdByRequestId(id);
            int roomId = requestDao.getRoomIdByRequestId(id);
            House house = houseDao.getHouseByRoomId(roomId);
            requestDao.deleteRequest(id);

            int profileId = accDao.getProfileIdByAccountId(accountId);
            ProfileDAO proDao = new ProfileDAO();
            requestDao.sendMail(proDao.getEmailByProfileId(profileId),
                    "Your rental request has been turned down",
                    "Your rental request for a room in " + house.getName() + " has been declined");
        }
        //lay danh sach request theo lanlordID trong database
        List<Request> listR = requestDao.getRequestByLandlordID((int) session.getAttribute("accountid"), "DESC");
        boolean isRequestListEmpty = listR.isEmpty();
        for (Request re : listR) {
            int accoutID = re.getAccountID();
            Profile profile = accDao.getProfileByAccountId(accoutID);
            //thiet lap thuoc tinh profile cho request
            re.setProfile(profile);
            int roomID = re.getRoomID();
            Room room = roomDao.getRoomByRoomId(roomID);
            //thiet lap thuoc tinh room cho request
            re.setRoom(room);
            int houseID = room.getHouseID();
            House house = houseDao.getHouseByHouseId(houseID);
            //thiet lap thuoc tinh house cho room
            room.setHouse(house);
            request.setAttribute("landlordid", room.getHouse().getAccountID());
        }

        request.setAttribute("listR", listR);
        request.setAttribute("isRequestListEmpty", isRequestListEmpty);

        request.getRequestDispatcher("landlord/RequestListAjax.jsp").forward(request, response);

    }

    public static void main(String[] args) {
        HouseDAO hd = new HouseDAO();
        ConstractDAO cd = new ConstractDAO();
        cd.updateTenantId(6, 4);
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
