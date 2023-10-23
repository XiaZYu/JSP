package service;

import entity.Article;
import entity.vo.MessageModel;
import mapper.ArticleMapper;
import org.apache.ibatis.session.SqlSession;
import until.GetSqlSession;

import java.util.List;

public class ArticleService {
    MessageModel messageModel = new MessageModel();

    Article article = new Article();

    public  MessageModel articleFindAll(){
        //调用dao层
        SqlSession session = GetSqlSession.getSqlSession();
        ArticleMapper articleMapper =  session.getMapper(ArticleMapper.class);
        List article = articleMapper.queryAll();
        session.close();

        if(article == null){
            messageModel.setMsg("查询失败，请重试");
            messageModel.setCode(1);
            return messageModel;
        }

        messageModel.setCode(0);
        messageModel.setObject(article);

        return messageModel;
    }
}
