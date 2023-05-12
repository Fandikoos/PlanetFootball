package com.svalero.servlet;


import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/edit-product")
@MultipartConfig
public class AddEditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse respose) throws ServletException, IOException {
        respose.setContentType("text/html");
        PrintWriter out = respose.getWriter();

        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String category = request.getParameter("category");
        String model = request.getParameter("model");
        String color = request.getParameter("color");

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int productId = id;
                Database.jdbi.withExtension(ProductDAO.class, dao -> {
                    dao.editProduct(name, price, category, model, color, productId);
                    return  null;
                });

            } else {
                Database.jdbi.withExtension(ProductDAO.class, dao -> {
                    dao.addProduct(name, price, category, model, color);
                    return null;
                });
            }

            respose.sendRedirect("index.jsp");
        }catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
