package service.impl;

import bean.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> selectAll() {
        return this.userRepository.selectAll();
    }

    @Override
    public void insertUser(User user) {
        this.userRepository.insertUser(user);
    }
}
