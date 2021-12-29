package repository.impl;

import bean.User;
import repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String SELECT_ALL_USER = "select * from users;";
    private static final String INSERT_USER = "insert into users(`name`, email, country) values (?, ?, ?);";

    @Override
    public List<User> selectAll() {
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = BaseRepository.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_USER);
            User userObj = null;
            while (resultSet.next()){
                userObj = new User();
                userObj.setName(resultSet.getString("name"));
                userObj.setEmail(resultSet.getString("email"));
                userObj.setCountry(resultSet.getString("country"));
                userList.add(userObj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public void insertUser(User user) {
        try {
            PreparedStatement preparedStatement = BaseRepository.connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }
}
