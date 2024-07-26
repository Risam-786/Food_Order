

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminSignupServlet
 */
@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username");
	        String email = request.getParameter("Email");
	        String password = request.getParameter("password");

	        Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	            // Load the MySQL JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Connect to the database
	            String dbURL = "jdbc:mysql://localhost:3306/newdb2";
	            String dbUser = "root"; // Replace with your DB username
	            String dbPass = "root"; // Replace with your DB password
	            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

	            // Prepare the SQL statement
	            String sql = "INSERT INTO users1 (username, email, password) VALUES (?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, username);
	            pstmt.setString(2, email);
	            pstmt.setString(3, password);

	            // Execute the update
	            int rows = pstmt.executeUpdate();

	            // Check if insertion was successful
	            if (rows > 0) {
	                response.sendRedirect("admin.html"); // Redirect to a welcome page
	            } else {
	                PrintWriter out = response.getWriter();
	                //out.println("<html><body><h3>Registration failed</h3></body></html>");
	                response.sendRedirect("admin.html");
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
