/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Request;

/**
 *
 * @author dang9
 */
public class RequestDAO extends DBContext {

    public List<Request> getRequestByLandlordID(int landlordID, String sort) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request\n"
                + "where RoomID in\n"
                + "(select RoomID from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?))";
        if (sort.equals("ASC")) {
            sql += " order by RequestDate ASC";
        }
        if (sort.equals("DESC")) {
            sql += " order by RequestDate DESC";
        }
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, landlordID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Request> getRequestByTenantID(int tenantID) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request\n"
                + "where AccountID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, tenantID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Request getRequestByRequestID(int requestID) {
        Request request = null;
        String sql = "select * from Request\n"
                + "where RequestID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, requestID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                request = new Request(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return request;
    }

    public int deleteRequest(int requestID) {
        int a = 0;
        String sql = "DELETE FROM [dbo].[Request]\n"
                + "      WHERE RequestID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, requestID);
            a = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public int createRequest(Request request) {
        int a = 0;
        String sql = "INSERT INTO [dbo].[Request]\n"
                + "           ([AccountID]\n"
                + "           ,[RoomID]\n"
                + "           ,[RequestDate])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, request.getAccountID());
            st.setInt(2, request.getRoomID());
            st.setDate(3, request.getRequestDate());
            a = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public Request getRequestByRequestId(int requestID) {
        String sql = "select * from Request where RequestID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Request> getRequestByAccountId(int accountID) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request where AccountID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                list.add(new Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Request> getRequestByRoomId(int roomID) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request where RoomID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roomID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                list.add(new Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Request> getRequestByRequestDate(String requestDate) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request where RequestDate like '?'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, requestDate);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                list.add(new Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addRequest(int accountID, int roomID, String requestDate) {
        String sql = "INSERT INTO [dbo].[Request]\n"
                + "           ([AccountID]\n"
                + "           ,[RoomID]\n"
                + "           ,[RequestDate])\n"
                + "     VALUES (?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setInt(2, roomID);
            ps.setString(3, requestDate);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getLatestRequestId() {
        String sql = "select top 1 RequestID from Request order by RequestID desc ";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("requestID");
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public List<Request> getAllRequest() {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getAccountIdByRequestId(int requestID) {
        List<Request> list = new ArrayList<>();
        String sql = "select Request.AccountID from Request where RequestID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public int getRoomIdByRequestId(int requestID) {
        List<Request> list = new ArrayList<>();
        String sql = "select Request.RoomID from Request where RequestID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }
    
    public int createRequest(int accountid,int roomid,java.sql.Date requesDate) {
        int a = 0;
        String sql = "INSERT INTO [dbo].[Request]\n"
                + "           ([AccountID]\n"
                + "           ,[RoomID]\n"
                + "           ,[RequestDate])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1,accountid );
            st.setInt(2,roomid );
            st.setDate(3, requesDate);
            a = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public void sendMail(String email, String title, String messageInfo) {
        if (email != null && !email.equals("")) {

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
            try { //send mail 
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));// change accordingly
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(title);
                message.setText(messageInfo);

                // send message
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

        }
    }
}
