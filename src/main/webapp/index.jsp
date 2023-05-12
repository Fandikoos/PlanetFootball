<%@ page import="com.svalero.dao.Database"%>
<%@ page import="com.svalero.dao.ProductDAO"%>
<%@ page import="com.svalero.domain.Product"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<main>

<div class="px-4 py-5 my-5 text-center">
    <img class="d-block mx-auto mb-4" src="https://img.freepik.com/vector-premium/futbol-diseno-logotipo-tienda-mercado-ilustracion-bolsa-compras_567637-384.jpg?w=2000" alt="" width="150" height="150">
    <h1 class="display-5 fw-bold text-body-emphasis">Planet Football</h1>
    <div class="col-lg-6 mx-auto">
      <p class="lead mb-4">Welcome to Planet Football App, since here you can register customers, products, list...</p>
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
        <a href="product-form.jsp"><button type="button" class="btn btn-outline-primary btn-lg px-4">Register product</button></a>
        <button type="button" class="btn btn-outline-primary btn-lg px-4">Register client</button>
        <a href=""><button type="button" class="btn btn-outline-secondary btn-lg px-4">Search for product</button></a>
        <button type="button" class="btn btn-outline-secondary btn-lg px-4">All our clients</button>

      </div>
    </div>
  </div>

    <div class = "grid">
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Product> productList = Database.jdbi.withExtension(ProductDAO.class, ProductDAO::getProducts);
            for (Product product : productList) {
        %>
            <div class="card" style="width: 24rem;">
              <div class="imagen-container">
                <img src="" class="card-img-top" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"> <%= product.getName() %> </h5>
                <h5 class="card-title"> <%= product.getModel() %> </h5>

                <p class="card-text"> <%= product.getPrice() %></p>
                <p class="card-text"> <%= product.getCategory() %></p>

              </div>
              <div class="botones">
                <a href="" class="btn btn-info">Details</a>
                <a href="" class="btn btn-primary">Edit</a>
                <a href="" class="btn btn-danger">Delete</a>
              </div>

            </div>
        <%
            }
        %>
    </div>

</main>

<%@include file="includes/footer.jsp"%>