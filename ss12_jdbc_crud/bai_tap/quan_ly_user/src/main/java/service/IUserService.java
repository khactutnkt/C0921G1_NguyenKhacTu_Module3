package service;

import bean.User;

import java.util.List;

public interface IUserService {
    List<User> selectAll();
    void insertUser(User user);
    boolean updateUser(User user);
}
