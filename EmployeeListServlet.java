package com.aip.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/EmployeeListServlet")
public class EmployeeListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");
            
            out.println("<html><body>");
            out.println("<h2>Employee List</h2>");
            out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Address</th></tr>");
            
            while (rs.next()) {
                out.println("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getString("address") + "</td></tr>");
            }
            
            out.println("</table>");
            out.println("<br><a href='admin_dashboard.jsp'>Back to Dashboard</a>");
            out.println("</body></html>");
            
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            out.println("<h3>Error Fetching Employee List: " + e.getMessage() + "</h3>");
        }
    }
}
