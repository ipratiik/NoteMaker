<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="com.entities.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <head>
    <%@include file ="all_js_css.jsp"%>
    <title>Edit Note</title>
  </head>
</head>
<body>
<div class="container-fluid p-0 m-0">
  <%@include file = "navbar.jsp"%>
</div>
<div style="text-align: center;margin-top: 20px"><h1>Edit Your Note</h1></div>
<%--Here Our Form Starts--%>
<%int noteId = Integer.parseInt(request.getParameter("note_id").trim());
  Session session2 = FactoryProvider.getFactory().openSession();
  Note note = session2.get(Note.class,noteId);
%>
<div class="container" style="width: 800px;margin-top: 50px">
  <form action="updateServlet" method="post">
    <input value="<%=note.getId()%>" name="noteId" type="hidden"/>
    <div class="mb-3">
      <label for="title" class="form-label">Title</label>
      <input required name="title" type="text" class="form-control" id="title" placeholder="Enter Title Here...." value="<%=note.getTitle()%>">
    </div>
    <div class="mb-3">
      <label for="content" class="form-label">Description</label>
      <textarea required name="content" class="form-control" id="content" style="height: 300px" placeholder="Enter Description Here...."><%=note.getContent()%></textarea>
    </div>
    <button type="submit" class="btn btn-success" style="margin-left: 360px">Save</button>
  </form>
</div>


</body>
</html>
