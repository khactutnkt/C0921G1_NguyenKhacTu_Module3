package service.impl;

import bean.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> selectAllCustomer() {
        return this.customerRepository.selectAllCustomer();
    }

    @Override
    public void insertCustomer(Customer customer) {
        this.customerRepository.insertCustomer(customer);
    }

    @Override
    public void updateCustomer(Customer customer) {
        this.customerRepository.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(String id) {
        this.customerRepository.deleteCustomer(id);
    }
}
