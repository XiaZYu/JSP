
import mapper.UserMapper;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import until.GetSqlSession;

import java.util.List;
import java.util.concurrent.ForkJoinPool;

public class UserTest {
    @Test
    public void find(){
       System.out.println(!"2222".matches("^[(?=.*?[0-9])(?=.*?[a-z])(?=.*?[A-Z])]{6,20}$"));
}
}