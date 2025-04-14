<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        body {
            background-color: #e3f2fd;
            font-family: Arial, sans-serif;
            padding: 30px;
        }

        h1 {
            text-align: center;
            color: #0d47a1;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #2196f3;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .logout-btn {
            display: block;
            width: 120px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .logout-btn:hover {
            background-color: #c62828;
        }
    </style>
</head>
<body>

<h1>User Dashboard</h1>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Password</th>
        <th>Address</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM users");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("password") %></td>
        <td><%= rs.getString("address") %></td>
    </tr>
<%
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

<a class="logout-btn" href="logout.jsp">Logout</a>

</body>
</html>
