import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Fujifilm.Connection.ConnectionManager;

@WebServlet("/HandleInquiry")
public class HandleInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String paramName = params.nextElement();
			System.out.println("Parameter Name - " + paramName + ", Value - " + request.getParameter(paramName));
		}

		int numrows = Integer.parseInt(request.getParameter("numrows"));
		for (int i = 0; i < numrows; i++) {

			int inquiryId = (Integer) session.getAttribute("clicks");
			int productId = Integer.parseInt(request.getParameter("selectbox[" + i + "]"));
			int cid = (Integer) session.getAttribute("cId");
			int qty = Integer.parseInt(request.getParameter("qty[" + i + "]"));
			String date = (String) session.getAttribute("date");
			Connection conn = null;
			try {
				conn = ConnectionManager.getCustConnection();
				System.out.println(conn);
				PreparedStatement preparedStmt = null;
				String qry = "insert into inquiry_data(Inquiry_Id,product_id,id,Qty,date,Status)values(?,? ,?,?,?,?)";
				preparedStmt = conn.prepareStatement(qry);
				preparedStmt.setInt(1, inquiryId);
				preparedStmt.setInt(2, productId);
				preparedStmt.setInt(3, cid);
				preparedStmt.setInt(4, qty);
				preparedStmt.setString(5, date);
				preparedStmt.setString(6, "pending");
				preparedStmt.execute();
			} catch (Exception e) {
				e.printStackTrace();
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
		response.sendRedirect("Cst_Inquiry.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
