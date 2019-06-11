
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
import Fujifilm.Connection.ConnectionManager;

@WebServlet("/handleregister")
public class handleregister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isEmployee = false;
		HttpSession session = request.getSession();
		String firstname = request.getParameter("first_name");
		String lastname = request.getParameter("last_name");
		String emailid = request.getParameter("emailid");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String employeeid = request.getParameter("employee_id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
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
			PreparedStatement preparedStmt;
			String cquery = "insert into customer (first_name, last_name, emailid, address, contact, username, password) values (?,?,?,?,?,?,?)";
			String equery = "insert into employee (first_name, last_name, emailid, address, contact, employeeid, username, password) values (?,?,?,?,?,?,?,?)";
			if (isEmployee) {
				preparedStmt = conn.prepareStatement(equery);
				preparedStmt.setString(1, firstname);
				preparedStmt.setString(2, lastname);
				preparedStmt.setString(3, emailid);
				preparedStmt.setString(4, address);
				preparedStmt.setString(5, contact);
				preparedStmt.setString(6, employeeid);
				preparedStmt.setString(7, username);
				preparedStmt.setString(8, password);
			} else {
				preparedStmt = conn.prepareStatement(cquery);
				preparedStmt.setString(1, firstname);
				preparedStmt.setString(2, lastname);
				preparedStmt.setString(3, emailid);
				preparedStmt.setString(4, address);
				preparedStmt.setString(5, contact);
				preparedStmt.setString(6, username);
				preparedStmt.setString(7, password);
			}
			preparedStmt.execute();

			session.setAttribute("errmsg", username + " registration successful :-). ");
			response.sendRedirect("registered.jsp");
			return;

		} catch (Exception e) {
			System.out.println(e);
			session.setAttribute("errmsg", username + " registration failed :-(. ");
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
