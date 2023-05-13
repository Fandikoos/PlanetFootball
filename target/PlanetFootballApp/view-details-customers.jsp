<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>


<%
    int customerId = Integer.parseInt(request.getParameter("id_customer"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Customer customer = Database.jdbi.withExtension(CustomerDAO.class, dao -> dao.getCustomer(customerId));
%>

<body>
    <div style="display: flex; justify-content: center; align-items: center; padding-top: 150px;">
        <div class="container_details">
            <div class="card" style="width: 18rem; border: 3px solid black;">
              <div class="card-body">
                <h5 class="card-title"></h5>
                <p class="card-text">More details about the customer <b></b></p>
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item"><b> Id: </b><%= customer.getId_customer() %></li>
                <li class="list-group-item"><b> Name: </b><%= customer.getName() %></li>
                <li class="list-group-item"><b> Surname: </b><%= customer.getSurname() %> </li>
                <li class="list-group-item"><b> Telephone: </b><%= customer.getTelephone() %></li>

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