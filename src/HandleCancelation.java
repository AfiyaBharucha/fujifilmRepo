
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Fujifilm.Connection.ConnectionManager;

@WebServlet("/HandleCancelation")
public class HandleCancelation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("No");
		PreparedStatement pstmt = null;

		try {
			Connection conn = ConnectionManager.getCustConnection();
			String query = "update Inquiry_Data set Status='canceled' where Inquiry_Id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.execute();
			request.getRequestDispatcher("Cst_Quotation.jsp").forward(request, response);

	}catch (Exception e) {
		e.getMessage();
	}
	}
}


