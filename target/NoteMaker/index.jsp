        <%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.entities.Note" %>
<%@ page import="java.util.List" %>


<!doctype html>
<html lang="en">
<head>
    <%@include file ="all_js_css.jsp"%>
    <title>Note Maker</title>
</head>
<body>
<div class="container-fluid p-0 m-0">
    <%@include file = "navbar.jsp"%>
</div>

<!-- Header Section -->
<header class="text-white text-center py-5 purple">
    <h1 class="display-4">Welcome to Note Maker!</h1>
    <p class="lead">Capture your thoughts, ideas, and tasks effortlessly</p>
</header>

<!-- Body Section -->
<div class="container my-5">
    <div class="row">
        <!-- Quick Actions -->
        <div class="col-md-4 text-center">
            <h3 class="mb-4">Quick Actions</h3>
            <a href="add_notes.jsp" class="btn btn-success btn-block mb-3">Create New Note</a>
            <a href="show_notes.jsp" class="btn btn-info btn-block mb-3">View All Notes</a>
            <a href="index.jsp" class="btn btn-warning btn-block">Go To Home</a>
        </div>

        <%
                Session session3 = FactoryProvider.getFactory().openSession();
                session3.beginTransaction();
                Query query = session3.createQuery("FROM Note");
                query.setMaxResults(2);
                List<Note> notes = query.list();
                Note list1 = notes.getFirst();
                Note list2 = notes.getLast();
                session3.getTransaction().commit();
                session3.close();

        %>
        <!-- Featured Notes Section -->
        <div class="col-md-8">
            <h3 class="mb-4">Your Recent Notes</h3>
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%=list1.getTitle()%></h5>
                    <p class="card-text"><%=list1.getContent()%></p>
                    <a href="show_notes.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%=list2.getTitle()%></h5>
                    <p class="card-text"><%=list2.getContent()%></p>
                    <a href="show_notes.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Motivation Section -->
<section class="bg-light py-5">
    <div class="container text-center">
        <h2 class="mb-4">"An idea is a fleeting thought unless written down"</h2>
        <p class="lead">Stay organized, stay productive, stay ahead.</p>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 Note Maker | All rights reserved.</p>
</footer>

</body>
</html>
