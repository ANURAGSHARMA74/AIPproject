package com.aip.servlets;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        
        try {
            int id = Integer.parseInt(idStr);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");

            PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id = ?");
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();

            con.close();

            if (rowsAffected > 0) {
                response.sendRedirect("employee_list.jsp");
            } else {
                response.sendRedirect("admin_dashboard.jsp?error=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_dashboard.jsp?error=exception");
        }
    }
}
