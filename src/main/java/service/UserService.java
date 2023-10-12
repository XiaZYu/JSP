package service;

import entity.User;
import entity.vo.MessageModel;
import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import until.GetSqlSession;
import until.StringUtil;

public class UserService {
    MessageModel messagemodel = new MessageModel();
    User u = new User();

    public MessageModel userLogin(String username, String password) {

        //返回数据

        u.setUsername(username);
        u.setPassword(password);
        messagemodel.setObject(u);

            //判断字符串是否为空
        if (StringUtil.isEmpty(username) || StringUtil.isEmpty(password)){
            messagemodel.setCode(1);
            messagemodel.setMsg("用户名或密码不能为空");
            return messagemodel;
        }

            //调用dao层
        SqlSession session = GetSqlSession.getSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryByName(username);
        session.close();

        if (user == null || !user.getPassword().equals(password)){
            messagemodel.setCode(1);
            messagemodel.setMsg("用户或密码不正确");
            return messagemodel;
        }

        //登录成功
        messagemodel.setCode(0);
        messagemodel.setObject(user);

        return messagemodel;
    }

    public MessageModel userRegister(String username, String password) {

        //返回数据
        u.setUsername(username);
        u.setPassword(password);

        //判断字符串是否为空
        if (StringUtil.isEmpty(username) || StringUtil.isEmpty(password)){
            messagemodel.setCode(1);
            messagemodel.setMsg("用户名或密码不能为空");
            return messagemodel;
        }

        //调用dao层
        SqlSession session = GetSqlSession.getSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryByName(username);

        //判断用户名是否存在
        if (user != null){
            messagemodel.setCode(1);
            System.out.println("用户名已存在");
            messagemodel.setMsg("用户名已存在");
            return messagemodel;
        }
        //判断用户名和密码格式是否正确
        if (!username.matches("^[\\u4e00-\\u9fa5a-zA-Z0-9]{0,11}$")){
            messagemodel.setCode(1);
            System.out.println("用户名格式错误");
            messagemodel.setMsg("用户名格式错误");
            return messagemodel;
        }
        if (!password.matches("^[(?=.*?[0-9])(?=.*?[a-z])]{6,20}$")){
            messagemodel.setCode(1);
            System.out.println("密码格式错误");
            messagemodel.setMsg("密码格式错误");
            return messagemodel;
        }

        int code = userMapper.insertUser(u);
        //提交数据
        session.commit();
        //关闭会话
        session.close();

        //判断是否注册成功
        if (code == 0){
            messagemodel.setCode(1);
            messagemodel.setMsg("注册失败");
            return messagemodel;
        }else{
            messagemodel.setCode(0);
            messagemodel.setObject(u);
        }

        return messagemodel;
    }
}
