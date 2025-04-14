<%@ page import="java.util.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <style>
        body {
            background-color: aqua;
            font-family: Arial, sans-serif;
            padding: 40px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 90%;
            background-color: white;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }
        th, td {
            padding: 12px 20px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        .back {
            text-align: center;
            margin-top: 20px;
        }
        .back a {
            text-decoration: none;
            background: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .back a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<h1>Employee List</h1>

<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM users");
%>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Address</th>
        </tr>

<%
        while(rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("password") %></td>
            <td><%= rs.getString("address") %></td>
            <td>
                <a href="edit.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
                <a href="delete.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure to delete this employee?');">Delete</a>
            </td>
        </tr>
<%
        }
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
    }
%>

    </table>

    <div class="back">
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>

</body>
</html>
