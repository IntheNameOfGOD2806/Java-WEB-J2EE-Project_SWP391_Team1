/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huyht
 */
public class Feedback {

    private int feedbackId;
    private int accountId;
    private int houseId;
    private String description;
    private String createDate;
    private int parentId;
    private int status;

    public Feedback() {
    }

    public Feedback(int feedbackId, int accountId, int houseId, String description, String createDate, int parentId, int status) {
        this.feedbackId = feedbackId;
        this.accountId = accountId;
        this.houseId = houseId;
        this.description = description;
        this.createDate = createDate;
        this.parentId = parentId;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }



    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateDate() {
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date date1 = null;
        try {
            date1 = formatter1.parse(createDate);
        } catch (ParseException ex) {
            Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");  
        String strDate = formatter.format(date1);  
        return strDate;
    }
   public Date getCreateDate1() {
    SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    Date date1 = null;
    try {
        date1 = formatter1.parse(createDate);
    } catch (ParseException ex) {
        Logger.getLogger(Feedback.class.getName()).log(Level.SEVERE, null, ex);
    }
    return date1;
}

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackId=" + feedbackId + ", accountId=" + accountId + ", houseId=" + houseId + ", description=" + description + ", createDate=" + createDate + ", parentId=" + parentId + '}';
    }

}
