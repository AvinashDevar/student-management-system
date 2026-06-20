<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background: #0f172a;
    color: white;
}

/* NAVBAR */
.navbar {
    background: #1e293b;
    padding: 15px;
    display: flex;
    justify-content: space-between;
}

.navbar h2 {
    color: #ff7a18;
}

.logout {
    background: red;
    padding: 8px 15px;
    border: none;
    color: white;
    cursor: pointer;
}

/* CONTENT */
.container {
    padding: 30px;
}

/* CARDS */
.cards {
    display: flex;
    gap: 20px;
    margin-top: 20px;
}

.card {
    background: #1e293b;
    padding: 20px;
    border-radius: 10px;
    width: 200px;
    text-align: center;
    cursor: pointer;
    transition: 0.3s;
}

.card:hover {
    background: #2563eb;
}

/* USER INFO */
.user {
    margin-top: 10px;
    font-size: 18px;
}

/* TRAINER SECTION */
#trainerSection {
    margin-top: 40px;
}

#trainerList {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
}

#trainerList .card {
    width: 220px;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Student Dashboard</h2>

    <form action="login.jsp" method="post">
        <button class="logout">Logout</button>
    </form>
</div>

<!-- CONTENT -->
<div class="container">

    <h3>Welcome, <%=session.getAttribute("sname") %> 👋</h3>

    <div class="user">
        <h3>Email: <%=session.getAttribute("semail") %></h3>
    </div>

    <h2>Available Courses</h2>

    <div class="cards">

        <div class="card" onclick="showTrainer('Java')">
            <h3>Java</h3>
        </div>

        <div class="card" onclick="showTrainer('Adv Java')">
            <h3>Adv Java</h3>
        </div>

        <div class="card" onclick="showTrainer('SQL')">
            <h3>SQL</h3>
        </div>

        <div class="card" onclick="showTrainer('Python')">
            <h3>Python</h3>
        </div>

    </div>

    <!-- ✅ Trainer Section -->
    <div id="trainerSection">
        <h2 id="courseTitle"></h2>
        <div id="trainerList"></div>
    </div>

</div>

<script>
function showTrainer(course){

    let title = document.getElementById("courseTitle");
    let list = document.getElementById("trainerList");

    title.innerText = "Trainers for " + course;

    let data = "";

    if(course === "Java"){
        data = `
        <div class="card">
            <h3>Shreya mam</h3>
            <p>Email: Shreaya@gmail.com</p>
        </div>
        <div class="card">
            <h3>Manoj Sir</h3>
            <p>Email: manoj@gmial.com</p>
        </div>`;
    }
    else if(course === "Adv Java"){
        data = `
        <div class="card">
            <h3>Shreya mam</h3>
            <p>Email: Shreaya@gmail.com</p>
        </div>`;
    }
    else if(course === "SQL"){
        data = `
        <div class="card">
            <h3>pradeep sir</h3>
            <p>Email: praddep@gmail.com</p>
        </div>`;
    }
    else if(course === "Python"){
        data = `
        <div class="card">
            <h3>Ankit Sir</h3>
            <p>Email: ankit@python.com</p>
        </div>`;
    }

    list.innerHTML = data;

    // ✅ Smooth scroll
    document.getElementById("trainerSection").scrollIntoView({behavior: "smooth"});
}
</script>

</body>
</html>