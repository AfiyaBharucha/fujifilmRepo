

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Fujifilm.Connection.ConnectionManager;


@WebServlet("/InvoiceStatus")
public class InvoiceStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int i = (Integer) session.getAttribute("No");
		PreparedStatement ps = null;
		Connection conn= ConnectionManager.getCustConnection();
		String Q ="update  fujifilm.order set Order_Status=case Order_Status when 'confirmed' then 'done' end where Order_No=?";

		try {
			ps = conn.prepareStatement(Q);
	         ps.setInt(1, i);
			ps.execute();

		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		request.getRequestDispatcher("Invoice.jsp").forward(request, response);
	}

}
