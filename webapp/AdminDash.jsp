<%@page import="dto.Student"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #0f172a;
    color: #fff;
}

.page {
    width: 100%;
}

.header {
    background: #1e293b;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h2 {
    margin: 0;
    color: #ff7a18;
}

.logout-btn {
    background: red;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
}

.logout-btn:hover {
    background: darkred;
}

.card {
    background: #1e293b;
    margin: 20px;
    padding: 20px;
    border-radius: 10px;
}

.card h3 {
    margin-top: 0;
    color: #38bdf8;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    background: #0f172a;
}

th {
    background: #2563eb;
    color: white;
}

th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #334155;
}

tr:hover {
    background: #1e40af;
}

.delete {
    background: red;
    color: white;
    padding: 6px 10px;
    border-radius: 5px;
    text-decoration: none;
}

.delete:hover {
    background: darkred;
}
</style>

</head>

<body>

<div class="page">

<div class="header">
    <h2>Admin Dashboard</h2>

    <form action="login.jsp" method="post">
        <button class="logout-btn">Logout</button>
    </form>
</div>

<div class="card">
    <h3>Admin Details</h3>

    ID: <%=session.getAttribute("aid")%><br>
    Name: <%=session.getAttribute("aname")%><br>
    Email: <%=session.getAttribute("aemail")%>
</div>

<div class="card">
    <h3>All Students</h3>

<%
Dao dao = new Dao();
List<Student> s = dao.fetchAllStudents();
%>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Password</th>
<th>Action</th>
</tr>

<% for(Student s1 : s){ %>

<tr>
<td><%=s1.getId()%></td>
<td><%=s1.getName()%></td>
<td><%=s1.getEmail()%></td>
<td><%=s1.getCourse() %></td> <!-- OR s1.getCourse() -->
<td><%=s1.getPass()%></td>

<td>
<a class="delete" href="deleteStd?sid=<%=s1.getId()%>">
Delete
</a>
</td>
</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>