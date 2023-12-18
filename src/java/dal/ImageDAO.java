/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;

/**
 *
 * @author huyht
 */
public class ImageDAO extends DBContext {

    public ResultSet getSliderInfo() {
        String sql = "SELECT i.ImagePath, h.Name, h.Address, a.HouseID FROM Image i \n"
                + "JOIN Advertisement a ON i.HouseID = a.HouseID\n"
                + "JOIN House h ON a.HouseID = h.HouseID\n"
                + "WHERE a.Status = 1 and i.imageName is NULL";
        return getData(sql);
    }

    public ResultSet getSliderBelowInfo() {
        String sql = "SELECT i.ImagePath, h.Name, h.Address, a.HouseID FROM Image i \n"
                + "JOIN Advertisement a ON i.HouseID = a.HouseID\n"
                + "JOIN House h ON a.HouseID = h.HouseID\n"
                + "WHERE a.Status = 1 AND i.ImageName = 'below'";
        return getData(sql);
    }

}
