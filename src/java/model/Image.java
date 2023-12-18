/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Image {

    private int imageID;
    private int houseID;
    private String imageName;
    private String imagePath;

    // Constructors
    public Image() {

    }

    public Image(int imageID, int houseID, String imageName, String imagePath) {
        this.imageID = imageID;
        this.houseID = houseID;
        this.imageName = imageName;
        this.imagePath = imagePath;
    }

    // Getter and Setter methods
    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public int getHouseID() {
        return houseID;
    }

    public void setHouseID(int houseID) {
        this.houseID = houseID;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Image [imageID=" + imageID + ", houseID=" + houseID + ", imageName=" + imageName + ", imagePath=" + imagePath + "]";
    }
}
