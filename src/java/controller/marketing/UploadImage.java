package controller.marketing;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import jakarta.servlet.ServletContext;
import org.json.simple.JSONObject;
import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.UUID;

/**
 *
 * @author dang9
 */
@WebServlet(urlPatterns = {"/UploadImage"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class UploadImage extends HttpServlet {

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            Part filePart = request.getPart("image");
            
            String fileName = getFileName(filePart);
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
            // Define the relative path to your image storage directory within your project
            String relativePath = "marketing/assets/images/blog"; // Adjust as needed
            // Get the real path to your project's directory
            ServletContext context = getServletContext();
            String realPath = context.getRealPath(relativePath);

            // Create the full path to the uploaded file
            String uploadPath = realPath + File.separator + uniqueFileName;
            // Save the file to the server
            try ( InputStream input = filePart.getInputStream();  OutputStream output = new FileOutputStream(uploadPath)) {
                int bytesRead;
                byte[] buffer = new byte[4096];
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
            }
            // Construct the image URL
//            String imageURL = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
//                    + "/" + relativePath + "/" + uniqueFileName;
            String imageURL = request.getContextPath()
                    + "/" + relativePath + "/" + uniqueFileName;
            // Create a JSON response
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "success");
            jsonResponse.put("url", imageURL);
            // Send the JSON response
            PrintWriter out = response.getWriter();
            out.print(jsonResponse.toJSONString());
            out.flush();
        } catch (ServletException | IOException e) {
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "error");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse.toJSONString());
            out.flush();
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
