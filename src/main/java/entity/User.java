package entity;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String phone;
    @Override
    public String toString() {
        return "{" +
                "'id':" + id +
                ", 'username':'" + username + '\'' +
                ", 'password':'" + password + '\'' +
                ", 'email':'" + email + '\'' +
                ", 'phone':'" + phone + '\'' +
                '}';
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
