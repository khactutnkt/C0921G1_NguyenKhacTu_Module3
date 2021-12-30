package service;

import bean.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();
    void insertCustomer(Customer customer);
    void updateCustomer(Customer customer);
    void deleteCustomer(String id);
}
