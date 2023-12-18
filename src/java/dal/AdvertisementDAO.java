/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Advertisement;
import model.Image;

/**
 *
 * @author DELL i7
 */
public class AdvertisementDAO extends DBContext {

    public ArrayList<Advertisement> listAds() {
        ArrayList<Advertisement> list = new ArrayList<>();
        String sql = "select * from Advertisement";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Advertisement(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getDate(5), rs.getInt(6)));
            }

        } catch (SQLException e) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void createAds(int houseId, double adsFee, Date startDate, Date endDate, int status) {
        String sql = "INSERT INTO [dbo].[Advertisement]\n"
                + "           ([HouseID]\n"
                + "           ,[AdsFee]\n"
                + "           ,[StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[Status])\n"
                + "     VALUES( ?,"
                + "             ?,"
                + "             ?,"
                + "             ?,"
                + "             ?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, houseId);
            st.setDouble(2, adsFee);
            st.setDate(3, startDate);
            st.setDate(4, endDate);
            st.setInt(5, status);
            st.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateAds(int adsId, int houseId, double adsFee, Date startDate, Date endDate) {
        String sql = "UPDATE [dbo].[Advertisement] SET HouseID = ?, AdsFee = ?, StartDate = ?, EndDate = ? WHERE AdsID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, houseId);
            st.setDouble(2, adsFee);
            st.setDate(3, startDate);
            st.setDate(4, endDate);
            st.setInt(5, adsId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Date convert(String date) {
        Date d = Date.valueOf(date);
        return d;
    }

    public Advertisement getAdsByAdsId(int adsId) {
        String sql = "select * from [dbo].[Advertisement] where AdsID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, adsId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Advertisement(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getDate(5), rs.getInt(6));
            }

        } catch (SQLException e) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public List<Advertisement> getAdsByLandlordId(int landlordId) {
        String sql = " SELECT * FROM Advertisement\n"
                + "    WHERE EndDate > CURRENT_TIMESTAMP AND HouseID IN (\n"
                + "        SELECT HouseID FROM House\n"
                + "        WHERE AccountID = ?\n"
                + "    )\n"
                + "    ORDER BY StartDate DESC";
        List<Advertisement> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, landlordId);
            ResultSet rs = st.executeQuery();
         while (rs.next()) {
                list.add(new Advertisement(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getDate(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public int calcProfitByTime(int month, int year) {
        String sql = "select SUM(AdsFee) from Advertisement\n"
                + "where YEAR(StartDate) = ?\n"
                + "and MONTH(StartDate) = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, year);
            st.setInt(2, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return 0;
    }

    public ArrayList<Advertisement> getSortedAds(String sort) {
        ArrayList<Advertisement> list = new ArrayList<>();
        String sql = "select * from Advertisement where EndDate > CURRENT_TIMESTAMP";
        if (sort.equals("ASC")) {
            sql += " order by EndDate ASC";
        }
        if (sort.equals("DESC")) {
            sql += " order by StartDate DESC";
        }
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Advertisement(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getDate(5), rs.getInt(6)));
            }

        } catch (SQLException e) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void changeStatus(int adsId, int status) {
        String sql = "UPDATE [dbo].[Advertisement] SET Status = ? WHERE AdsID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, status);
            st.setInt(2, adsId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Advertisement> getAdsByStatus(int status) {
        ArrayList<Advertisement> list = new ArrayList<>();
        String sql = "select * from Advertisement where Status = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Advertisement(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDate(4), rs.getDate(5), rs.getInt(6)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean checkDuplicateByHouseID(int houseID) {
        String sql = "select * from [dbo].[Advertisement] where houseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st = connection.prepareStatement(sql);
            st.setInt(1, houseID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<Image> getImageByHouseID() {
        ArrayList<Image> list = new ArrayList<>();
        String sql = "select i.ImageID, i.HouseID, i.ImageName, i.ImagePath from Image i\n"
                + "join Advertisement a\n"
                + "on i.HouseID = a.HouseID\n"
                + "where a.Status = 1\n"
                + "group by i.ImageID, i.HouseID, i.ImageName, i.ImagePath";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Image(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        AdvertisementDAO ad = new AdvertisementDAO();
        List<Advertisement> l = ad.getAdsByLandlordId(6);
        for (Advertisement advertisement : l) {
            System.out.println(advertisement.toString());
        }
    }
}
