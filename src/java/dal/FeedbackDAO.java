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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.Profile;

/**
 *
 * @author huyht
 */
public class FeedbackDAO extends DBContext {

    public ArrayList<Feedback> getAll() {
        String sql = "SELECT * FROM [House Feedback] ORDER BY CreateDate DESC";
        ArrayList<Feedback> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
                list.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //pagination
    public List<Feedback> getFeedbackByList(ArrayList<Feedback> list, int start, int end) {
        List<Feedback> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Feedback getFeedbackById(int feedbackd) {
        String sql = "SELECT * FROM [House Feedback] hf WHERE hf.FeedbackID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, feedbackd);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Feedback feedback = new Feedback(feedbackd, rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
                return feedback;

            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Feedback> getLandlordFeedbackByAccountId(int accountId) {
        String sql = "SELECT hf.FeedbackID, hf.AccountID, hf.HouseID, hf.Description, hf.CreateDate, hf.ParentID, hf.Status from [House Feedback] hf \n"
                + "JOIN House h ON hf.HouseID = h.HouseID\n"
                + "JOIN Account a ON h.AccountID = a.AccountID\n"
                + "WHERE h.AccountID = ? ORDER BY CreateDate DESC";
        ArrayList<Feedback> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
                list.add(feedback);

            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Feedback> getSortedFeedbacks(String sortType) {
        String sql = "SELECT * FROM [House Feedback] hf";
        if (sortType.equals("latest")) {
            sql += "  ORDER BY hf.CreateDate DESC";
        }
        if (sortType.equals("oldest")) {
            sql += "  ORDER BY hf.CreateDate ASC";
        }
        if (sortType.equals("showing")) {
            sql += " WHERE hf.Status = 1";
        }
        if (sortType.equals("hidden")) {
            sql += " WHERE hf.Status = 0";
        }

        ArrayList<Feedback> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
                list.add(feedback);

            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Feedback> getSortedFeedbacks(String sortType, int accountId) {
        String sql = "SELECT hf.FeedbackID, hf.AccountID, hf.HouseID, hf.Description, hf.CreateDate, hf.ParentID, hf.Status from [House Feedback] hf \n"
                + "JOIN House h ON hf.HouseID = h.HouseID\n"
                + "JOIN Account a ON h.AccountID = a.AccountID\n"
                + "WHERE h.AccountID = ?";
        if (sortType.equals("latest")) {
            sql += "  ORDER BY hf.CreateDate DESC";
        }
        if (sortType.equals("oldest")) {
            sql += "  ORDER BY hf.CreateDate ASC";
        }
        if (sortType.equals("showing")) {
            sql += " and hf.Status = 1";
        }
        if (sortType.equals("hidden")) {
            sql += " and hf.Status = 0";
        }

        ArrayList<Feedback> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
                list.add(feedback);

            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Profile getProfileByAccountId(int accountId) {
        String sql = "SELECT p.ProfileID, p.FullName, p.Phone, p.DOB, p.Gender, p.Email, p.Photo \n"
                + "FROM Profile p JOIN Account a ON p.ProfileID = a.ProfileID\n"
                + "WHERE  a.AccountID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Profile profile = new Profile(accountId, rs.getNString(2), rs.getNString(3), rs.getDate(4), rs.getInt(5), rs.getNString(6), rs.getNString(7));
                return profile;

            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int updateFeedbackStatus(int feedbackId, String status) {
        int n = 0;
        String sql = "UPDATE dbo.[House Feedback] \n"
                + "SET\n"
                + "  Status = ? -- Status - bit NOT NULL\n"
                + "WHERE\n"
                + "  FeedbackID = ? -- FeedbackID - int NOT NULL\n"
                + ";";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            if (status.equals("show")) {
                st.setInt(1, 1);
            }
            if (status.equals("hide")) {
                st.setInt(1, 0);
            }
            st.setInt(2, feedbackId);
            n = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int addReplyFeedback(int accountId, int houseId, String description, int parentId) {
        int n = 0;
        String sql = "INSERT INTO dbo.[House Feedback]\n"
                + "(\n"
                + "  AccountID\n"
                + " ,HouseID\n"
                + " ,Description\n"
                + " ,CreateDate\n"
                + " ,ParentID\n"
                + " ,Status\n"
                + ")\n"
                + "VALUES\n"
                + "(\n"
                + "  ? -- AccountID - int NOT NULL\n"
                + " ,? -- HouseID - int NOT NULL\n"
                + " ,? -- Description - nvarchar(max)\n"
                + " ,GETDATE() -- 'YYYY-MM-DD hh:mm:ss[.nnn]'-- CreateDate - datetime\n"
                + " ,? -- ParentID - int\n"
                + " ,1 -- Status - bit NOT NULL\n"
                + ");";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            st.setInt(2, houseId);
            st.setString(3, description);
            st.setInt(4, parentId);
            n = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    /*
    public static void main(String[] args) {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ArrayList<Feedback> list = feedbackDAO.getSortedFeedbacks("latest", 3);
        for (Feedback feedback : list) {
            System.out.println(feedback);
        }
    }*/
}
