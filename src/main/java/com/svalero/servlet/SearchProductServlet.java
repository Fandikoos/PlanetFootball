package com.svalero.servlet;


import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import com.svalero.domain.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search-product")
public class SearchProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String category = request.getParameter("category");
        String model = request.getParameter("model");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Product> searchProduct = Database.jdbi.withExtension(ProductDAO.class, dao -> {
                return dao.getFilterProducts(category, model);
            });

            out.println("<div class='grid' style='display: grid; grid-template-columns: auto auto auto; justify-content: space-around; align-content: space-around;'>");
            for (Product product : searchProduct) {
                out.println("<div class='card' style='width: 20rem; margin: 20px; padding: 10px;>");

                    out.println("<div class='card-body'>");
                    out.println("<h5 class='card-title'>" + product.getName() + "</h5>");
                    out.println("<p class='card-text'>Model: " + product.getModel() + " uds.</p>");
                    out.println("<p class='card-text'>Price: " + product.getPrice() + " $</p>");
                    out.println("<p class='card-text'>Category: " + product.getCategory() + " </p>");


                    out.println("<div class='card-body' style='display: flex; justify-content: space-evenly;'>");
                    out.println("<a href=view-details.jsp?id=" + product.getId() + " class='btn btn-info'>Details</a>");
                    out.println("<a href=product-form.jsp?id=" + product.getId() + "&action=edit&name=" + product.getName() + "&price=" + product.getPrice() + "&category=" + product.getCategory() + "&model=" + product.getModel() + " class='btn btn-primary'>Edit</a>");
                    out.println("<a href=remove-product?id=" + product.getId() + " class='card-link'><button type='button' class='btn btn-danger'>Delete</button></a>");
                    out.println("</div>");

                out.println("</div>");

            }
            out.println("</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
