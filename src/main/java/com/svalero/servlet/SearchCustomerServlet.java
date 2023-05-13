package com.svalero.servlet;


import com.svalero.dao.CustomerDAO;
import com.svalero.dao.Database;
import com.svalero.domain.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search-customer")
@MultipartConfig
public class SearchCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Customer> searchCustomer = Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                return dao.getFilterCustomers(name, surname);
            });

            out.println("<div class='grid' style='display: grid; grid-template-columns: auto auto auto; justify-content: space-around; align-content: space-around;'>");
            for (Customer customer : searchCustomer){
                out.println("<div class='card' style='width: 20rem; margin: 20px; padding: 10px;>");

                    out.println("<div class='card-body'>");
                    out.println("<h5 class='card-title'>" + customer.getName() + "</h5>");
                    out.println("<h5 class='card-title'>" + customer.getSurname() + "</h5>");
                    out.println("<p class='card-text'>Telephone: " + customer.getTelephone() + "</p>");

                    out.println("<div class='card-body' style='display: flex; justify-content: space-evenly;'>");
                    out.println("<a href=view-details-customers.jsp?id_customer=" + customer.getId_customer() + " class='btn btn-info'>Details</a>");
                    out.println("<a href=customer-form.jsp?id_customer=" + customer.getId_customer() + "&action=edit&name=" + customer.getName() + "&surname=" + customer.getSurname()  + "&telephone=" + customer.getTelephone() + " class='btn btn-primary'>Edit</a>");
                    out.println("<a href=remove-customer?id_customer=" + customer.getId_customer() + " class='card-link'><button type='button' class='btn btn-danger'>Eliminar cliente</button></a>");
                    out.println("</div>");

                out.println("</div>");
            }
            out.println("</div>");

        } catch (ClassNotFoundException cnfe){
            cnfe.printStackTrace();
        }
    }
}
