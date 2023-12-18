/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import dal.AccountDAO;
import dal.AdvertisementDAO;
import dal.HouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import model.Account;
import model.House;


@WebServlet(name = "CreateAdsLandLordAjax", urlPatterns = {"/CreateAdsLandLordAjax"})

public class CreateAdsLandLordAjax extends HttpServlet {

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
        HttpSession session = request.getSession();
        int landlordID = (int) session.getAttribute("accountid");
        AdvertisementDAO dao = new AdvertisementDAO();
        AccountDAO accountDAO = new AccountDAO();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        int houseID = Integer.parseInt(request.getParameter("houseID"));
        int timeAds = Integer.parseInt(request.getParameter("time"));
        double balance;
        double MKT_Balance;
        Account account = accountDAO.getAccountByAccountId(landlordID);
        Account account_MKT = accountDAO.getAccountByAccountId(10);
        
        if (timeAds==0) {
             session.setAttribute("errorad", "please choose time");
//            request.getRequestDispatcher("landlord/createAds.jsp").forward(request, response);
        }
        switch (timeAds) {
            case 1:
                balance = account.getBalance() - 50000;
                MKT_Balance = account_MKT.getBalance() + 50000;
                cal2.add(Calendar.DATE, +7);
                String startDate_raw = dateFormat.format(cal.getTime());
                String endDate_raw = dateFormat.format(cal2.getTime());
                Date startdate = dao.convert(startDate_raw);
                Date enddate = dao.convert(endDate_raw);
                if (balance < 0) {
                    session.setAttribute("errorad", "There is not enough money in the account to make this transaction");
//                    request.getRequestDispatcher("landlord/createAds.jsp").forward(request, response);
                } else {
                    dao.createAds(houseID, 50000, startdate, enddate,1);
                    accountDAO.updateBalance(landlordID, balance);
                    accountDAO.updateBalance(account_MKT.getAccountId(), MKT_Balance);
                }

                break;
            case 2:
                balance = account.getBalance() - 200000;
                MKT_Balance = account_MKT.getBalance() + 200000;
                cal2.add(Calendar.DATE, +30);
                String startDate_raw1 = dateFormat.format(cal.getTime());
                String endDate_raw1 = dateFormat.format(cal2.getTime());
                Date startdate1 = dao.convert(startDate_raw1);
                Date enddate1 = dao.convert(endDate_raw1);
                if (balance < 0) {
                    session.setAttribute("errorad", "There is not enough money in the account to make this transaction");
//                    request.getRequestDispatcher("landlord/createAds.jsp").forward(request, response);
                } else {
                    dao.createAds(houseID, 200000, startdate1, enddate1,1);
                    accountDAO.updateBalance(landlordID, balance);
                    accountDAO.updateBalance(account_MKT.getAccountId(), MKT_Balance);
                }

                break;
            case 3:
                balance = account.getBalance() - 600000;
                MKT_Balance = account_MKT.getBalance() + 600000;
                cal2.add(Calendar.DATE, +90);
                String startDate_raw2 = dateFormat.format(cal.getTime());
                String endDate_raw2 = dateFormat.format(cal2.getTime());
                Date startdate2 = dao.convert(startDate_raw2);
                Date enddate2 = dao.convert(endDate_raw2);
                if (balance < 0) {
                    session.setAttribute("errorad", "There is not enough money in the account to make this transaction");
//                    request.getRequestDispatcher("landlord/createAds.jsp").forward(request, response);
                } else {
                    dao.createAds(houseID, 600000, startdate2, enddate2,1);
                    accountDAO.updateBalance(landlordID, balance);
                    accountDAO.updateBalance(account_MKT.getAccountId(), MKT_Balance);
                }

                break;
            default:
                     

                break;
        }
//        response.sendRedirect("viewyourhouses?accountId="+landlordID);
                   doGet(request, response);

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
        String error = (String) request.getAttribute("error");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int accountID = (int) session.getAttribute("accountid");
        HouseDAO dao = new HouseDAO();
        List<House> house = dao.getHousesByAccountId(accountID);

        request.setAttribute("listHouse", house);
                request.setAttribute("error", error);

        request.getRequestDispatcher("landlord/createAdsAjax.jsp").forward(request, response);
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

    public static void main(String[] args) {
        HouseDAO dao = new HouseDAO();
        List<House> house = dao.getHousesByAccountId(7);
        for (House house1 : house) {
            System.out.println(house1.getHouseID());
            System.out.println("1");
        }
    }
}
