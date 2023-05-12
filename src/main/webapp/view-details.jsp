<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>


<%
    int productId = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Product product = Database.jdbi.withExtension(ProductDAO.class, dao -> dao.getProduct(productId));
%>
<body>
    <div style="display: flex; justify-content: center; align-items: center; padding-top: 150px;">
        <div class="container_details">
            <div class="card" style="width: 18rem; border: 3px solid black;">
              <img src="" class="card-img-top" alt="Product image">
              <div class="card-body">
                <h5 class="card-title"></h5>
                <p class="card-text">More details about the product <b></b></p>
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item"><b> Id: </b><%= product.getId() %></li>
                <li class="list-group-item"><b> Name: </b><%= product.getName() %></li>
                <li class="list-group-item"><b> Price: </b><%= product.getPrice() %> $</li>
                <li class="list-group-item"><b> Category: </b><%= product.getCategory() %></li>
                <li class="list-group-item"><b> Model: </b><%= product.getModel() %></li>
                <li class="list-group-item"><b> Color: </b><%= product.getColor() %></li>

              </ul>
              <div class="card-body" style="text-align: center;">
                <a href="index.jsp" class="card-link" style="text-decoration: none; color: rgb(139, 95, 0);"><b>Index Products</b></a>
              </div>
              <div class="card-body" style="text-align: center;">
                <a href="customer-index.jsp" class="card-link" style="text-decoration: none; color: rgb(139, 95, 0);"><b>Index Clients</b></a>
              </div>
          </div>
        </div>
    </div>
</body>

<%@ include file="includes/footer.jsp"%>