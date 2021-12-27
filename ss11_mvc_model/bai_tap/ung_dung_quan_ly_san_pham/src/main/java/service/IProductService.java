package service;

import bean.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    Product findById(Integer id);

    void save(Product product);

    Product findByName(String name);

    void update(int id, Product product);

    void remove(int id);
}
