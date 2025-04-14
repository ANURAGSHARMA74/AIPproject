package com.aip.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // get session if exists
        if (session != null) {
            session.invalidate(); // destroy session
        }
        response.sendRedirect("index.jsp"); // redirect to home or login
    }
}
