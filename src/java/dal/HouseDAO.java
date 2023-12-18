/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static com.sun.corba.se.impl.util.Utility.printStackTrace;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.House;
import model.HouseCategory;
import model.Image;
import model.Room;

public class HouseDAO extends DBContext {

    //get similar cate house
    public List<House> getSimilarHouses(int categoryid) {
        List<House> list = new ArrayList<>();
        String sql = "select * from house where categoryid= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryid);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image image = getPreViewImageByHouseId(rs.getInt(1));

                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image));
            }
        } catch (Exception e) {
        }
        return list;
    }

    //check request duplicate
    public boolean checkDuplicateRequest(int accountid, int roomid) {
        String sql = "select * from Request where AccountID= ? and RoomID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountid);
            st.setInt(2, roomid);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    //update room status after proccessRequest
    public void updateStatusOfRoom(int statua, int roomid) {
        String sql = "UPDATE [dbo].[Room]\n" +
"   SET \n" +
"      [Status] = ?\n" +
" WHERE roomid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, statua);
            st.setInt(2, roomid);

            st.executeUpdate();

        } catch (Exception e) {
        }
    }
//get feedback for house

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
    //create feebback

    public int createFeedback(int accountId, int houseId, String description) {
        int n = 0;
        String sql = "INSERT INTO dbo.[House Feedback]\n"
                + "(\n"
                + "  AccountID\n"
                + " ,HouseID\n"
                + " ,Description\n"
                + " ,CreateDate\n"
                + " ,Status\n"
                + ")\n"
                + "VALUES\n"
                + "(\n"
                + "  ? -- AccountID - int NOT NULL\n"
                + " ,? -- HouseID - int NOT NULL\n"
                + " ,? -- Description - nvarchar(max)\n"
                + " ,GETDATE() -- 'YYYY-MM-DD hh:mm:ss[.nnn]'-- CreateDate - datetime\n"
                + " ,1 -- Status - bit NOT NULL\n"
                + ");";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            st.setInt(2, houseId);
            st.setString(3, description);

            n = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    //main

    public static void main(String[] args) {

        HouseDAO hd = new HouseDAO();
        FeedbackDAO fd = new FeedbackDAO();
        try {
            hd.updateStatusOfRoom(1, 4);
        } catch (Exception e) {
        }

    }
    //

    public ArrayList<Feedback> getDescandantFeedBacks(int feedbackid) {
        String sql = "SELECT * FROM [House Feedback] where parentid=?";
        ArrayList<Feedback> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, feedbackid);
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

//
    public ArrayList<Feedback> getFeedBacksOfHouse(int houseid) {
        String sql = "SELECT * FROM [House Feedback] where houseid=?";
        ArrayList<Feedback> list = new ArrayList<>();
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, houseid);
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

    //get house by houseId
    public House getHouseByHouseId(int houseId) {

        String sql = "select * from House where houseid=? ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Image image = getPreViewImageByHouseId(rs.getInt(1));
                return new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image);

            }

        } catch (Exception e) {
        }
        return null;
    }
//

    public int getLowestPriceByHouseId(int houseId) {
        String sql = "SELECT TOP(1) r.Price FROM Room r \n"
                + "JOIN House h ON r.HouseID = h.HouseID\n"
                + "WHERE h.HouseID = ?\n"
                + "ORDER BY r.Price ASC ";
        double priceRaw = 0;
        int price = 0;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                priceRaw = rs.getDouble(1);
            }
            price = (int) Math.round(priceRaw);

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return price;
    }

    //get room id list of house
    public List<Integer> getRoomIdListByHouseId(int houseid) {
        String sql = "select roomid from room where houseid=?";
        List<Integer> list = new ArrayList<Integer>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("roomid"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
//delete feedback
        public int deleteFeedbacksByHouseId(int houseId) {
        String sql = "  delete from [House Feedback] where HouseID =?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            a = st.executeUpdate();

        } catch (SQLException e) {
        }
        return a;

    }
    //delete house
    public int deleteHouse(int houseId) {
        //xoa feedback
        deleteFeedbacksByHouseId(houseId);
        //xoa quang cao
        deleteAdsByHouseId(houseId);
        //xoa request
        deleteRequestByHouseId(houseId);
        //xoa contract
        deleteConstractByHouseId(houseId);
        //xoa image
        deleteimagesByHouseId(houseId);
        //xoa rooms
        deleteRoomByHouseId(houseId);
        int a = 0;
        String sql = "DELETE FROM [dbo].[House]\n"
                + "      WHERE houseid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            a = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return a;
    }

    //delete room by house id
//delete advertisement by houseid
    public int deleteAdsByHouseId(int houseId) {
        String sql = "DELETE FROM [dbo].[Advertisement]\n"
                + "      WHERE HouseID=?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            a = st.executeUpdate();

        } catch (SQLException e) {
        }
        return a;

    }

    //
    public int deleteRoomByHouseId(int houseId) {
        String sql = "DELETE FROM [dbo].[Room]\n"
                + "      WHERE HouseID=?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            a = st.executeUpdate();

        } catch (SQLException e) {
        }
        return a;

    }

    public int deleteRoomByRoomId(int roomid) {
        String sql = "DELETE FROM [dbo].[Room]\n"
                + "      WHERE roomid=?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomid);
            a = st.executeUpdate();

        } catch (SQLException e) {
        }
        return a;

    }

    //update room
    public int updateRoom(int roomid, double price, String description, int area) {
        int a = 0;
        String sql = "UPDATE [dbo].[Room]\n"
                + "   SET [price] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Area] = ?\n"
               
                + " WHERE [RoomID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setDouble(1, price);
            st.setString(2, description);
            st.setInt(3, area);
            
            st.setInt(4, roomid);
            a = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    //deleteImages by houseId
    public int deleteimagesByHouseId(int houseId) {
        String sql = "delete from image where houseid=?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            a = st.executeUpdate();

        } catch (SQLException e) {
        }
        return a;

    }

    public int deleteRequestByHouseId(int houseId) {
        List<Integer> list = getRoomIdListByHouseId(houseId);

        String sql = "delete from request where roomid=?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (int i = 0; i < list.size(); i++) {
                st.setInt(1, list.get(i));
                a = st.executeUpdate();
            }

        } catch (SQLException e) {
        }
        return a;

    }

    public int deleteConstractByHouseId(int houseId) {
        List<Integer> list = getRoomIdListByHouseId(houseId);
        String sql = "delete from Constract where roomid=?";
        int a = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (int i = 0; i < list.size(); i++) {
                st.setInt(1, list.get(i));
                a = st.executeUpdate();
            }

        } catch (SQLException e) {
        }
        return a;

    }

    //hàm này bi thua nhung ngai xoa cu de vay
    public String getHouseConditionByHouseId(int houseId) {
        List<Room> list = new ArrayList<>();
        String sql = "select status from House where houseid=? ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                if (rs.getInt("status") == 1) {

                    return "For rent";
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Not for Rent";
    }

    //insert photos of house created
    public int insertImagesOfCreatedHouse(String[] images) {
        String sql = "INSERT INTO [dbo].[Image] (houseId, imageName, imagePath) VALUES (?, ?, ?)";
        int lasthouseId = getLatestHouseid();
//        int lasthouseId = 3000;

        int a = 0;
        try {
            try ( PreparedStatement st = connection.prepareStatement(sql)) {
                for (String image : images) {
                    st.setInt(1, lasthouseId);    // houseId
                    st.setString(2, "pic");           // imageName
                    st.setString(3, image); // imagePath
                    a = st.executeUpdate();

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
//get image id 

    public int[] getImageIdsByHouseId(int houseid) {
        int[] arr = new int[4];
        String sql = "select imageid from image where houseid= " + houseid + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int i = 0;
            while (rs.next()) {
                arr[i] = rs.getInt("imageid");
                i++;
            }

        } catch (Exception e) {
        }
        return arr;
    }

    public int editImagesOfCreatedHouse(String[] images, int houseid) {
        int[] arr = getImageIdsByHouseId(houseid);
        String sql = "UPDATE [dbo].[Image]\n"
                + "   SET \n"
                + "      [ImagePath] = ?\n"
                + " WHERE imageID=?";

        int a = 0;
        try {
            try ( PreparedStatement st = connection.prepareStatement(sql)) {
                int i = 0;
                for (String imagepath : images) {

                    st.setString(1, imagepath);
                    st.setInt(2, arr[i]);

                    a = st.executeUpdate();
                    i++;

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public void createHouse(int accountID, String name, String address, int categoryID,
            String description, int numberOfRoom, String city, double electricalFee,
            double waterFee, int status) {
        String sql = "INSERT INTO [dbo].[House]\n"
                + "           ([AccountID]\n"
                + "           ,[Name]\n"
                + "           ,[Address]\n"
                + "           ,[CategoryID]\n"
                + "           ,[Description]\n"
                + "           ,[NumberOfRoom]\n"
                + "           ,[City]\n"
                + "           ,[ElectricalFee]\n"
                + "           ,[WaterFee]\n"
                + "           ,[Status])\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            st.setString(2, name);
            st.setString(3, address);
            st.setInt(4, categoryID);
            st.setString(5, description);
            st.setInt(6, numberOfRoom);
            st.setString(7, city);
            st.setDouble(8, electricalFee);
            st.setDouble(9, waterFee);

            st.setInt(10, status);
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //get latest houseid
    public int getLatestHouseid() {

        String sql = "select top 1 houseid from House order by houseid desc ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getInt("houseid");
            }

        } catch (Exception e) {

        }
        return 0;
    }

    public List<House> getHouses() {
        List<House> list = new ArrayList<>();
        String sql = "select * from House ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //get the preview image
                Image image = getPreViewImageByHouseId(rs.getInt(1));
                //
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //sort
    public List<House> sortmin() {
        List<House> list = new ArrayList<>();
        String sql = "	 SELECT\n"
                + "    h.HouseID,h.AccountID,h.Name,h.Address,h.CategoryID,h.Description,h.NumberOfRoom,h.City,h.ElectricalFee,h.WaterFee,h.Status,\n"
                + "    MIN(r.Price) AS MinRoomPrice\n"
                + "FROM\n"
                + "    House AS h\n"
                + "LEFT JOIN\n"
                + "    Room AS r ON h.HouseID = r.HouseID\n"
                + "GROUP BY\n"
                + "     h.HouseID,h.AccountID,h.Name,h.Address,h.CategoryID,h.Description,h.NumberOfRoom,h.City,h.ElectricalFee,h.WaterFee,h.Status\n"
                + "ORDER BY\n"
                + "    MinRoomPrice asc;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //get the preview image
                Image image = getPreViewImageByHouseId(rs.getInt(1));
                //
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
//sort

    public List<House> sortmax() {
        List<House> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    h.HouseID, h.AccountID, h.Name, h.Address, h.CategoryID, h.Description, h.NumberOfRoom, h.City, h.ElectricalFee, h.WaterFee, h.Status,\n"
                + "    MIN(r.Price) AS MinRoomPrice\n"
                + "FROM\n"
                + "    House AS h\n"
                + "LEFT JOIN\n"
                + "    Room AS r ON h.HouseID = r.HouseID\n"
                + "GROUP BY\n"
                + "    h.HouseID, h.AccountID, h.Name, h.Address, h.CategoryID, h.Description, h.NumberOfRoom, h.City, h.ElectricalFee, h.WaterFee, h.Status\n"
                + "ORDER BY\n"
                + "    MinRoomPrice desc;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //get the preview image
                Image image = getPreViewImageByHouseId(rs.getInt(1));
                //
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //get houses by account
    public List<House> getHousesByAccountId(int accountId) {
        List<House> list = new ArrayList<>();
        String sql = "select * from House where accountid=? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                //get the preview image
                Image image = getPreViewImageByHouseId(rs.getInt(1));
                //
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image));
            }

        } catch (Exception e) {
        }
        return list;
    }

    //getprice of entire house
    public double getPriceOfHouse(int houseId) {
        String sql = "select price from Room where houseid=? ";
        double price = 0;
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                price += rs.getDouble(1);

            }
            return price;

        } catch (Exception e) {
            printStackTrace();
        }
        return 0;
    }

    //get roooms of house
    public List<Room> getRooms(int houseId) {

        List<Room> list = new ArrayList<>();
        String sql = "select * from Room where houseid=? ";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getInt(6), rs.getInt(7)));

            }

        } catch (Exception e) {
        }
        return list;

    }

    //create room for house
    public int createRoom(int houseId, int accountId, double price, String description, int area, int status) {
        int a = 0;
        String sql = "INSERT INTO [dbo].[Room]\n"
                + "           ([HouseID]\n"
                + "           ,[Price]\n"
                + "           ,[Description]\n"
                + "           ,[Area]\n"
                + "           ,[Status])\n"
                + "     VALUES  (?,?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            st.setDouble(2, price);
            st.setString(3, description);
            st.setInt(4, area);

            st.setInt(5, status);
            a = st.executeUpdate();

        } catch (Exception e) {
        }
        return a;
    }
//get all the images of a house

    public List<Image> getImageByHouseId(int houseId) {
        List<Image> list = new ArrayList<>();
        String sql = "select * from IMAGE where houseid =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Image(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    //get preview image function
    public Image getPreViewImageByHouseId(int houseId) {

        String sql = "select * from IMAGE where houseid =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Image(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
            }

        } catch (Exception e) {
        }
        return null;
    }
//get area

    public int getAreaByHouseId(int houseId) {
        String sql = "select * from Room where houseid=? ";
        //dien tich
        int sqr = 0;
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, houseId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                sqr += rs.getInt("area");

            }

        } catch (Exception e) {
        }
        return sqr;
    }

    public void edithouse(int houseid, int accountID, String name, String address, int categoryID, String description,
            int numberOfRoom, String city, double electricalFee, double waterFee, int status) {
        String sql = "UPDATE [dbo].[House]\n"
                + "   SET [AccountID] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[NumberOfRoom] = ?\n"
                + "      ,[City] = ?\n"
                + "      ,[ElectricalFee] = ?\n"
                + "      ,[WaterFee] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE HouseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            st.setString(2, name);
            st.setString(3, address);
            st.setInt(4, categoryID);
            st.setString(5, description);
            st.setInt(6, numberOfRoom);
            st.setString(7, city);
            st.setDouble(8, electricalFee);
            st.setDouble(9, waterFee);
            st.setInt(10, status);
            st.setInt(11, houseid); // This should be the 11th parameter
            int rs = st.executeUpdate();
        } catch (SQLException e) {

        }
    }
    //main

    //get min price of room
    public double getMinRoomPriceByHouseId(int houseid) {
        String sql = "select top 1 price from room  where houseid=? order by price asc";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, houseid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getDouble("price");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    //house search
    public List<House> search(String key, Double price1, Double price2, int cid) {
        List<House> list = new ArrayList<>();
        String sql = "select * from house \n"
                + "where 1=1 ";
        if (key != null && !key.equals("")) {
            sql += "and name like N'%" + key + "%'  or description like N'%" + key + "%' or address like N'%" + key
                    + "%' or City like N'%" + key + "%'";
        }
        //price
        if (price1 != null || price2 != null) {
            sql += "and HouseID in(	SELECT h.HouseID\n"
                    + "FROM house h\n"
                    + "JOIN room r ON h.HouseID = r.HouseID\n"
                    + "WHERE r.Price >="+price1+ " AND r.Price <= "+price2+")";
        }
        //cid
        if (cid != 0) {
            sql += "and categoryid=" + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                House p = new House();
                p.setHouseID(rs.getInt("houseid"));
                p.setAccountID(rs.getInt("accountid"));
                p.setName(rs.getString("name"));
                p.setAddress(rs.getString("Address"));
                p.setCategoryID(rs.getInt("CategoryID"));
                p.setDescription(rs.getString("Description"));
                p.setNumberOfRoom(rs.getInt("NumberOfRoom"));
                p.setCity(rs.getString("city"));
                p.setElectricalFee(rs.getDouble("ElectricalFee"));
                p.setWaterFee(rs.getDouble("WaterFee"));
                p.setStatus(rs.getInt("status"));
                p.setPreviewImage(getPreViewImageByHouseId(rs.getInt("houseid")));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    //sort from price

    //list category
    public List<HouseCategory> getListCategory() {
        List<HouseCategory> list = new ArrayList<>();
        String sql = "select * from [house category] ";
        int a = 0;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new HouseCategory(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
//get category by houseid
    public HouseCategory getCategoryHouse(int cateid) {
        String sql = "  select * from [House Category] where CategoryID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
               return new HouseCategory(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    //phan trang
    public List<House> getListByPage(List<House> list,
            int start, int end) {
        List<House> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public House getHouseByRoomId(int roomId) {
        String sql = "select * from House\n"
                + "where HouseID in \n"
                + "(select HouseID from Room\n"
                + "where RoomID = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image image = getPreViewImageByHouseId(rs.getInt(1));
                return new House(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getDouble(9), rs.getDouble(10),
                        rs.getInt(11), image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    

}
//

