/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import dal.HouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.List;
import model.HouseCategory;

/**
 *
 * @author trant
 */
@WebServlet(name = "createhouseTestServlet", urlPatterns = {"/createhousetest"})
@MultipartConfig

public class createhouseTest extends HttpServlet {

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
            String[] photoLinks = request.getParameterValues("link[]");
            out.print(photoLinks[1]);
            out.print("sdadadad");
        }
    }

    String getFile(String name, HttpServletRequest req) throws IOException, ServletException {
        String filePath = "C:\\Users\\huyht\\OneDrive\\Desktop\\test-merge\\house-rental-management-system\\web\\images\\";
        Part filePart = req.getPart(name);
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (fileName == null || fileName.length() == 0) {
            return "";
        }
        try ( InputStream fileContent = filePart.getInputStream()) {
            File f = new File(filePath + fileName);
            try ( OutputStream os = new FileOutputStream(f)) {
                byte[] buf = new byte[1024];
                int len;
                while ((len = fileContent.read(buf)) > 0) {
                    os.write(buf, 0, len);
                }
            }
        }

        return "images/" + fileName;
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
       
//        String accountid_raw = request.getParameter("accountid");
        try {
             HouseDAO hd = new HouseDAO();
         List<HouseCategory> list2 = hd.getListCategory();
        request.setAttribute("datacate", list2);
            PrintWriter out = response.getWriter();
//            int accountid = Integer.parseInt(accountid_raw);
//            request.setAttribute("accountid", accountid);
//            HttpSession ss= request.getSession();
//            out.print(ss.getAttribute("accountid"));
            request.getRequestDispatcher("landlord/simpleCreateHouse.jsp").forward(request, response);
        } catch (IOException | NumberFormatException e) {

        }

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
//        processRequest(request, response);
//        HttpSession ss = request.getSession();
//        int accountid;
        PrintWriter out = response.getWriter();
        String accountid_raw = request.getParameter("accountid");
//        
        String city = request.getParameter("city");
        String houseName = request.getParameter("housename");
        String description = request.getParameter("description");
        String roomNumbers_raw = request.getParameter("roomnumbers");
        String address = request.getParameter("address");
        String category_raw = request.getParameter("category");
        String electricFee_raw = request.getParameter("electricfee");
        String waterFee_raw = request.getParameter("waterfee");
        

        String ststus_raw = request.getParameter("status");
        String img1 = getFile("file1", request);
        String img2 = getFile("file2", request);
        String img3 = getFile("file3", request);
        String img4 = getFile("file4", request);

        try {
            int accountid = Integer.parseInt(accountid_raw);
            int roomNumbers = Integer.parseInt(roomNumbers_raw);
            int category = Integer.parseInt(category_raw);
            int electricFee = Integer.parseInt(electricFee_raw);
            

            int waterFee = Integer.parseInt(waterFee_raw);
            int status = Integer.parseInt(ststus_raw);
            HouseDAO hd = new HouseDAO();
            hd.createHouse(accountid, houseName, address, category, description, roomNumbers, city, electricFee, waterFee, status);
            String[] imgPathArray = new String[4];
            if (img1 != null || img2 != null || img3 != null || img4 != null) {

                imgPathArray[0] = img1;

                imgPathArray[1] = img2;
                imgPathArray[2] = img3;
                imgPathArray[3] = img4;
               hd.insertImagesOfCreatedHouse(imgPathArray);
                                          response.sendRedirect("viewyourhouses?accountId="+accountid);


            } else {
                response.sendRedirect("home");
            }
           
//            hd.insertImagesOfCreatedHouse(imgPathArray);
//            response.sendRedirect("home");
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
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

    public static void main(String[] args) {

    }
}
