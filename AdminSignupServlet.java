package com.aip.servlets;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");
            PreparedStatement ps = con.prepareStatement("INSERT INTO admin(username, password) VALUES(?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
            con.close();
            response.sendRedirect("admin_login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}