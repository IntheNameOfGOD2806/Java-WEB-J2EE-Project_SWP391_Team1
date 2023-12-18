/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Room {

    private int roomID;
    private int houseID;
    private int accountID;
    private double price;
    private String description;
    private int area;
    private int status;
    private House house;

    // Constructors
    public Room() {
    }

    public Room(int roomID, int houseID, int accountID, double price, String description, int area, int status) {
        this.roomID = roomID;
        this.houseID = houseID;
        this.accountID = accountID;
        this.price = price;
        this.description = description;
        this.area = area;
        this.status = status;
    }

    // Getter and Setter methods
    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public String getStatus() {
        return status == 0 ? "Active" : "Hired";
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    @Override
    public String toString() {
        return "Room [roomID=" + roomID + ", houseID=" + houseID + ", accountID=" + accountID + ", price=" + price + ", description=" + description + ", area=" + area + ", status=" + status + "]";
    }
}
