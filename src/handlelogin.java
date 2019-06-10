
import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.mysql.cj.Session;

import Fujifilm.Connection.ConnectionManager;

@WebServlet("/handlelogin")
public class handlelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isEmployee = false;
		request.getSession().invalidate();
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String employeeid = request.getParameter("employee_id");
		if (employeeid.length() > 0) {
			isEmployee = true;
		}
		if (username == null || password == null || username.length() == 0 || password.length() == 0) {
			session.setAttribute("errmsg", "username and password cannot be empty strings :-(. ");
			response.sendRedirect("error.jsp");
			return;
		}
		Connection conn = null;
		try {
			conn = ConnectionManager.getCustConnection();
			System.out.println(conn);
			PreparedStatement preparedStmt = null;
			ResultSet rs;
			String equery = "select password,employeeid from employee where username=?";
			String cquery = "select password from customer where username=?";
			
			
			
			if (isEmployee) {
				preparedStmt = conn.prepareStatement(equery);
				preparedStmt.setString(1, username);
				rs = preparedStmt.executeQuery();
			} else {
				preparedStmt = conn.prepareStatement(cquery);
				preparedStmt.setString(1, username);
				rs = preparedStmt.executeQuery();
				
			}
			while (rs.next()) {
				if (!rs.getString(1).equals(password)) {
					session.setAttribute("errmsg", username + " login failed :-(. ");
					response.sendRedirect("error.jsp");
					return;
				} else {
					if (isEmployee) {
						if (!rs.getString(2).equals(employeeid)) {
							session.setAttribute("errmsg", username + " login failed :-(. Could not find employeeid. ");
							response.sendRedirect("error.jsp");
							return;
						}
					}

					session.setAttribute("who", username);
					session.setAttribute("errmsg", "");
					if (isEmployee) {
						response.sendRedirect("employee.jsp");
					} else {
						response.sendRedirect("customer.jsp");
					}
					return;
				}
			}
			session.setAttribute("errmsg", username + " login failed :-(. ");
			response.sendRedirect("error.jsp");
			return;
		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("errmsg", username + " login failed :-(. ");
			response.sendRedirect("error.jsp");
			return;
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
