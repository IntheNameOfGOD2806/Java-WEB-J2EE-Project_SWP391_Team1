package controller.common;

import dal.AccountDAO;
import dal.ProfileDAO;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/forgotPassword"})
public class ForgotPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        ProfileDAO profileDAO = new ProfileDAO();
        boolean profile = profileDAO.checkEmail(email);
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmailProfile(email);
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        String submit = request.getParameter("submit");
        if (submit == null) {
            response.sendRedirect("forgotPassword.jsp");
        } else {
            if (profile == false) {
                String noemail = "Email not exist";
                request.setAttribute("noemail", noemail);
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            } else {
                mySession.setAttribute("Email", email);
                if (email != null || !email.equals("")) {
                    // sending otp
                    Random rand = new Random();
                    otpvalue = rand.nextInt(1255650);

                    String to = email;// change accordingly
                    // Get the session object
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.port", "465");
                    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("houserentfpt@gmail.com", "vkej qayj avae llxf");// Put your email
                            // id and
                            // password here
                        }
                    });
                    // compose message
                    try {
                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress(email));// change accordingly
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Hello");
                        message.setText("Your UserName is: " + account.getUserName() + "\nYour OTP is: " + otpvalue);
                        // send message
                        Transport.send(message);
                        System.out.println("message sent successfully");
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                    dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
                    request.setAttribute("message", "OTP is sent to your email id");
                    //request.setAttribute("connection", con);
                    mySession.setAttribute("otp", otpvalue);
                    mySession.setAttribute("email", email);
                    mySession.setAttribute("otpAction", "new password");
                    dispatcher.forward(request, response);
                    //request.setAttribute("status", "success");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

}
