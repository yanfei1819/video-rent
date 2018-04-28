package org.video.service;

import org.video.entity.User;

import java.util.List;

/**
 * Created by shiyanfei on 2018/4/26.
 */
public interface UserService {

    List<User> findAll();

    List<User> findAllByCondition(String mobile);

    User login(String username,String password);

    User findById(int id);

    int add(User user);

    int update(User user);

    int deleteById(int userId);
}
