/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import dal.AccountDAO;
import dal.ConstractDAO;
import dal.HouseDAO;
import dal.RoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
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
public class ContractTenantController extends HttpServlet {

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
        HttpSession session = request.getSession();
        
        List<Constract> listCon = conDao.getConstractByAccountId((int) session.getAttribute("accountid"));
        boolean isContractListEmpty = listCon.isEmpty();
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
        }
        
        request.setAttribute("listCon", listCon);
        request.setAttribute("isContractListEmpty", isContractListEmpty);
        
        request.getRequestDispatcher("landlord/ContractTenant.jsp").forward(request, response);

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
