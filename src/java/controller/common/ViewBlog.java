/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ViewBlog", urlPatterns = {"/ViewBlog"})
public class ViewBlog extends HttpServlet {

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
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> BL = blogDAO.getAllBlogbyStatusTrue();
        int numPs = BL.size();
        int numperPage = 6;
        int numpage = numPs / numperPage + (numPs % numperPage == 0 ? 0 : 1);
        int start, end;
        String tpage = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(tpage);
        } catch (NumberFormatException e) {
            page = 1;
        }
        start = (page - 1) * numperPage;
        if (page * numperPage > numPs) {
            end = numPs;
        } else {
            end = page * numperPage;
        }
        List<Blog> arr = blogDAO.getListByPage(BL, start, end);
        request.setAttribute("dataBL", arr);
        request.setAttribute("num", numpage);
        String service = request.getParameter("go");
        List<Blog> top3 = blogDAO.getTop3Blog();
        request.setAttribute("top3", top3);
        if (service == null) {
            service = "show";
        }
        if (service.equals("show")) {
            request.getRequestDispatcher("ViewBlog.jsp").forward(request, response);
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
