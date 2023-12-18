/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Constract;

/**
 *
 * @author adm
 */
public class ConstractDAO extends DBContext {

    public Constract getConstractByConstractId(int constractID) {
        String sql = "select * from Constract where ConstractID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, constractID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6));
            }
        } catch (SQLException e) {

            e.printStackTrace();

        }
        return null;
    }

    public List<Constract> getConstractByAccountId(int accountID) {
        List<Constract> list = new ArrayList<>();
        String sql = "select * from Constract where AccountID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            st.close();
            if (rs.next()) {
                list.add(new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Constract> getConstractByRoomId(int roomID) {
        List<Constract> list = new ArrayList<>();
        String sql = "select * from Constract where RoomID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, roomID);
            ResultSet rs = st.executeQuery();
            st.close();
            if (rs.next()) {
                list.add(new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Constract> getConstractByStartDate(String startDate) {
        List<Constract> list = new ArrayList<>();
        String sql = "select * from Constract where StartDate like '?'";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, startDate);
            ResultSet rs = st.executeQuery();
            st.close();
            if (rs.next()) {
                list.add(new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Constract> getAllConstract() {
        List<Constract> list = new ArrayList<>();
        String sql = "select * from Constract ";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            st.close();

            while (rs.next()) {
                list.add(new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public int deActiveConstract(int constractID) {
        // Tạo định dạng cho giờ, phút và giây
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

        // Lấy ngày hiện tại
        java.util.Date currentDate = new java.util.Date();
        // Sử dụng định dạng để hiển thị giờ, phút và giây
        String formattedTime = timeFormat.format(currentDate);
        // Chuyển đổi thành java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        String sql = "UPDATE [dbo].[Constract]\n"
                + "   SET \n"
                + "      [EndDate] = GETDATE()\n"
                + "      ,[Status] = ?\n"
                + " WHERE ConstractID=?";
        int a = 0;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setDate(1, sqlDate);
            st.setInt(1, 0);
            st.setInt(2, constractID);

            a = st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return a;
    }
//reactive contract
      public int reActiveConstract(int constractID) {
        // Tạo định dạng cho giờ, phút và giây
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

        // Lấy ngày hiện tại
        java.util.Date currentDate = new java.util.Date();
        // Sử dụng định dạng để hiển thị giờ, phút và giây
        String formattedTime = timeFormat.format(currentDate);
        // Chuyển đổi thành java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        String sql = "UPDATE [dbo].[Constract]\n"
                + "   SET \n"
                + "      [EndDate] = GETDATE()\n"
                + "      ,[Status] = ?\n"
                + " WHERE ConstractID=?";
        int a = 0;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setDate(1, sqlDate);
            st.setInt(1, 1);
            st.setInt(2, constractID);

            a = st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return a;
    }
    public static void main(String[] args) {
        ConstractDAO cd = new ConstractDAO();
        cd.deActiveConstract(1012);

    }

    public int deleteConstract(int constractID) {
        String sql = "delete from Constract where ConstractID = ?";
        int a = 0;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, constractID);
            a = st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return a;
    }

    public void addConstract(int accountID, int roomID, String startDate,
            String endDate, boolean status) {
        String sql = "INSERT INTO [dbo].[Constract]\n"
                + "           ([AccountID]\n"
                + "           ,[RoomID]\n"
                + "           ,[StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[Status])\n"
                + "     VALUES (?,?,?,?,?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountID);
            st.setInt(2, roomID);
            st.setString(3, startDate);
            st.setString(4, endDate);
            st.setBoolean(5, status);
            st.executeUpdate();
            st.close();

        } catch (SQLException e) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Constract> getContractByLandlordID(int LandlordID, String sort) {
        List<Constract> list = new ArrayList<>();
        String sql = "select * from Constract\n"
                + "where RoomID in\n"
                + "(select RoomID from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?))\n";
        if (sort.equals("ASC")) {
            sql += "and (EndDate > CURRENT_TIMESTAMP)  order by EndDate ASC";
        }
        if (sort.equals("DESC")) {
            sql += "and CURRENT_TIMESTAMP between StartDate and EndDate or EndDate is null order by StartDate DESC";
        }
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, LandlordID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int calcProfitByTime(int landlordId, int month, int year) {
        String sql = "select SUM(Price) from Room\n"
                + "where RoomID in\n"
                + "(select RoomID from Constract\n"
                + "where RoomID in\n"
                + "(select RoomID from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?))\n"
                + "and YEAR(StartDate) <= ?\n"
                + "and MONTH(StartDate) <= ?\n"
                + "and ((YEAR(EndDate) >= ?\n"
                + "and MONTH(EndDate) >= ?) or EndDate is null))";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, landlordId);
            st.setInt(2, year);
            st.setInt(3, month);
            st.setInt(4, year);
            st.setInt(5, month);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConstractDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Constract> getConstractByLandlordID(int landlordID) {
        List<Constract> list = new ArrayList<>();
        String sql = "select * from Constract\n"
                + "where RoomID in\n"
                + "(select RoomID from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?)) ORDER BY StartDate DESC";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, landlordID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Constract(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //update tenantid to room table
    public int updateTenantId(int tenantid, int roomid) {
        int a = 0;
        String sql
                = "UPDATE [dbo].[Room]\n"
                + "      SET [AccountID] = ?"
                + " WHERE roomid=?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, tenantid);
            st.setInt(2, roomid);
            a = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    //erase tenant info in room table
    public int eraseTenantId(int roomid) {
        int a = 0;
        String sql
                = "UPDATE [dbo].[Room]\n"
                + "      SET [AccountID] = null"
                + " WHERE roomid=?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, roomid);
            a = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
        public int getRoomIdByConstractId(int constractID) {
        String sql = "select Constract.RoomID from Constract where ConstractID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, constractID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public List<Constract> getConstractByPage(List<Constract> list,
            int start, int end) {
        ArrayList<Constract> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    
    
    public int getAccountIdByContractId(int contractID) {
        List<Constract> list = new ArrayList<>();
        String sql = "select Constract.AccountID from Constract where ConstractID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, contractID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }
    /*
    public static void main(String[] args) {
        List<Constract> list = new ArrayList<>();
        ConstractDAO condao = new ConstractDAO();
        System.out.println("Before add");
        list = condao.getAllConstract();
        for (Constract constract : list) {
            System.out.println(constract.toString());
        }
        condao.addConstract(3, 7, "2023-10-01", "2023-11-01", true);
        System.out.println("After add");
        list = condao.getAllConstract();
        for (Constract constract : list) {
            System.out.println(constract.toString());
        }
    }*/
}
