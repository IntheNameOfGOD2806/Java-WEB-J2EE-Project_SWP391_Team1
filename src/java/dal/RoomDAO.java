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
import model.Room;

/**
 *
 * @author dang9
 */
public class RoomDAO extends DBContext {

    public Room getRoomByRoomId(int roomId) {
        String sql = "select * from Room where RoomID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Room> getRoomByHouseId(int houseId) {
        List<Room> list = new ArrayList<>();
        String sql = "select * from Room where HouseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int addRoom(Room room) {
        int a = 0;
        String sql = "INSERT INTO [dbo].[Room]\n"
                + "           ([HouseID]\n"
                + "           ,[AccountID]\n"
                + "           ,[Price]\n"
                + "           ,[Description]\n"
                + "           ,[Area]\n"
                + "           ,[Status])\n"
                + "     VALUES  (?,?,?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, room.getHouseID());
            st.setInt(2, room.getAccountID());
            st.setDouble(3, room.getPrice());
            st.setString(4, room.getDescription());
            st.setInt(5, room.getArea());
            st.setInt(6, room.getStatus().equals("Active") ? 1 : 0);
            a = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public int updateRoom(Room room) {
        int a = 0;
        String sql = "UPDATE [dbo].[Room]\n"
                + "   SET [HouseID] = ?\n"
                + "      ,[AccountID] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Area] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE [RoomID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, room.getHouseID());
            st.setInt(2, room.getAccountID());
            st.setDouble(3, room.getPrice());
            st.setString(4, room.getDescription());
            st.setInt(5, room.getArea());
            st.setInt(6, room.getStatus().equals("Active") ? 1 : 0);
            st.setInt(7, room.getRoomID());
            a = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public int deleteRoom(int roomID) {
        int a = 0;
        String sql = "DELETE FROM [dbo].[Room]\n"
                + "      WHERE [RoomID] = ?\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomID);
            a = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public List<Room> getRoomByPrice(int min, int max) {
        List<Room> list = new ArrayList<>();
        String sql = "select * from Room\n"
                + "Where Price between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, min);
            st.setInt(2, max);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomByArea(int min, int max) {
        List<Room> list = new ArrayList<>();
        String sql = "select * from Room\n"
                + "Where Area between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, min);
            st.setInt(2, max);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Room> getRoomByLandlordID(int landlordID) {
        List<Room> list = new ArrayList<>();
        String sql = "select * from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, landlordID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Room> getRoomByStatusAndLandlordID(int landlordID, int status) {
        List<Room> list = new ArrayList<>();
        String sql = "select * from Room\n"
                + "where houseID in \n"
                + "(select HouseID from House\n"
                + "where AccountID = ?) and status = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, landlordID);
            st.setInt(2, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Room> getAllRooms() {
        List<Room> list = new ArrayList<>();
        String sql = "select * from Room";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
