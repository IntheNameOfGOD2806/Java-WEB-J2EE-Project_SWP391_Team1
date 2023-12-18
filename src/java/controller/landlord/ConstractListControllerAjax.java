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
import java.util.List;
import model.Constract;
import model.House;
import model.Profile;
import model.Room;

/**
 *
 * @author adm
 */
@WebServlet(name = "ConstractListControllerAjax", urlPatterns = {"/Constract-listAjax"})
public class ConstractListControllerAjax extends HttpServlet {

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
        ConstractDAO conDao = new ConstractDAO();
        RoomDAO roomDao = new RoomDAO();
        HouseDAO houseDao = new HouseDAO();
        AccountDAO accDao = new AccountDAO();
        RequestDAO requestDao = new RequestDAO();
        ProfileDAO proDao = new ProfileDAO();
        HttpSession session = request.getSession();

        String service = request.getParameter("service");
        String getId = request.getParameter("id");
        if (service == null) {
            service = "view";
        }
        if (service.equals("deActive")) {
            request.setAttribute("notification", "deActive");
            request.setAttribute("getId", getId);
            int id = Integer.parseInt(getId);
            System.out.println("contract id = " + id);
            int roomId = conDao.getRoomIdByConstractId(id);
            System.out.println("roomId = " + roomId);

            Constract c = conDao.getConstractByConstractId(id);
            //update status sau khi deactive
            houseDao.updateStatusOfRoom(0, c.getRoomID());
            //
            conDao.eraseTenantId(c.getRoomID());
            // 
            conDao.deActiveConstract(id);
            int accountId = conDao.getAccountIdByContractId(id);
            int profileId = accDao.getProfileIdByAccountId(accountId);
            System.out.println("profileID = " + profileId);
            System.out.println("email = " + proDao.getEmailByProfileId(profileId));
            House house = houseDao.getHouseByRoomId(roomId);
            System.out.println("house = " + house);
            System.out.println(house.getName());
            System.out.println("house name = " + house.getName());
            requestDao.sendMail(proDao.getEmailByProfileId(profileId),
                    "Your contract is expired",
                    "Your contract for a room in " + house.getName() + " has been expired");
        }

        if (service.equals("delete")) {
            request.setAttribute("notification", "deleted");
            request.setAttribute("getId", getId);
            int id = Integer.parseInt(getId);
            int roomId = conDao.getRoomIdByConstractId(id);

            Constract c = conDao.getConstractByConstractId(id);
            //update status sau khi deactive
            houseDao.updateStatusOfRoom(0, c.getRoomID());
            //
            conDao.eraseTenantId(c.getRoomID());
            //xoa
            conDao.deleteConstract(id);
        }

        List<Constract> listCon = conDao.getConstractByLandlordID((int) session.getAttribute("accountid"));
        boolean isContractListEmpty = listCon.isEmpty();
        //lay thong tin phong cho moi constract va thiet lap thuoc tinh room, profile, house
        for (Constract constract : listCon) {
            int accountID = constract.getAccountID();
            Profile profile = accDao.getProfileByAccountId(accountID);
            //thiet lap thuoc tinh profile cho constract
            constract.setProfile(profile);
            int roomID = constract.getRoomID();
            Room room = roomDao.getRoomByRoomId(roomID);
            //thiet lap thuoc tinh room cho constract
            constract.setRoom(room);
            int houseID = room.getHouseID();
            House house = houseDao.getHouseByHouseId(houseID);
            //thiet lap thuoc tinh house cho room
            room.setHouse(house);
            //
        }

        request.setAttribute("listCon", listCon);
        request.setAttribute("isContractListEmpty", isContractListEmpty);
        request.getRequestDispatcher("landlord/ConstractListAjax.jsp").forward(request, response);
    }

    public static void main(String[] args) {
        ConstractDAO conDao = new ConstractDAO();
        RoomDAO roomDao = new RoomDAO();
        HouseDAO houseDao = new HouseDAO();
        AccountDAO accDao = new AccountDAO();
        conDao.eraseTenantId(4);
        Constract c = conDao.getConstractByConstractId(1);
        System.out.println(c.getRoomID());
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
