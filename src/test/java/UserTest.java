
import mapper.UserMapper;
import entity.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import until.GetSqlSession;

import java.util.List;

public class UserTest {
    @Test
    public void find(){
            SqlSession session = GetSqlSession.getSqlSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            List<User> list = userMapper.findAll();
            //打印返回值信息
            for (User user : list) {
                System.out.println(user.toString());
            }
            //提交会话
            session.commit();
            //关闭会话
            session.close();
    }
}