package com.seguoer.service.impl;

import com.seguoer.mapper.UserMapper;
import com.seguoer.po.Blog;
import com.seguoer.po.User;
import com.seguoer.service.UserService;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Component
public class UserServiceSimple implements UserService {

    @Autowired
    UserMapper userMapper;


    @Override
    public List<Blog> selectAllBlog() {
        return userMapper.selectAllBlog();
    }

    @Override
    public List<Blog> selectBlogByPage(int offset, int rowCount) {
        return userMapper.selectBlogByPage(offset - 1, rowCount);
    }

    @Override
    public List<User> selectUsersByName(String name) {
        return userMapper.selectUsersByName(name);
    }

    @Override
    public List<Blog> selectBlogs(String id) {
        return userMapper.selectBlogs(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }

    @Override
    public List<User> selectUsers() {
        return userMapper.selectUsers();
    }

    @Override
    public int changeUsersByID(String id, String account) {
        return userMapper.changeUsersByID(id, account);
    }

    @Override
    public int changeBlogByID(String id, String content) {
        return userMapper.changeBlogByID(id, content);
    }

    @Override
    public int addNewUser(User user) {
        return userMapper.addNewUser(user);
    }

    @Override
    public int addNewBlog(Blog blog) {
        return userMapper.addNewBlog(blog);
    }

    @Override
    public int deleteUsersByID(String id) {
        return userMapper.deleteUsersByID(id);
    }

    @Override
    public int deleteBlogByID(String id) {
        return userMapper.deleteBlogByID(id);
    }

    @Override
    public int updateBlog(Map map) {
        return userMapper.updateBlog(map);
    }

    @Override
    public String selectBlogContent(String title) {
        String mySQL = userMapper.selectBlogContent(title);
        if (mySQL != null) {
            System.out.println(mySQL);
            Parser parser = Parser.builder().build();
            Node document = parser.parse(mySQL);
            HtmlRenderer renderer = HtmlRenderer.builder().build();
            String Content = renderer.render(document);
            System.out.println(Content);
            return Content;
        } else {
            return "Please input correctly title";
        }
    }

    @Override
    public String userLogin(String email, String password) {
        List<User> userList = userMapper.selectUsersByName(email);
        if (userList.size() == 1) {
            User user = userList.get(0);
            String sqlPassword = user.getPassword();
            if (sqlPassword.equals(password)) {
                if (user.getUsername().equals("person")) {
                    return "用户登录";
                } else if (user.getUsername().equals("admin")) {
                    return "管理员登陆";
                } else {
                    return "?";
                }
            }else {
                    return "密码错误";
                }
            } else if (userList.size() == 0) {
                return "没有找到该用户";
            } else {
                return "请输入正确的账号";
            }
        }
    }
