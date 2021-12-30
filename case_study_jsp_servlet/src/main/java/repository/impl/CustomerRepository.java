package repository.impl;

import bean.Customer;
import bean.User;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "select * from customer where exist=1;";
    private static final String INSERT_CUSTOMER = "insert into customer(customer_id, customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) values (?, ?, ?, ?, ?, ?, ?, ?, ?);";

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_CUSTOMER);
            Customer customerObj = null;
            while (resultSet.next()){
                customerObj = new Customer();
                customerObj.setId(resultSet.getString("customer_id"));
                customerObj.setTypeId(resultSet.getInt("customer_type_id"));
                customerObj.setName(resultSet.getString("customer_name"));
                customerObj.setBirthday(resultSet.getString("customer_birthday"));
                customerObj.setGender(resultSet.getByte("customer_gender"));
                customerObj.setIdCard(resultSet.getString("customer_id_card"));
                customerObj.setPhone(resultSet.getString("customer_phone"));
                customerObj.setEmail(resultSet.getString("customer_email"));
                customerObj.setAddress(resultSet.getString("customer_address"));

                customerList.add(customerObj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void insertCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setInt(2, customer.getTypeId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setByte(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void updateCustomer(Customer customer) {

    }

    @Override
    public void deleteCustomer(String id) {

    }
}
