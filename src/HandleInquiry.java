
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		int inquiryId = (Integer) session.getAttribute("clicks");
		String productNo = request.getParameter("pname");
		String cid = (String) session.getAttribute("cId");
		String Qty = request.getParameter("qty");
		Connection conn = ConnectionManager.getCustConnection();
		PreparedStatement pstmt = null;
		request.setAttribute("inquiryId", inquiryId);
		request.setAttribute("productNo", productNo);
		request.setAttribute("cid", cid);
		request.setAttribute("Qty", Qty);
		String query = "insert into inquiry_data(Inquiry_Id,product_id,id)values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inquiryId);
			pstmt.setString(2, productNo);
			pstmt.setString(3, cid);
			pstmt.execute();
			System.out.println("Inquiry Added");
		} catch (SQLException e) {

			e.printStackTrace();
		}
		

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
