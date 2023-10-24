package mapper;

import entity.User;


public interface UserMapper {
    User queryByName(String name);

    int insertUser(User user);

    int updateUser(User user);

    int addDay(int id);

    User queryById(int id);
}
