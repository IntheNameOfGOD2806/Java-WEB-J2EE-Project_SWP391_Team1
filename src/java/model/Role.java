/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Role {

    private int roleID;
    private String roleName;

    public Role(int roleID, String roleName) {
        this.roleID = roleID;
        this.roleName = roleName;
    }

    public int getroleID() {
        return roleID;
    }

    public void setroleID(int roleID) {
        this.roleID = roleID;
    }

    public String getroleName() {
        return roleName;
    }

    public void setroleName(String roleName) {
        this.roleName = roleName;
    }

}
