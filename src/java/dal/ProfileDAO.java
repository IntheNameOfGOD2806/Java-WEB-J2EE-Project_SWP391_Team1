/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Profile;

/**
 *
 * @author ASUS
 */
public class ProfileDAO extends DBContext {
    // get profile by account id

    public Profile getProfileByProfileId(int profileId) {
        String sql = "select * from  [dbo].[Profile] where profileid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, profileId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Profile(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5),
                        rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // get profile by accountid
    public int getProfileIdByAccountId(int accountId) {
        String sql = "select profileid from  [dbo].[Account] where accountid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("profileid");
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public Profile getProfileByAccountId(int accountId) {
        String sql = "  Select *\n"
                + "  From Profile p\n"
                + "  join Account a on a.ProfileID = p.ProfileID\n"
                + "  Where AccountID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("FullName");
                String Phone = rs.getString("Phone");
                Date DOB = rs.getDate("DOB");
                int Gender = rs.getInt("Gender");
                String Email = rs.getString("Email");
                String Photo = rs.getString("Photo");
                int ProfileID = rs.getInt("ProfileID");
                Profile p = new Profile(ProfileID, fullName, Phone, DOB, Gender, Email, Photo);
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public Account getAccountByAccountId(int accountId) {
        String sql = "select * from  [dbo].[Account] where accountId=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getDouble(7));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int updateProfile(Profile p) {
        int n = 0;
        String sql = "UPDATE [dbo].[Profile]\n"
                + "   SET [ProfileID] = ?\n"
                + "      ,[FullName] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[DOB] = ?\n"
                + "      ,[Gender] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Photo] = ?\n"
                + " WHERE ProfileID = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, p.getProfileID());
            pre.setString(2, p.getFullName());
            pre.setString(3, p.getPhone());
            pre.setDate(4, (Date) p.getDOB());
            pre.setInt(5, p.getGender());
            pre.setString(6, p.getEmail());
            pre.setString(7, p.getPhoto());
            pre.setInt(8, p.getProfileID());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public boolean checkEmail(String email) {
        String sql = "select * from  [dbo].[Profile] where email = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

        } finally {

        }
        return false;
    }

    public Profile getProfilebyEmail(String email) {
        String sql = "select * from  [dbo].[Profile] where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("FullName");
                String Phone = rs.getString("Phone");
                Date DOB = rs.getDate("DOB");
                int Gender = rs.getInt("Gender");
                String Email = rs.getString("Email");
                String Photo = rs.getString("Photo");
                int ProfileID = rs.getInt("ProfileID");
                Profile p = new Profile(ProfileID, fullName, Phone, DOB, Gender, Email, Photo);
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void addProfile(int profileID, String fullName, String phone,
            Date dob, int gender, String email, String photo) {
        String sql = "INSERT INTO [dbo].[Profile]\n"
                + "           ([ProfileID]\n"
                + "           ,[FullName]\n"
                + "           ,[Phone]\n"
                + "           ,[DOB]\n"
                + "           ,[Gender]\n"
                + "           ,[Email]\n"
                + "           ,[Photo])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, profileID);
            ps.setString(2, fullName);
            ps.setString(3, phone);
            ps.setDate(4, dob);
            ps.setInt(5, gender);
            ps.setString(6, email);
            ps.setString(7, photo);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getNewestProfileID() {
        int n = -1;
        String sql = "Select top 1 ProfileID from Profile\n"
                + "Order by ProfileID Desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return n;
    }

    public String getEmailByProfileId(int profileId) {
        String sql = "select Email from  [dbo].[Profile] where profileid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, profileId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public static void main(String[] args) {
        ProfileDAO dAO = new ProfileDAO();
        System.out.println(dAO.getProfileByAccountId(3));
        System.out.println(dAO.getAccountByAccountId(3));
    }
}
