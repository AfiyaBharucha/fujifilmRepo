
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

@WebServlet("/HandleSale")
public class HandleSale extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("Ono");
		PreparedStatement pstmt = null;
		
		try {
			Connection conn = ConnectionManager.getCustConnection();
			String query = "update fujifilm.order set Order_Status='confirmed' where Order_No=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.execute();
			
						request.getRequestDispatcher("SalesOrder.jsp").forward(request, response);
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

}
