<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Register</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #000000, #2c3e50);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .form-container {
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.2);
        width: 300px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input:focus {
        border-color: #4facfe;
        outline: none;
    }

    button {
        width: 100%;
        padding: 10px;
        background-color: #4facfe;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background-color: #007bff;
    }
</style>

</head>
<body>

<div class="form-container">
    <h2>Admin Register</h2>

    <form action="adminRigi" method="post">
        <input type="text" name="name" placeholder="Enter your name" required>
        <input type="email" name="email" placeholder="Enter email" required>
        <input type="number" name="pass" placeholder="Enter pass" required>
        <input type="number" name="id" placeholder="Enter id" required>

        <button type="submit">Register</button>
    </form>
</div>

</body>
</html>