/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.AdvertisementDAO;
import dal.BlogDAO;
import dal.FeedbackDAO;
import dal.HouseDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Advertisement;
import model.Blog;
import model.Feedback;
import model.House;

/**
 *
 * @author dang9
 */
@WebServlet(name = "MKTDashBoard", urlPatterns = {"/MKTDashBoard"})
public class MKTDashBoard extends HttpServlet {

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

        AdvertisementDAO adsDAO = new AdvertisementDAO();
        HouseDAO houseDAO = new HouseDAO();
        BlogDAO blogDAO = new BlogDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        
        List<House> listHouse = houseDAO.getHouses();
        List<Blog> listBlog = blogDAO.getSortedBlog("DESC");
        List<Feedback> listFeedback = feedbackDAO.getAll();
        List<Advertisement> listNewAds = adsDAO.getSortedAds("DESC");
        List<Advertisement> listOldAds = adsDAO.getSortedAds("ASC");

        String allProfit = "select SUM(AdsFee) from Advertisement";
        int profit = 0;
        try {
            ResultSet rs = adsDAO.getData(allProfit);
            if (rs.next()) {
                profit = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(controller.landlord.DashBoard.class.getName()).log(Level.SEVERE, null, ex);
        }

        LocalDate localDate = LocalDate.now();
        int month = localDate.getMonth().getValue();
        int year = localDate.getYear();
        List<Integer> profitpm = new ArrayList<>();
        List<String> profitmonth = new ArrayList<>();
        String[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
        for (int i = 0; i < 12; i++) {
            if (month == 0) {
                month = 12;
                year -= 1;
            }
            profitpm.add(0, adsDAO.calcProfitByTime(month, year));
            profitmonth.add(0, "\"" + months[month - 1] + "\"");
            month--;
        }
        
        request.setAttribute("profit", profit);
        request.setAttribute("adsHouse", listNewAds.size());
        request.setAttribute("allHouse", listHouse.size());

        request.setAttribute("listNewAds", listNewAds);
        request.setAttribute("listOldAds", listOldAds);
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("listFeedback", listFeedback);

        request.setAttribute("profitpm", profitpm);
        request.setAttribute("profitmonth", profitmonth);
        
        request.getRequestDispatcher("marketing/DashBoard.jsp").forward(request, response);
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
