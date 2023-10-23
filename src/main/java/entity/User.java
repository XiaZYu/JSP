package entity;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String article_numb;
    private String avatar;
    private String day;

    @Override
    public String toString() {
        return "{" +
                "'id':" + id +
                ", 'username':'" + username + '\'' +
                ", 'password':'" + password + '\'' +
                ", 'email':'" + email + '\'' +
                ", 'phone':'" + phone + '\'' +
                ", 'article_numb':'" + article_numb + '\'' +
                ", 'avatar':'" + avatar + '\'' +
                ", 'day':'" + day + '\'' +
                '}';
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getArticle_numb() {
        return article_numb;
    }

    public void setArticle_numb(String article_numb) {
        this.article_numb = article_numb;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String name) {
        this.username = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
