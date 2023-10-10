package mapper;

import entity.User;

public interface UserMapper {

    User queryByName(String name);

    int insertUser(User user);
}
