package mapper;

import entity.Article;

import java.util.List;

public interface ArticleMapper {
    List<Article> queryAll();

    List<Article> queryById(String id);
}
