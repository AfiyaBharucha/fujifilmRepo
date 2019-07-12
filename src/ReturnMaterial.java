
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Fujifilm.Connection.ConnectionManager;

@WebServlet("/ReturnMaterial")
public class ReturnMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int OrderNo = Integer.parseInt(request.getParameter("OrderNo"));
		int Qty = Integer.parseInt(request.getParameter("Qty"));
		int Id = Integer.parseInt(request.getParameter("Id"));
		System.out.println(OrderNo);
		System.out.println(Qty);
		PreparedStatement ps = null;
		PreparedStatement p = null;
		Connection conn = ConnectionManager.getCustConnection();
		String Q = "update  fujifilm.order set Order_Status=case Order_Status when 'done' then 'return' end where Order_No=? and product_id=?";
		String S = "update product_master set quantity=quantity+? where product_id=?";
		try {
			ps = conn.prepareStatement(Q);
			ps.setInt(1, OrderNo);
			ps.setInt(2, Id);
			ps.execute();
			
			
			p = conn.prepareStatement(S);
			p.setInt(1, Qty);
			p.setInt(2, Id);
			p.execute();
            
			
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		request.getRequestDispatcher("MaterialReturn.jsp").forward(request, response);
	}
}
