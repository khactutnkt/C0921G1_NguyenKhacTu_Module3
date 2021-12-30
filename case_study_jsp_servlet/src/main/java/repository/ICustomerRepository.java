package repository;

import bean.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> selectAllCustomer();
    void insertCustomer(Customer customer);
    void updateCustomer(Customer customer);
    void deleteCustomer(String id);
}
