package org.video.web.controller;

import org.video.entity.User;
import org.video.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.video.service.impl.UserServiceImpl;

import java.util.List;

/**
 * Created by shiyanfei on 2018-04-26.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/loginBegin",method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String home() {
        return "index";
    }



    /*************************菜单页面进行跳转************************/
    @RequestMapping(value = "/userList",method = RequestMethod.GET)
    public String userList() {
        return "userList";
    }

    @RequestMapping(value = "/video",method = RequestMethod.GET)
    public String video() {
        return "video";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register() {
        return "register";
    }


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(String username,String password) {
        User user = userService.login(username,password);
        if(user!=null){
            return "index";
        }else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public  List<User> findAll(){
        return userService.findAll();
    }
    @ResponseBody
    @RequestMapping(value = "/findAllByCondition",method = RequestMethod.GET)
    public  List<User> findAllByCondition(String mobile){
        List<User>  list = userService.findAllByCondition(mobile);
        return userService.findAllByCondition(mobile);
    }

    @ResponseBody
    @RequestMapping(value = "/findUserById",method = RequestMethod.GET)
    public User findUserById(int userId){
        return userService.findById(userId);
    }

    @ResponseBody
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public int addUser(User user){
        return userService.add(user);
    }

    @ResponseBody
    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public int updateUser(User user){
        return userService.update(user);
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUser",method = RequestMethod.GET)
    public int deleteUser(int userId){
        return userService.deleteById(userId);
    }



}
