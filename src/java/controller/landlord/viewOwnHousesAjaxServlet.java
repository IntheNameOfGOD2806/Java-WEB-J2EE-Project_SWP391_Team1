/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

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
import model.HouseCategory;
import model.Profile;

/**
 *
 * @author Admin
 */
@WebServlet(name = "viewOwnHousesAjaxServlet", urlPatterns = {"/viewyourhousesAjax"})
public class viewOwnHousesAjaxServlet extends HttpServlet {

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
            out.println("<title>Servlet viewOwnHousesAjaxServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewOwnHousesAjaxServlet at " + request.getContextPath() + "</h1>");
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
          HouseDAO hd = new HouseDAO();
       
//        request.setAttribute("houseList", list);
        List<HouseCategory> list2 = hd.getListCategory();
        request.setAttribute("data", list2);
        String accountid_raw = request.getParameter("accountId");
        try {
            int accountid = Integer.parseInt(accountid_raw);
//            HouseDAO hd = new HouseDAO();
            AccountDAO ad = new AccountDAO();
            int pid = ad.getProfileIdByAccountId(accountid);
            Profile profile = ad.getProfileByProfileId(pid);
            request.setAttribute("profile", profile);

            List<House> list = hd.getHousesByAccountId(accountid);
            request.setAttribute("listHouse", list);

        } catch (Exception e) {
            printStackTrace();
        }
        request.getRequestDispatcher("landlord/viewYourHouseAjax.jsp").forward(request, response);
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
