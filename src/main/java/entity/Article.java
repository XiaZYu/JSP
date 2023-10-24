package entity;

public class Article {
    private int article_id;
    private String title;
    private String author;
    private String publisher;
    private String content_pdf;
    private String photo;
    private String describe;
    private String likes;
    @Override
    public String toString() {
        return "{" +
                "article_id=" + article_id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", content_pdf='" + content_pdf + '\'' +
                ", photo='" + photo + '\'' +
                ", describe='" + describe + '\'' +
                ", likes='" + likes + '\'' +
                '}';
    }

    public String getLikes() {
        return likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getContent_pdf() {
        return content_pdf;
    }

    public void setContent_pdf(String content_pdf) {
        this.content_pdf = content_pdf;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }
}
