/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL i7
 */
public class Advertisement {
    private int adsId;
    private int houseId;
    private double adsFee;
    private Date startDate;
    private Date endDate;
    private int status;

    public Advertisement() {
    }

    public Advertisement(int adsId, int houseId, double adsFee, Date startDate, Date endDate, int status) {
        this.adsId = adsId;
        this.houseId = houseId;
        this.adsFee = adsFee;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getAdsId() {
        return adsId;
    }

    public void setAdsId(int adsId) {
        this.adsId = adsId;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public double getAdsFee() {
        return adsFee;
    }

    public void setAdsFee(double adsFee) {
        this.adsFee = adsFee;
    }

    public Date getStartDate() {
        return startDate;
    }

    public String getStartDate2() {
        if (startDate == null) {
            return null;
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
        String strDate = formatter.format(startDate);  
        return strDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getEndDate2() {
        if (endDate == null) {
            return null;
        }
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
        String strDate = formatter.format(endDate);  
        return strDate;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Advertisement{" + "adsId=" + adsId + ", houseId=" + houseId + ", adsFee=" + adsFee + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + '}';
    }

    
    
}
