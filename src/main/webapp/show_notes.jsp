<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Note" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file ="all_js_css.jsp"%>
    <title>View Notes</title>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status=="savedNotes"){
        swal("Congrats","Note Successfully Added.","success");
    }
    if(status=="editedNotes"){
        swal("Congrats","Note Edited Successfully.","success");
    }
</script>
<div class="container-fluid p-0 m-0">
    <%@include file = "navbar.jsp"%>
    <h1 style="text-align: center; font-size: 60px;margin-top: 20px">Notes</h1>
    <div class = "row">
        <div class="col-12">
            <%
                Session session1 = FactoryProvider.getFactory().openSession();
                Query query = session1.createQuery("from Note");
                List<Note> list = query.getResultList();
                for(Note a: list){
            %>
            <div class="card" style="width: 50rem;margin-left: 340px;margin-top: 3rem;margin-bottom:2rem;">
                <img src="img/notes.png" class="card-img-top m-4 mx-auto" style="width:100px;" alt="...">
                <div class="card-body px-5">
                    <h5 class="card-title"><%= a.getTitle()%></h5>
                    <p class="card-text"><%= a.getContent()%></p>
                    <%String newstring = new SimpleDateFormat("HH:mm, d MMM, EEE").format(a.getAddeddate());%>
                    <p><b class="text-primary"><%=newstring%></b></p>
                    <div class="container text-center mt-3">
                        <a href="deleteServlet?note_id=<%=a.getId()%>" class="btn btn-danger">Delete</a>
                        <a href="editNote.jsp?note_id=<%=a.getId()%>" class="btn btn-primary">Update</a>
                    </div>
                </div>
            </div>
            <%
                }
                session1.close();
            %>
        </div>
    </div>
</div>
</body>
</html>
