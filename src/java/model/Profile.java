/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
import java.util.Date;

public class Profile {

    private int profileID;
    private String fullName;
    private String phone;
    private Date dob;
    private int gender;
    private String email;
    private String photo;

    public Profile() {

    }

    public Profile(int profileID, String fullName, String phone, Date dob, int gender, String email, String photo) {
        this.profileID = profileID;
        this.fullName = fullName;
        this.phone = phone;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.photo = photo;
    }

    public int getProfileID() {
        return profileID;
    }

    public void setProfileID(int profileID) {
        this.profileID = profileID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDOB() {
        return dob;
    }

    public void setDOB(Date dob) {
        this.dob = dob;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Profile [profileID=" + profileID + ", fullName=" + fullName + ", phone=" + phone + ", dob=" + dob
                + ", gender=" + gender + ", email=" + email + ", photo=" + photo + "]";
    }
}
