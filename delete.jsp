<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");
        PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("employee_list.jsp");
%>
