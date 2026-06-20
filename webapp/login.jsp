<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QSpiders Login</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    height: 100vh;
    display: flex;
}

/* LEFT SIDE */
.left {
    flex: 1;
    background: linear-gradient(to right, #000000, #2c3e50);
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding-left: 80px;
}

.left h1 {
    color: #ff7a00;
    font-size: 40px;
}

.left p {
    font-style: italic;
    font-size: 18px;
}

/* RIGHT SIDE */
.right {
    flex: 1;
    background: linear-gradient(to right, #2c3e50, #3b5998);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* LOGIN CARD */
.card {
    width: 350px;
    background: #1b263b;
    padding: 20px;
    border-radius: 8px;
    color: white;
    box-shadow: 0 0 15px rgba(0,0,0,0.5);
}

/* Toggle */
.toggle {
    display: flex;
    background: #2e3b55;
    border-radius: 25px;
    overflow: hidden;
    margin-bottom: 15px;
}

.toggle button {
    flex: 1;
    padding: 10px;
    border: none;
    background: transparent;
    color: #ccc;
    cursor: pointer;
}

.toggle .active {
    background: linear-gradient(to right, #ff7a00, #ffb347);
    color: black;
}

/* Inputs */
input {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border-radius: 5px;
    border: none;
    background: #2e3b55;
    color: white;
}

/* Login */
.login-btn {
    width: 100%;
    padding: 10px;
    background: #2d6cdf;
    border: none;
    color: white;
    cursor: pointer;
    margin-top: 10px;
}

/* Register */
.register-btn {
    width: 100%;
    padding: 10px;
    background: #00a86b;
    border: none;
    color: white;
    margin-top: 10px;
    cursor: pointer;
}

/* Forgot */
.forgot {
    text-align: center;
    margin-top: 10px;
    color: #ccc;
    cursor: pointer;
}
</style>

<script>
function setRole(role){
    document.getElementById("role").value = role;

    let userBtn = document.getElementById("userBtn");
    let adminBtn = document.getElementById("adminBtn");

    if(role === "user"){
        userBtn.classList.add("active");
        adminBtn.classList.remove("active");
    } else {
        adminBtn.classList.add("active");
        userBtn.classList.remove("active");
    }
}
</script>

</head>
<body>

<!-- LEFT SIDE -->
<div class="left">
    <h1>QSpiders JSpiders PySpiders</h1>
    <p>You are at a place where businesses find talent and dreams take flight</p>
    <%String msg=(String)session.getAttribute("msg");
    if(msg!=null){
    	
    	
    %><h1 style="color:green"><%=msg %></h1>
    <%
    }
    session.removeAttribute("msg");
    %>
    
</div>

<!-- RIGHT SIDE -->
<div class="right">

<div class="card">

    <!-- Toggle -->
    <div class="toggle">
        <button type="button" id="userBtn" class="active"
            onclick="setRole('user')">Student</button>
            
        <button type="button" id="adminBtn"
            onclick="setRole('admin')">Admin</button>
    </div>

    <form action="Logins" method="post">

        <!-- Hidden role -->
        <input type="hidden" name="role" id="role" value="user">

        <label>Email </label>
        <input type="text" name="name" required>

        <label>Password</label>
        <input type="password" name="pass" required>

        <input type="submit" value="Login" class="login-btn">

        <button type="button" class="register-btn"
        onclick="goRegister()">Register</button>

        <div class="forgot">Forgot Password?</div>

    </form>

</div>

</div>

<script>
function goRegister(){
    let role = document.getElementById("role").value;

    if(role === "user"){
        window.location.href = "rigister.jsp";
    } else {
        window.location.href = "adminr.jsp";
    }
}
</script>

</body>
</html>