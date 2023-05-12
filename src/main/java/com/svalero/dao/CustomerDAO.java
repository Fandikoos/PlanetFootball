package com.svalero.dao;

import com.svalero.domain.Customer;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CustomerDAO {

    @SqlQuery("SELECT * FROM clientes")
    @UseRowMapper(CustomerMbapper.class)
    List<Customer> getCustomers();

}