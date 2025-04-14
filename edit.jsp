<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 50px;
        }
        .container {
            width: 400px;
            margin: auto;
            background-color: white;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "", password = "", address = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "oracle");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            name = rs.getString("name");
            password = rs.getString("password");
            address = rs.getString("address");
        }
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

<div class="container">
    <h2>Edit Employee</h2>
    <form action="UpdateEmployeeServlet" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        <input type="text" name="name" value="<%=name%>" placeholder="Name" required>
        <input type="password" name="password" value="<%=password%>" placeholder="Password" required>
        <input type="text" name="address" value="<%=address%>" placeholder="Address" required>
        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
