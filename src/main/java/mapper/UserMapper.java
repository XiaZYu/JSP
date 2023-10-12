package mapper;

import entity.User;

import java.util.List;

public interface UserMapper {
    List<User> queryById();
    User queryByName(String name);
    int insertUser(User user);

    int updateUser(User user);
}
