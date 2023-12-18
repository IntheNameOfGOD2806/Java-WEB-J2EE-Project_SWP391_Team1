/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class House {

    private int houseID;
    private int accountID;
    private String name;
    private String address;
    private int categoryID;
    private String description;
    private int numberOfRoom;
    private String city;
    private double electricalFee;
    private double waterFee;

    private int status;
    private Image previewImage;

    public House() {

    }

    public House(int houseID, int accountID, String name, String address, int categoryID, String description, int numberOfRoom, String city, double electricalFee, double waterFee, int status, Image previewImage) {
        this.houseID = houseID;
        this.accountID = accountID;
        this.name = name;
        this.address = address;
        this.categoryID = categoryID;
        this.description = description;
        this.numberOfRoom = numberOfRoom;
        this.city = city;
        this.electricalFee = electricalFee;
        this.waterFee = waterFee;
        this.status = status;
        this.previewImage = previewImage;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfRoom() {
        return numberOfRoom;
    }

    public void setNumberOfRoom(int numberOfRoom) {
        this.numberOfRoom = numberOfRoom;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public double getElectricalFee() {
        return electricalFee;
    }

    public void setElectricalFee(double electricalFee) {
        this.electricalFee = electricalFee;
    }

    public double getWaterFee() {
        return waterFee;
    }

    public void setWaterFee(double waterFee) {
        this.waterFee = waterFee;
    }

    public String getStatus() {
        return status == 1 ? "Active" : "Not for Rent";

    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Image getPreviewImage() {
        return previewImage;
    }

    public void setPreviewImage(Image previewImage) {
        this.previewImage = previewImage;
    }

    @Override
    public String toString() {
        return "House{"
                + "houseID=" + houseID
                + ", accountID=" + accountID
                + ", name='" + name + '\''
                + ", address='" + address + '\''
                + ", categoryID=" + categoryID
                + ", description='" + description + '\''
                + ", numberOfRoom=" + numberOfRoom
                + ", city='" + city + '\''
                + ", electricalFee=" + electricalFee
                + ", waterFee=" + waterFee
                + ", status=" + status
                + '}';
    }

}
