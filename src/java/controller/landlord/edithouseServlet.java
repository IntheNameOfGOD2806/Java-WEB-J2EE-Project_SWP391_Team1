/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.landlord;

import controller.*;
import dal.HouseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import model.House;

/**
 *
 * @author Admin
 */
@MultipartConfig

@WebServlet(name = "edithouseServlet", urlPatterns = {"/edithouse"})
public class edithouseServlet extends HttpServlet {

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
            out.println("<title>Servlet edithouseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet edithouseServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String houseid_raw = request.getParameter("houseid");
        try {
            int houseid = Integer.parseInt(houseid_raw);
            HouseDAO hd = new HouseDAO();
            House house = hd.getHouseByHouseId(houseid);
            request.setAttribute("house", house);
            request.getRequestDispatcher("landlord/edithouse.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            e.printStackTrace();
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
        PrintWriter out = response.getWriter();
        out.println("sadadadada");

        HttpSession ss = request.getSession();
//
        String houseid_raw = request.getParameter("houseid");

        String city = request.getParameter("city");
        out.println(city);

        String houseName = request.getParameter("housename");
        out.println(houseName);

        String description = request.getParameter("description");
        out.println(description);

        String roomNumbers_raw = request.getParameter("roomnumbers");

        String address = request.getParameter("address");
        out.println(address);

        String category_raw = request.getParameter("category");
        out.println(category_raw);

        String electricFee_raw = request.getParameter("electricfee");
        out.println(electricFee_raw);

        String waterFee_raw = request.getParameter("waterfee");
        out.println(waterFee_raw);

//
        int accountid = (Integer) ss.getAttribute("accountid");
        out.println(accountid);

        String ststus_raw = request.getParameter("status");
        out.println(ststus_raw);
//

        //
        String img1 = getFile("file1", request);
        String img2 = getFile("file2", request);
        String img3 = getFile("file3", request);
        String img4 = getFile("file4", request);
//
        try {
            int houseid = Integer.parseInt(houseid_raw);

            int roomNumbers = Integer.parseInt(roomNumbers_raw);
            int category = Integer.parseInt(category_raw);
            double electricFee = Double.parseDouble(electricFee_raw);

            double waterFee = Double.parseDouble(waterFee_raw);
            int status = Integer.parseInt(ststus_raw);

//            out.println(city);
//            out.println(houseName);
//            out.println(description);
//            out.println(address);
//            out.println(accountid);
//            out.println(houseid);
//            out.println(roomNumbers);
//            out.println(category);
//            out.println(electricFee);
//            out.println(waterFee);
//            out.println(status);
            HouseDAO hd = new HouseDAO();
            hd.edithouse(houseid, accountid, houseName, address, category, description, roomNumbers, city, electricFee, waterFee, status);
            String[] imgPathArray = new String[4];
            if (!img1.isEmpty() || !img2.isEmpty() || !img3.isEmpty() || !img4.isEmpty()) {

                imgPathArray[0] = img1;

                imgPathArray[1] = img2;
                imgPathArray[2] = img3;
                imgPathArray[3] = img4;
                hd.editImagesOfCreatedHouse(imgPathArray, houseid);
                response.sendRedirect("viewyourhouses?accountId=" + accountid);

            } else {
                               response.sendRedirect("viewyourhouses?accountId=" + accountid);

            }

           

        } catch (NumberFormatException e) {
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

}
