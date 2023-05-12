package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMbapper implements RowMapper<Product> {

    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException{
        return new Product (rs.getInt("id"),
                rs.getString("category"),
                rs.getString("name"),
                rs.getInt("price"),
                rs.getString("model"),
                rs.getString("color"));
    }

}
