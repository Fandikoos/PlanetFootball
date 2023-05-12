package com.svalero.dao;

import com.svalero.domain.Customer;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CustomerDAO {

    @SqlQuery("SELECT * FROM clientes")
    @UseRowMapper(CustomerMbapper.class)
    List<Customer> getCustomers();

    @SqlUpdate("INSERT INTO clientes (name, surname, telephone) VALUE (?, ?, ?)")
    void addCustomer (String name, String surname, int phone);

    @SqlUpdate("UPDATE clientes SET name = ?, surname = ?, phone = ? WHERE id_customer = ?")
    void editCustomer(String name, String surname, int phone, int id_customer);

}
