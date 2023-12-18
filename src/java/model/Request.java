/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author adm
 */
public class Request {

    private int requestID;
    private int accountID;
    private int roomID;
    private Date requestDate;
    private Room room;
    private Account account;
    private Profile profile;

    public Request() {

    }

    public Request(int requestID, int accountID, int roomID, Date requestDate) {
        this.requestID = requestID;
        this.accountID = accountID;
        this.roomID = roomID;
        this.requestDate = requestDate;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
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

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    @Override
    public String toString() {
        return "Request [requestID=" + this.getRequestID() + ", accountID=" + this.getAccountID() + ", roomID=" + this.getRoomID() + ", requestDate="
                + this.getRequestDate() + "]";
    }
}
