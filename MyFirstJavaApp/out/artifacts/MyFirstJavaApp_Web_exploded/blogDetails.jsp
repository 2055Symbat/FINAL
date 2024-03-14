<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="model.Blog" %>
<html>
<head>
    <title>Title</title>
    <%@include file="links.jsp"%>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br>
    <%
        Blog blog = (Blog) request.getAttribute("blogDetails");
        if (blog!=null){
    %>
    <div class="card w-75">
        <div class="card-body">
            <h5 class="card-title"><%=blog.getTitle()%></h5>
            <p class="card-text"><%=blog.getContent()%></p>
            <p><%=blog.getUser().getFullName()+"/"+blog.getUser().getEmail()%></p>
            <p><%=blog.getPostDate()%></p>
            <br>
            <%
                if (user!=null){
            %>
            <form action="/addComment" method="post">
                <input type="hidden" value="<%=blog.getId()%>" name="blogId">
                <textarea class="form-control" name="commentText"></textarea>
                <br>
                <button class="btn btn-success">SUBMIT</button>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <%}%>
</div>
</body>
</html>
