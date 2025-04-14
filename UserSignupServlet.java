package com.aip.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserSignupServlet")
public class UserSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");

            PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, password) VALUES (?, ?)");
            ps.setString(1, name);
            ps.setString(2, password);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("user_login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
