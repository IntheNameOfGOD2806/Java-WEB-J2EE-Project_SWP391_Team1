/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Account {

    private int accountId;
    private String userName;
    private String password;
    //role 1:landlord
    //role 2:marketing
    private int roleId;
    private int profileId;
    private int status;
    private double balance;

    // Constructors, getters, and setters
    public Account() {
    }

    public Account(int accountId, String userName, String password, int roleId, int profileId, int status, double balance) {
        this.accountId = accountId;
        this.userName = userName;
        this.password = password;
        this.roleId = roleId;
        this.profileId = profileId;
        this.status = status;
        this.balance = balance;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public int isStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Account [accountId=" + accountId + ", userName=" + userName + ", roleId=" + roleId
                + ", profileId=" + profileId + ", status=" + status + ", balance=" + balance + "]";
    }
}
