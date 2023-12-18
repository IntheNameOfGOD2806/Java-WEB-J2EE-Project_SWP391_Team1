/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import dal.FeedbackDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

/**
 *
 * @author huyht
 */
public class FeedbackController extends HttpServlet {

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
            HttpSession session = request.getSession();
            int accountId = (int) session.getAttribute("accountid");
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            if (service == null) {
                service = "display-all";
            }
            if (service.equals("display-all")) {
                ArrayList<Feedback> allFeedbackList = feedbackDAO.getLandlordFeedbackByAccountId(accountId);
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
                if (page * numPerPage > numOfFeedback) {
                    end = numOfFeedback;
                } else {
                    end = page * numPerPage;
                }
                List<Feedback> listPage = feedbackDAO.getFeedbackByList(allFeedbackList, start, end);
                // so feedback tren 1 trang
                request.setAttribute("feedbackList", listPage);
                // so trang
                request.setAttribute("numOfPage", numOfPage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("landlord/ViewFeedback.jsp");
                dispatcher.forward(request, response);
            }
            if (service.equals("sort")) {
                String sortType = request.getParameter("type");
                request.setAttribute("sortDiff", sortType);
                ArrayList<Feedback> sortedFeedbackList = feedbackDAO.getSortedFeedbacks(sortType, accountId);
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
                if (page * numPerPage > numOfFeedback) {
                    end = numOfFeedback;
                } else {
                    end = page * numPerPage;
                }
                List<Feedback> listPage = feedbackDAO.getFeedbackByList(sortedFeedbackList, start, end);
                // so feedback tren 1 trang
                request.setAttribute("feedbackList", listPage);
                // so trang
                request.setAttribute("numOfPage", numOfPage);
                request.setAttribute("feedbackList", listPage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("landlord/ViewFeedback.jsp");
                dispatcher.forward(request, response);
            }
            if (service.equals("reply")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
                    Feedback feedback = feedbackDAO.getFeedbackById(feedbackId);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("landlord/ReplyFeedback.jsp");
                    request.setAttribute("feedback", feedback);
                    dispatcher.forward(request, response);

                } else {
                    String replyContent = null;
                    int feedbackId = Integer.parseInt(request.getParameter("fId"));
                    int houseId = Integer.parseInt(request.getParameter("hId"));
                    try {
                        replyContent = request.getParameter("reply_feedback").trim();
                    } catch (Exception e) {
                        System.out.println("loi reply content");
                        System.out.println(replyContent);
                    }
                    feedbackDAO.addReplyFeedback(accountId, houseId, replyContent, feedbackId);
                    response.sendRedirect("landlord-feedback?go=sort&type=latest");
                }
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
