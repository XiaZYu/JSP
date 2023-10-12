package mapper;

import entity.User;

import java.util.List;

public interface UserMapper {
    User queryByName(String name);

    int insertUser(User user);

    int updateUser(User user);
}
