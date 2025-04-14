<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <h2>Admin Login</h2>
    <form action="AdminLoginServlet" method="post">
        <input type="text" name="username" placeholder="Admin Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="admin_signup.jsp">Sign up</a></p>
</body>
</html>
