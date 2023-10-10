package service;

import entity.User;
import entity.vo.MessageModel;
import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import until.GetSqlSession;
import until.StringUtil;

public class UserService {
    public MessageModel userLogin(String username, String password) {
        MessageModel messagemodel = new MessageModel();

        //返回数据
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        messagemodel.setObject(u);

            //判断字符串是否为空
        if (StringUtil.isEmpty(username) || StringUtil.isEmpty(password)){
            messagemodel.setCode(0);
            messagemodel.setMsg("用户名或密码不能为空");
            return messagemodel;
        }
            //调用dao层
        SqlSession session = GetSqlSession.getSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryByName(username);
        session.close();

        if (user == null){
            messagemodel.setCode(0);
            messagemodel.setMsg("用户名不存在");
            return messagemodel;
        }
        if (!user.getPassword().equals(password)){
            messagemodel.setCode(0);
            messagemodel.setMsg("用户密码不正确");
            return messagemodel;
        }

        //登录成功
        messagemodel.setObject(user);

        return messagemodel;
    }
}
