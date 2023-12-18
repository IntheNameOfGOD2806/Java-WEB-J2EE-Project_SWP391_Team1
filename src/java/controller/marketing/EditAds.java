/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.AdvertisementDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Advertisement;

/**
 *
 * @author DELL i7
 */
public class EditAds extends HttpServlet {

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
        int adsID = Integer.parseInt(request.getParameter("adsId"));
        int houseID = Integer.parseInt(request.getParameter("houseId"));
        double adsFee = Double.parseDouble(request.getParameter("adsFee"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        AdvertisementDAO dao = new AdvertisementDAO();
        Date startdate = dao.convert(startDate);
        Date enddate = dao.convert(endDate);
        if (startdate.after(enddate)) {
            request.setAttribute("ads", adsID);
            request.setAttribute("ads2", houseID);
            request.setAttribute("ads3", adsFee);
            request.setAttribute("ads4", startDate);
            request.setAttribute("ads5", endDate);
            request.setAttribute("error", "endDate not after startDate");
            request.getRequestDispatcher("marketing/editAds.jsp").forward(request, response);
        } else if (startdate.equals(enddate)) {
            request.setAttribute("ads", adsID);
            request.setAttribute("ads2", houseID);
            request.setAttribute("ads3", adsFee);
            request.setAttribute("ads4", startDate);
            request.setAttribute("ads5", endDate);
            request.setAttribute("error", "endDate not equal startDate");
            request.getRequestDispatcher("marketing/editAds.jsp").forward(request, response);
        } else {
            dao.updateAds(adsID, houseID, adsFee, startdate, enddate);
            response.sendRedirect("ListAds");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdvertisementDAO dao = new AdvertisementDAO();
        int adsID = Integer.parseInt(request.getParameter("adsID"));
        Advertisement a = dao.getAdsByAdsId(adsID);
        request.setAttribute("ads", a);
        request.getRequestDispatcher("marketing/editAds.jsp").forward(request, response);
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
        String adsID = request.getParameter("adsId");
        String houseID = request.getParameter("houseId");
        String adsFee = request.getParameter("adsFee");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        if (adsID == null || houseID == null || adsFee == null || startDate == null || endDate == null) {
            request.setAttribute("error", this);
            request.getRequestDispatcher("").forward(request, response);
        } else {
            int AdsID = Integer.parseInt(adsID);
            int HouseID = Integer.parseInt(houseID);
            double AdsFee = Double.parseDouble(adsFee);
            AdvertisementDAO dao = new AdvertisementDAO();
            Date startdate = dao.convert(startDate);
            Date enddate = dao.convert(endDate);
            if (startdate.after(enddate)) {
                request.setAttribute("ads", AdsID);
                request.setAttribute("ads2", HouseID);
                request.setAttribute("ads3", AdsFee);
                request.setAttribute("ads4", startDate);
                request.setAttribute("ads5", endDate);
                request.setAttribute("error", "endDate not after startDate");
                request.getRequestDispatcher("marketing/editAds.jsp").forward(request, response);
            } else if (startdate.equals(enddate)) {
                request.setAttribute("ads", AdsID);
                request.setAttribute("ads2", HouseID);
                request.setAttribute("ads3", AdsFee);
                request.setAttribute("ads4", startDate);
                request.setAttribute("ads5", endDate);
                request.setAttribute("error", "endDate not equal startDate");
                request.getRequestDispatcher("marketing/editAds.jsp").forward(request, response);
            } else {
                dao.updateAds(AdsID, HouseID, AdsFee, startdate, enddate);
                response.sendRedirect("ListAds");
            }
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
