<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file = "includes/header.jsp"%>

<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    if (name == null) name = "";
    String price = request.getParameter("price");
    if (price == null) price = "";
    String category = request.getParameter("category");
    if (category == null) category = "";
    String model = request.getParameter("model");
    if (model == null) model = "";
    String color = request.getParameter("color");
    if (color == null) color = "";
%>

<main>
    <div class= "container">
        <br/>

        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">New client</li>
          </ol>
        </nav>

        <form class="row g-3" method="post" action="edit-product" enctype="multipart/form-data">
          <div class="row mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value='<%= name %>'>
          </div>
          <div class="row mb-3">
                <label for="price" class="form-label">Surnames</label>
                <input type="text" class="form-control" id="price" name="price" value='<%= price %>'>
          </div>
          <div class="row mb-3">
                <label for="category" class="form-label">Address</label>
                <input type="text" class="form-control" id="category" name="category" value='<%= category %>'>
          </div>
          <div class="row mb-3">
               <label for="model" class="form-label">Phone number</label>
               <input type="text" class="form-control" id="model" name="model" value='<%= model %>'>
          </div>
          <div class="row mb-3">
            <label for="color" class="form-label">Email</label>
            <input type="text" class="form-control" id="color" name="color" value='<%= color %>'>
          </div>

          <div class="row mb-3">
            <label for="image" class="form-label">Imagen</label>
            <input type="file" class="form-control" id="image" name="image">
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Accept data protection</label>
          </div>

       <input type="hidden" name="action" value="<%= action %>"/>
       <%
       if (action.equals("edit")) {
          int id = Integer.parseInt(request.getParameter("id"));
       %>
        <input type="hidden" name="id" value="<%= id %>"/>
      <%
       }
       %>
       <div class="col-12">
       <input type="submit" value="<%= action %>"/>
       </div>

       </form>
       <br/>
       <div id="result"></div>
    </div>
</main>
<%@include file = "includes/footer.jsp"%>