package until;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class GetSqlSession {
    public  static SqlSession getSqlSession(){
        try {
            //加载mybatis的配置文件
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            //通过sqlSession工厂创建者build出一个数据库会话工程
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            //打开一个数据库会话
            SqlSession session = sqlSessionFactory.openSession();
            return session;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        System.out.println(GetSqlSession.getSqlSession());
    }
}
