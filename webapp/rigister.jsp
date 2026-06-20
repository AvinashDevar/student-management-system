<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #020617, #0f172a);
    color: white;
}

/* Container */
.form-box {
    width: 350px;
    margin: 80px auto;
    background: #1e293b;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0px 0px 20px rgba(0,0,0,0.5);
}

/* Title */
.form-box h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* Inputs */
input, select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: none;
    outline: none;
    border-radius: 6px;
    background: #334155;
    color: white;
}

/* Placeholder color */
input::placeholder {
    color: #cbd5e1;
}

/* Dropdown */
select {
    color: #cbd5e1;
}

/* Button */
button {
    width: 100%;
    padding: 10px;
    background: #10b981;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
}

/* Hover effect */
button:hover {
    background: #059669;
}

/* Heading */
h1 {
    text-align: center;
    margin-top: 20px;
}

</style>

</head>

<body>

<h1>Student Registration</h1>

<div class="form-box">

    <h2>Register</h2>

    <form action="register" method="post">

        <!-- Name -->
        <input type="text" name="name" placeholder="Enter Name" required>

        <!-- Email -->
        <input type="email" name="email" placeholder="Enter Email" required>

        <!-- Password -->
        <input type="text" name="pass" placeholder="Enter Password" required>

        <!-- ID -->
        <input type="number" name="id" placeholder="Enter ID">

        <!-- Admin ID -->
        <input type="number" name="aid" placeholder="Enter Admin ID" required>

        <!-- Course Dropdown -->
        <select name="course" required>
            <option value="">-- Select Course --</option>
            <option value="Java Full Stack">Java Full Stack</option>
            <option value="Python Full Stack">Python Full Stack</option>
            <option value="Web Development">Web Development</option>
            <option value="Software Testing">Software Testing</option>
        </select>

        <!-- Submit -->
        <button type="submit">Register</button>

    </form>

</div>

</body>
</html>