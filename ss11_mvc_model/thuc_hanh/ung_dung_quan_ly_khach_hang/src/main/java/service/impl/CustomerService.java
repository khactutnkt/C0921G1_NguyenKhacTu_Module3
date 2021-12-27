package service.impl;

import bean.Customer;
import reponsitory.ICustomerRepository;
import reponsitory.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {

    //DI
    private ICustomerRepository iCustomerRepository = new CustomerRepository();


    @Override
    public List<Customer> findAll() {
        return this.iCustomerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        this.iCustomerRepository.save(customer);

    }

    @Override
    public Customer findById(int id) {
        return this.iCustomerRepository.findById(id);
    }

    @Override
    public void update(int id, Customer customer) {
        this.iCustomerRepository.update(id, customer);
    }

    @Override
    public void remove(int id) {
        this.iCustomerRepository.remove(id);

    }
}
