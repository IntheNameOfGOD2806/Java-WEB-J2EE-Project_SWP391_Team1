package controller.common;

import dal.AccountDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String npassword = request.getParameter("npassword");
        String rpassword = request.getParameter("rpassword");
        AccountDAO accountDAO = new AccountDAO();
        Account acc = accountDAO.getAccountByEmailProfile((String) session.getAttribute("Email"));
        if (!npassword.equals(rpassword)) {
            String re = "Hai mât khẩu không trùng nhau";
            request.setAttribute("re", re);
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        } else {
            acc = new Account(acc.getAccountId(), acc.getUserName(), npassword, acc.getRoleId(), acc.getProfileId(), acc.isStatus(), acc.getBalance());
            accountDAO.ChangePass(acc);
            String forgetPassChange = "Đổi mật khẩu thành công";
            request.setAttribute("forgetPassChange", forgetPassChange);
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        }
    }
}
