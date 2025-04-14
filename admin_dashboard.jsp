<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            background-color: aqua;
            font-family: Arial, sans-serif;
            padding: 40px;
        }
        .container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
        }
        .form-box {
            flex: 1;
            min-width: 280px;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
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
        .logout-container {
            text-align: right;
            margin-bottom: 20px;
        }
        .logout-container form {
            display: inline;
        }
        .logout-container button {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logout-container">
        <form action="LogoutServlet" method="get">
            <button type="submit">Logout</button>
        </form>
    </div>

    <h2>Admin Dashboard</h2>

    <div class="form-container">
        <!-- Add Employee -->
        <div class="form-box">
            <h3>Add New Employee</h3>
            <form action="AddEmployeeServlet" method="post">
                <input type="text" name="name" placeholder="Full Name" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="text" name="address" placeholder="Address" required>
                <button type="submit">Add Employee</button>
            </form>
        </div>

        <!-- Update Employee -->
        <div class="form-box">
            <h3>Update Employee</h3>
            <form action="UpdateEmployeeServlet" method="post">
                <input type="text" name="id" placeholder="Employee ID" required>
                <input type="text" name="name" placeholder="Full Name">
                <input type="password" name="password" placeholder="Password">
                <input type="text" name="address" placeholder="Address">
                <button type="submit">Update Employee</button>
            </form>
        </div>

        <!-- Delete Employee -->
        <div class="form-box">
            <h3>Delete Employee</h3>
            <form action="DeleteEmployeeServlet" method="post">
                <input type="text" name="id" placeholder="Employee ID" required>
                <button type="submit">Delete Employee</button>
            </form>
        </div>
    </div>

    <!-- Link to view employee list -->
    <div style="text-align:center; margin-top:30px;">
        <a href="EmployeeListServlet" style="text-decoration:none; font-weight:bold; color:#007BFF;">View All Employees</a>
    </div>

</div>

</body>
</html>
