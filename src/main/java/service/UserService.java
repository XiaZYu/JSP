package service;

import entity.User;
import entity.vo.MessageModel;
import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import until.GetSqlSession;
import until.StringUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
        u.setAvatar("./resource/avatar/Multiavatar-e9c70f6307083f90fa.png");

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

    public MessageModel userUpdate(int id, String username, String password, String email, String phone){
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
        if (!email.matches("^(\\w+([-.][A-Za-z0-9]+)*){3,18}@\\w+([-.][A-Za-z0-9]+)*\\.\\w+([-.][A-Za-z0-9]+)*$")){
            messagemodel.setCode(1);
            System.out.println("邮箱格式错误");
            messagemodel.setMsg("邮箱格式错误");
            return messagemodel;
        }
        if (!phone.matches("^[1][3,4,5,7,8][0-9]{9}$")){
            messagemodel.setCode(1);
            System.out.println("电话格式错误");
            messagemodel.setMsg("电话格式错误");
            return messagemodel;
        }

        //返回数据
        u.setId(id);
        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);
        u.setPhone(phone);

        //调用dao层
        SqlSession session = GetSqlSession.getSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        int code = userMapper.updateUser(u);

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

    public MessageModel userAddDay(int id,String time) {
        MessageModel messagemodel = new MessageModel();

        SqlSession session = GetSqlSession.getSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        String today= new SimpleDateFormat("yyyy-MM-dd").format(new Date());


        if (today.compareTo(time) > 0){
            int a = userMapper.addDay(id);
            u = userMapper.queryById(id);
            //提交数据
            session.commit();
        }else{
            messagemodel.setCode(1);
            messagemodel.setMsg("请勿重复签到");
            return messagemodel;
        }
        session.close();

        messagemodel.setCode(0);
        messagemodel.setObject(u);
        messagemodel.setMsg("签到成功");
        return messagemodel;
    }
}
