<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Signup</title>
    
</head>

<body>
    <h2>Admin Signup</h2>
    <form action="AdminSignupServlet" method="post">
        <input type="text" name="username" placeholder="Admin Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Signup</button>
    </form>
    <p>Already registered? <a href="admin_login.jsp">Login here</a></p>
</body>
</html>
