package com.aip.servlets;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to MySQL (DB: employee, user: root, password: oracle)
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee", "root", "oracle");

            // Check credentials from 'admin' table
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Store admin in session
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);

                // Redirect to admin dashboard
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                // Redirect to login page with error
                response.sendRedirect("admin_login.jsp?error=invalid");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
