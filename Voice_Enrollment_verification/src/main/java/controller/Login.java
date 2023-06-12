package controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail = request.getParameter("username");
		String upwd = request.getParameter("password");
		
				
		HttpSession session =request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String db_Host="192.168.5.57";
            String db_Port="1433";
            String db_User="sa";
            String db_Password="welcome!23";
            String db_Database ="web_page";
		
		java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://"+db_Host+":"+db_Port+";user="+db_User+";password="+db_Password+";database="+db_Database);
		
		PreparedStatement pst = conn.prepareStatement("select * from Voice_login where name = ? and pass = ?");
		pst.setString(1, uemail);
		pst.setString(2, upwd);
		
			
		
			
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
//			
			session.setAttribute("name", rs.getString("name"));
			dispatcher = request.getRequestDispatcher("secound.jsp");
			
		} else {
			
			request.setAttribute("status", "failed");
			dispatcher = request.getRequestDispatcher("index.jsp");
        }
		
		 dispatcher.forward(request, response);
		

		} catch (Exception e) {
		
			System.out.println(e);
			
		}
		
	
		
	}

}
