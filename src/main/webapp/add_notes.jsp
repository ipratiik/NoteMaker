<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <head>
    <%@include file ="all_js_css.jsp"%>
    <title>Add Notes</title>
  </head>
</head>
<body>
<div class="container-fluid p-0 m-0">
  <%@include file = "navbar.jsp"%>
</div>
<div style="text-align: center;margin-top: 20px"><h1>Enter Your Note</h1></div>
<%--Here Our Form Starts--%>
<div class="container" style="width: 800px;margin-top: 50px">
<form action="saveNoteServlet" method="post">
  <div class="mb-3">
    <label for="title" class="form-label">Title</label>
    <input required name="title" type="text" class="form-control" id="title" placeholder="Enter Title Here....">
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Description</label>
    <textarea required name="content" class="form-control" id="content" style="height: 300px" placeholder="Enter Description Here...."></textarea>
  </div>
  <button type="submit" class="btn btn-primary" style="margin-left: 360px">Submit</button>
</form>
</div>
</body>
</html>
