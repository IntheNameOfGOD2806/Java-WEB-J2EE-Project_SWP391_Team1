/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

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
import model.House;
import model.HouseCategory;

/**
 *
 * @author trant
 */
@WebServlet(name = "ViewhousesController", urlPatterns = {"/viewhouses"})
public class ViewhousesController extends HttpServlet {

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
            out.println("<title>Servlet homeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession ss = request.getSession();
        List<House> listSort = (List<House>) ss.getAttribute("tosort");

        HouseDAO hd = new HouseDAO();
        List<House> list;
        list = hd.getHouses();
//        request.setAttribute("houseList", list);
        List<HouseCategory> list2 = hd.getListCategory();
        request.setAttribute("data", list2);

        String sort = request.getParameter("sort");
        String cid_raw = request.getParameter("key");
        String key = request.getParameter("key2");

        String from_price_raw = request.getParameter("fromprice");
        String to_price_raw = request.getParameter("toprice");
        String from_price1_raw = request.getParameter("fromprice1");
        String to_price1_raw = request.getParameter("toprice1");
        Double price1, price2, price3, price4;

        try {
            int cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
            price1 = ((from_price_raw == null) || (from_price_raw.equals("")))
                    ? null : Double.parseDouble(from_price_raw);
            price2 = ((to_price_raw == null) || (to_price_raw.equals("")))
                    ? null : Double.parseDouble(to_price_raw);
            //

            ///
            List<House> houses = hd.search(key, price1, price2, cid);
            try {
                if (price1 != null) {
                    request.setAttribute("fromprice", price1);

                }
                if (price2 != null) {
                    request.setAttribute("toprice", price2);

                }
                if (sort != null) {
                    if (sort.equals("lowtohigh")) {
                        request.setAttribute("sortp", "lowtohigh");
                        houses = hd.sortmin();

                    } else if (sort.equals("hightolow")) {
                        request.setAttribute("sortp", "hightolow");

                        houses = hd.sortmax();

                    }
                }

            } catch (NullPointerException e) {
                houses = hd.search(key, price1, price2, cid);
            }

            //phan trang
            int size = houses.size();
            int page, numperpage = 6;
            int numPage = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
            String xPage = request.getParameter("page");
          try {
    if (xPage == null || xPage.isEmpty()) {
        page = 1;
    } else {
        page = Integer.parseInt(xPage);

        // Ensure page is within valid range
        if (page < 1) {
            page = 1;
        } else if (page > numPage) {
            page = numPage;
        }
    }
} catch (NumberFormatException e) {
    // Handle the case where the page parameter is not a valid integer
    page = 1;
}
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);

            List<House> listPaged = hd.getListByPage(houses, start, end);

            //
            request.setAttribute("page", page);

            request.setAttribute("num", numPage);
            request.setAttribute("cid", cid);
            if (listPaged.isEmpty()) {
                request.setAttribute("noresult", "No Result");
            }
            request.setAttribute("houseList", listPaged);

        } catch (NumberFormatException e) {
        }
        request.getRequestDispatcher("index2.jsp").forward(request, response);
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
        List<House> list;
        list = hd.getHouses();
        System.out.println(list.get(0).getCity());
    }
}
