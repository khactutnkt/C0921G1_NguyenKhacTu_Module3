package repository;

import bean.User;

import java.util.List;

public interface IUserRepository {
    List<User> selectAll();
    void insertUser(User user);
    boolean updateUser(User user);

}
