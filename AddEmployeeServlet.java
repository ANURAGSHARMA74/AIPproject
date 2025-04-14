package com.aip.servlets;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");

            PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, password, address) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, address);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("admin_dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
