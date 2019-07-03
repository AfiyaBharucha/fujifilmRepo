
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Fujifilm.Connection.ConnectionManager;

@WebServlet("/HandleOrder")
public class HandleOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String[] pno = request.getParameterValues(("pno[0]"));
		String qty[] = request.getParameterValues(("qty[0]"));
		int i = (Integer) session.getAttribute("No");
		PreparedStatement ps = null;
		Connection conn = ConnectionManager.getCustConnection();
		String Q = "update  inquiry_data set Status=case Status when 'confirmed' then 'done' end where Inquiry_Id=?";

		try {
			ps = conn.prepareStatement(Q);
			ps.setInt(1, i);
			ps.executeUpdate();

		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		for (int j = 0; j < pno.length; j++) {
			int p = Integer.parseInt(pno[j]);
			int q = Integer.parseInt(qty[j]);
			int Ono = (Integer) session.getAttribute("No");
			String date = (String) session.getAttribute("date");
			int id = (Integer) session.getAttribute("cId");

			try {

				PreparedStatement pstmt = null;

				String query = " insert into fujifilm.order (Order_No, id, product_id, Qty_sold ,Order_Date,Order_Status) values(?,?,?,?,?,'pending') ";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Ono);
				pstmt.setInt(2, id);
				pstmt.setInt(3, p);
				pstmt.setInt(4, q);
				pstmt.setString(5, date);
				pstmt.execute();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("Cst_Quotation.jsp").forward(request, response);
	}

}
