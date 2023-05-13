<%@ page import="com.svalero.dao.Database"%>
<%@ page import="com.svalero.dao.CustomerDAO"%>
<%@ page import="com.svalero.domain.Customer"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<main>

<div class="px-4 py-5 my-5 text-center">
    <img class="d-block mx-auto mb-4" src="https://img.freepik.com/vector-premium/futbol-diseno-logotipo-tienda-mercado-ilustracion-bolsa-compras_567637-384.jpg?w=2000" alt="" width="150" height="150">
    <h1 class="display-5 fw-bold text-body-emphasis">Planet Football</h1>
    <div class="col-lg-6 mx-auto">
      <p class="lead mb-4">Welcome to Planet Football App, from here you can register customers, products, list...</p>
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
        <a href="product-form.jsp?action=register"><button type="button" class="btn btn-outline-primary btn-lg px-4">Register product</button></a>
        <a href="customer-form.jsp?action=register"<button type="button" class="btn btn-outline-primary btn-lg px-4">Register client</button>
        <a href="search-form-customers.jsp"><button type="button" class="btn btn-outline-secondary btn-lg px-4">Search for customer</button></a>
        <a href="index.jsp"><button type="button" class="btn btn-outline-secondary btn-lg px-4">All our products</button></a>

      </div>
    </div>
  </div>

    <div class = "grid">
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Customer> customerList = Database.jdbi.withExtension(CustomerDAO.class, CustomerDAO::getCustomers);
            for (Customer customer : customerList) {
        %>
            <div class="card" style="width: 24rem;">
              <div class="card-body">
                <h5 class="card-title"> <%= customer.getName() %> </h5>
                <h5 class="card-title"> <%= customer.getSurname() %> </h5>

                <p class="card-text"> <%= customer.getTelephone() %></p>

              </div>
              <div class="botones">
                <a href="view-details-customers.jsp?id_customer=<%=customer.getId_customer() %>" class="btn btn-info">Details</a>
                <a href="customer-form.jsp?id_customer=<%= customer.getId_customer() %>&action=edit&name=<%= customer.getName() %>&surname=<%= customer.getSurname() %>&telephone=<%= customer.getTelephone() %>" class="btn btn-primary">Edit</a>
                <a href="remove-customer?id_customer=<%= customer.getId_customer() %>" class="btn btn-danger">Delete</a>
              </div>

            </div>
        <%
            }
        %>
    </div>

</main>

<%@include file="includes/footer.jsp"%>