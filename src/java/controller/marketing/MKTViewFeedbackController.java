/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.FeedbackDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

/**
 *
 * @author huyht
 */
public class MKTViewFeedbackController extends HttpServlet {

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
            String service = request.getParameter("go");
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            if (service == null) {
                service = "display-all";
            }
            if (service.equals("display-all")) {
                ArrayList<Feedback> allFeedbackList = feedbackDAO.getAll();
                int numOfFeedback = allFeedbackList.size();
                int numPerPage = 3;
                int numOfPage = numOfFeedback / numPerPage + (numOfFeedback % numPerPage == 0 ? 0 : 1);
                int start, end;
                String tpage = request.getParameter("page");
                int page;
                try {
                    page = Integer.parseInt(tpage);
                } catch (NumberFormatException e) {
                    page = 1;
                }
                request.setAttribute("pageDiff", page);
                start = (page - 1) * numPerPage;
                if (page*numPerPage>numOfFeedback) {
                    end = numOfFeedback;
                } else{
                    end = page * numPerPage;
                }
                List<Feedback> listPage = feedbackDAO.getFeedbackByList(allFeedbackList, start, end);
                // so feedback tren 1 trang
                request.setAttribute("feedbackList", listPage);
                // so trang
                request.setAttribute("numOfPage", numOfPage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("marketing/MKTViewFeedback.jsp");
                dispatcher.forward(request, response);
            }
            if (service.equals("sort")) {
                String sortType = (String) request.getParameter("type");
                request.setAttribute("sortDiff", sortType);
                ArrayList<Feedback> sortedFeedbackList = feedbackDAO.getSortedFeedbacks(sortType);
                int numOfFeedback = sortedFeedbackList.size();
                int numPerPage = 3;
                int numOfPage = numOfFeedback / numPerPage + (numOfFeedback % numPerPage == 0 ? 0 : 1);
                int start, end;
                String tpage = request.getParameter("page");
                int page;
                try {
                    page = Integer.parseInt(tpage);
                } catch (NumberFormatException e) {
                    page = 1;
                }
                request.setAttribute("pageDiff", page);
                start = (page - 1) * numPerPage;
                if (page*numPerPage>numOfFeedback) {
                    end = numOfFeedback;
                } else{
                    end = page * numPerPage;
                }
                List<Feedback> listPage = feedbackDAO.getFeedbackByList(sortedFeedbackList, start, end);
                // so feedback tren 1 trang
                request.setAttribute("feedbackList", listPage);
                // so trang
                request.setAttribute("numOfPage", numOfPage);
                request.setAttribute("feedbackList", listPage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("marketing/MKTViewFeedback.jsp");
                dispatcher.forward(request, response);
            }
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
