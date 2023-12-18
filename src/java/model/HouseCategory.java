/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class HouseCategory {

    private int categoryID;
    private String description;
    private String category;

    // Constructors
    public HouseCategory() {
    }

    public HouseCategory(int categoryID, String description, String category) {
        this.categoryID = categoryID;
        this.description = description;
        this.category = category;
    }

    // Getter and Setter methods
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Category [categoryID=" + categoryID + ", description=" + description + ", category=" + category + "]";
    }
}
