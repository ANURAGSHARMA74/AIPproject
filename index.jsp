<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: aqua;
            color: #000;
            text-align: center;
            padding-top: 100px;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            display: inline-block;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h1 {
            margin-bottom: 40px;
        }
        a.button {
            display: inline-block;
            margin: 10px;
            padding: 15px 25px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            transition: background 0.3s;
        }
        a.button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Employee Management System</h1>
        <a href="admin_login.jsp" class="button">Admin Login</a>
        <a href="admin_signup.jsp" class="button">Admin Signup</a>
        <a href="user_login.jsp" class="button">User Login</a>
        <a href="user_signup.jsp" class="button">User Signup</a>
    </div>
</body>
</html>
