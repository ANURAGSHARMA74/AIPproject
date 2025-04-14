package com.aip.servlets;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the 'employee' database using root/oracle
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/employee", "root", "oracle");

            // Validate credentials
            String sql = "SELECT * FROM users WHERE name=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Login success, redirect to user dashboard or welcome page
                response.sendRedirect("user_dashboard.jsp");
            } else {
                // Login failed, redirect back to login page
                response.sendRedirect("user_login.jsp?error=invalid");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("user_login.jsp?error=exception");
        }
    }
}
