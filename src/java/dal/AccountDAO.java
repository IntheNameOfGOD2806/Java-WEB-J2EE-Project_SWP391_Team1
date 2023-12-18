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
import md5.Encrypt;
import model.Account;
import model.Profile;

/**
 *
 * @author huyht
 */
public class AccountDAO extends DBContext {
    
    // check acc in database?
    public boolean checkAccount(String username, String password) {
        String sql = "select * from  [dbo].[Account] where username=? and password=? COLLATE Latin1_General_CS_AS";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, Encrypt.md5(password));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;
    }

    // get account info
    public Account getAccountInfo(String username, String password) {
        String sql = "select * from  [dbo].[Account] where username=? and password=? COLLATE Latin1_General_CS_AS";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, Encrypt.md5(password));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getDouble(7));
            }

        } catch (SQLException e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    // get profile by account id
    public Profile getProfileByProfileId(int profileId) {
        String sql = "select * from  [dbo].[Profile] where profileid=?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, profileId);

            ResultSet rs = st.executeQuery();

//            
            if (rs.next()) {
                return new Profile(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5),
                        rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    // get profile by accountid
    public int getProfileIdByAccountId(int accountId) {
        String sql = "select profileid from  [dbo].[Account] where accountid=?";

        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, accountId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("profileid");
            }

        } catch (SQLException e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return 0;
    }

    public List<Account> getTenantAccountByLandlordID(int landlordID) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account\n"
                + "where AccountID in \n"
                + "(select AccountID from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, landlordID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getDouble(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Profile getProfileByAccountId(int accountId) {
        String sql = "select * from  [dbo].[Profile] where profileid=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Profile(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void ChangePass(Account a) {
        String sql = "  Update Account \n"
                + "  Set Password = ?\n"
                + "  Where UserName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Encrypt.md5(a.getPassword()));
            st.setString(2, a.getUserName());
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountByEmailProfile(String Email) {
        String sql = "  Select [AccountID]\n"
                + "      ,[UserName]\n"
                + "      ,[Password]\n"
                + "      ,[RoleID]\n"
                + "      ,a.[ProfileID]\n"
                + "      ,[Status]\n"
                + "      ,[Balance]\n"
                + "	  From Account a \n"
                + "	  join Profile p on a.ProfileID=p.ProfileID \n"
                + "	  where Email = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Email);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt("AccountID"), rs.getString("UserName"), rs.getString("Password"),
                        rs.getInt("RoleID"), rs.getInt("ProfileID"), rs.getInt("Status"), rs.getDouble("Balance"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getDouble(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account getAccountByAccountId(int accountId) {
        String sql = "select * from Account where AccountID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getInt(6), rs.getDouble(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateBalance(Account a) {
        String sql = "  Update Account \n"
                + "  Set Balance = ?\n"
                + "  Where AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, a.getBalance());
            st.setInt(2, a.getAccountId());
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateBalance(int accID, double balance) {
        String sql = "  Update Account \n"
                + "  Set Balance = ?\n"
                + "  Where AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, balance);
            st.setInt(2, accID);
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getRoleByAccountID(int accountid) {
        String sql = "  Select RoleID\n"
                + "  From Account\n"
                + "  Where AccountID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountid);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void addAccount(String userName, String password, int roleID,
            int profileID, int status, double balance) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([UserName]\n"
                + "           ,[Password]\n"
                + "           ,[RoleID]\n"
                + "           ,[ProfileID]\n"
                + "           ,[Status]\n"
                + "           ,[Balance])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, Encrypt.md5(password));
            ps.setInt(3, roleID);
            ps.setInt(4, profileID);
            ps.setInt(5, status);
            ps.setDouble(6, balance);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        Profile p = a.getProfileByProfileId(1);
        System.out.println(p.getPhoto());
    }

}
