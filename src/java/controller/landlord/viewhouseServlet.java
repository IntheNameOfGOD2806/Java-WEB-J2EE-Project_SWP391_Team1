/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import static com.sun.corba.se.impl.util.Utility.printStackTrace;
import dal.AccountDAO;
import dal.FeedbackDAO;
import dal.HouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Feedback;
import model.House;
import model.HouseCategory;
import model.Image;
import model.Profile;
import model.Room;

/**
 *
 * @author trant
 */
@WebServlet(name = "viewhouseServlet", urlPatterns = {"/viewhouse"})
public class viewhouseServlet extends HttpServlet {

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
            out.println("<title>Servlet viewhouseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewhouseServlet at " + request.getContextPath() + "</h1>");
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
        FeedbackDAO fd = new FeedbackDAO();

        try {

            int houseId = Integer.parseInt(houseId_raw);
            HouseDAO hd = new HouseDAO();
            //get category
         
            //feedback
            List<Feedback> listFeedbacks = hd.getFeedBacksOfHouse(houseId);
            //get house by id
            House house = hd.getHouseByHouseId(houseId);
            List<House> listSimilar = hd.getSimilarHouses(house.getCategoryID());
            //
               HouseCategory category=hd.getCategoryHouse(house.getCategoryID());
               request.setAttribute("category", category);
            //lay ra danh sach phong
            List<Room> list = hd.getRooms(houseId);
            if (list.isEmpty()) {
                request.setAttribute("noresult", "This House Doesn't have any room");
            }
            //lay ra image cua nha
            List<Image> list1 = hd.getImageByHouseId(houseId);
            //tinh square cua house
            int sqr = hd.getAreaByHouseId(houseId);
            //get entire price of house
            double price = hd.getMinRoomPriceByHouseId(houseId);
            //get profile of landlord
            AccountDAO ad = new AccountDAO();
            Profile profile = ad.getProfileByProfileId(ad.getProfileIdByAccountId(house.getAccountID()));
            //

            request.setAttribute("house", house);
            HttpSession ss= request.getSession();
                        ss.setAttribute("houseid", house.getHouseID());

            request.setAttribute("housePrice", price);

            request.setAttribute("listRoom", list);
            request.setAttribute("similar", listSimilar);

            request.setAttribute("listImage", list1);
            request.setAttribute("listFeedback", listFeedbacks);

            request.setAttribute("sqr", sqr);
            request.setAttribute("landlordInfo", profile);
            request.getRequestDispatcher("property-1.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            printStackTrace();
        }

    }
//tesst code

    public static void main(String[] args) {
        HouseDAO hd = new HouseDAO();
        //get house by id
        House house = hd.getHouseByHouseId(2);
        System.out.println(house.getDescription());
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
