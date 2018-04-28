package org.video.service.impl;

import org.video.dao.UserDao;
import org.video.entity.User;
import org.video.service.UserService;
import org.springframework.stereotype.Service;
import org.video.util.UserUtils;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by shiyanfei on 2018-04-26.
 */
@Service
public class UserServiceImpl implements UserService{

    @Resource
    private UserDao userDao;

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public List<User> findAllByCondition(String mobile) {
        return userDao.findAllByCondition(mobile);
    }

    @Override
    public User login(String username, String password) {
        return userDao.login(username,password);
    }

    @Override
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    public int add(User user) {
        user.setRoleId(UserUtils.ROLE_CLIENT);
        return userDao.add(user);
    }

    @Override
    public int update(User user) {

        return userDao.update(user);
    }

    @Override
    public int deleteById(int userId) {

        return userDao.deleteById(userId);
    }
}
