
import entity.vo.MessageModel;
import mapper.UserMapper;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import service.ArticleService;
import service.UserService;
import until.GetSqlSession;

import java.util.List;
import java.util.concurrent.ForkJoinPool;

public class UserTest {
    @Test
    public void find(){
        ArticleService articleService = new ArticleService();
        MessageModel messageModel = articleService.articleFindById("10001");
        System.out.println(messageModel.getObject());
}
}