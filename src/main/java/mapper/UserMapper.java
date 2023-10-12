package mapper;

import entity.User;

import java.util.List;

public interface UserMapper {
    List<User> queryAll();

    User queryByName(String name);

    int insertUser(User user);
}
