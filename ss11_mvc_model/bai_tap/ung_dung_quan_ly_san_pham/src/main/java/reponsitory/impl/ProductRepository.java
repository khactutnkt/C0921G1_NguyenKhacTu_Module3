package reponsitory.impl;

import bean.Product;
import reponsitory.IProductRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRepository implements IProductRepository {
    static Map<Integer, Product> productMap;
    static {
        productMap = new TreeMap<>();
        productMap.put(1, new Product(1, "Iphone 11", 12000.0, 100, "USA"));
        productMap.put(2, new Product(2, "Iphone 12", 15000.0, 500, "USA"));
        productMap.put(3, new Product(3, "Iphone 7", 9000.0, 20, "USA"));
        productMap.put(4, new Product(4, "Sony Z3", 10000.0, 25, "Korea"));
        productMap.put(5, new Product(5, "Xiaomi 10", 11000.0, 70, "China"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(Integer id) {
        return productMap.get(id);
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product findByName(String name) {
        return null;
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }
}
