package org.video.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.video.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by shiyanfei on 2018/4/26.
 */
@Repository(value = "userDao")
@Mapper
public interface UserDao {

    List<User> findAll();

    List<User> findAllByCondition(String mobile);

    User login(@Param("username")String username,@Param("password") String password);

    User findById(@Param("userId") int userId);

    int add(User user);

    int update(User user);

    int deleteById(int userId);
}
