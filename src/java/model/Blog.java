/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Blog {

    private int blogId;
    private int accountId;
    private String title;
    private String content;
    private Date createDate;
    private String briefInfor;
    private String photo;
    private boolean status;

    public Blog() {
    }

    public Blog(int blogId, int accountId, String title, String content, Date createDate, String briefInfor, String photo, boolean status) {
        this.blogId = blogId;
        this.accountId = accountId;
        this.title = title;
        this.content = content;
        this.createDate = createDate;
        this.briefInfor = briefInfor;
        this.photo = photo;
        this.status = status;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getBriefInfor() {
        return briefInfor;
    }

    public void setBriefInfor(String briefInfor) {
        this.briefInfor = briefInfor;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogId=" + blogId + ", accountId=" + accountId + ", title=" + title + ", content=" + content + ", createDate=" + createDate + ", briefInfor=" + briefInfor + ", photo=" + photo + ", status=" + status + '}';
    }


}
