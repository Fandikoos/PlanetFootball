package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ProductDAO {

    @SqlQuery("SELECT * FROM productos")
    @UseRowMapper(ProductMbapper.class)
    List<Product> getProducts();

    @SqlQuery("SELECT * FROM productos WHERE id_product= ?")
    @UseRowMapper(ProductMbapper.class)
    Product getProduct(int id_product);

    @SqlUpdate("INSERT INTO productos (category, name, price, model, color, image) VALUES (?, ?, ?, ?, ?, ?)")
    void addProduct(String category, String name, int price, String model, String color, String image);

    @SqlUpdate("DELETE FROM productos WHERE id_product = ?")
    void removeProduct(int id_product);

    @SqlUpdate("UPDATE productos SET name = ? AND model = ?")
    @UseRowMapper(ProductMbapper.class)
    List<Product> getFilterProducts(String name, String model);
}
