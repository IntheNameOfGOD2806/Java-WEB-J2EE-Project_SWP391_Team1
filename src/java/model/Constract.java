/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author adm
 */
public class Constract {

    private int constractID;
    private int accountID;
    private int roomID;
    private String startDate;
    private String endDate;
    private boolean status;
    private Room room;
    private Profile profile;

    public Constract() {

    }

    public Constract(int constractID, int accountID, int roomID, String startDate, String endDate, boolean status) {
        this.constractID = constractID;
        this.accountID = accountID;
        this.roomID = roomID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getConstractID() {
        return constractID;
    }

    public void setConstractID(int constractID) {
        this.constractID = constractID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getStartDate(){
        return startDate;
    }
    
    public String getStartDate2() {
        if (startDate == null) {
            return null;
        }
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date date1 = null;
        try {
            date1 = formatter1.parse(startDate);
        } catch (ParseException ex) {
            Logger.getLogger(Constract.class.getName()).log(Level.SEVERE, null, ex);
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
        String strDate = formatter.format(date1);  
        return strDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }
    
    public String getEndDate2() {
        if (endDate == null) {
            return null;
        }
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date date1 = null;
        try {
            date1 = formatter1.parse(endDate);
        } catch (ParseException ex) {
            Logger.getLogger(Constract.class.getName()).log(Level.SEVERE, null, ex);
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
        String strDate = formatter.format(date1);  
        return strDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    @Override
    public String toString() {
        return "Request [constractID=" + constractID + ", accountID=" + accountID + ", roomID=" + roomID
                + ", startDate=" + startDate + ", endDate="
                + endDate + ", status=" + status + "]";
    }
}
