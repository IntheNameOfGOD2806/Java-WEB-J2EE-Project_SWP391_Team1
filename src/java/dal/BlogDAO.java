/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;

/**
 *
 * @author dang9
 */
public class BlogDAO extends DBContext {

    public int createBlog(Blog blog) {
        int a = 0;
        String sql = "INSERT INTO [dbo].[Blog]\n"
                + "           ([AccountID]\n"
                + "           ,[Title]\n"
                + "           ,[Content]\n"
                + "           ,[CreateDate]\n"
                + "           ,[brief_infor]\n"
                + "           ,[Photo]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, blog.getAccountId());
            st.setString(2, blog.getTitle());
            st.setString(3, blog.getContent());
            st.setDate(4, blog.getCreateDate());
            st.setString(5, blog.getBriefInfor());
            st.setString(6, blog.getPhoto());
            st.setInt(7, (blog.isStatus() == true ? 1 : 0));
            a = st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog order by blogid desc";
        try {
            Statement state = connection.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
        public List<Blog> getAllBlogbyStatusTrue() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where status ='1' order by blogid desc";
        try {
            Statement state = connection.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Blog> getBlogByAccountID(int accountID) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where AccountID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Blog> getBlogByTitle(String title) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where Title like ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, "%" + title + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int updateBlog(Blog blog) {
        int a = 0;
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [AccountID] = ?\n"
                + "      ,[Title] = ?\n"
                + "      ,[Content] = ?\n"
                + "      ,[CreateDate] = ?\n"
                + "      ,[brief_infor] = ?\n"
                + "      ,[Photo] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE [BlogID] = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, blog.getAccountId());
            st.setString(2, blog.getTitle());
            st.setString(3, blog.getContent());
            st.setDate(4, blog.getCreateDate());
            st.setString(5, blog.getBriefInfor());
            st.setString(6, blog.getPhoto());
            st.setInt(7, (blog.isStatus() == false ? 0 : 1));
            st.setInt(8, blog.getBlogId());
            a = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public int deleteBlogByID(int blogID) {
        int a = 0;
        String sql = "DELETE FROM [dbo].[Blog]\n"
                + " WHERE [BlogID] = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, blogID);
            a = st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    public void changeStatusById(int blogID, int status) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [Status] = ?\n"
                + " WHERE BlogID = ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, status);
            st.setInt(2, blogID);

            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int count(String title) {
        String sql = "Select COUNT(*)\n"
                + "From Blog\n"
                + "Where Title like ?";
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + title + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public List<Blog> getListByPage(List<Blog> list,
            int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Blog> getBlogByBlogID(int blogid) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where BlogID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Blog> getSortedBlog(String sort) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog";
        if (sort.equals("ASC")) {
            sql += " order by CreateDate ASC";
        } else {
            sql += " order by CreateDate DESC";
        }
        try {
            Statement state = connection.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Blog> getTop3Blog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select Top 3* from Blog where status ='1' order by blogid desc";
        try {
            Statement state = connection.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    /*
    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        int count = dao.count("Test2");
        System.out.println(count);
    }
     */
}
