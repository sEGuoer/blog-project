package com.seguoer.service.impl;

import com.seguoer.mapper.UserMapper;
import com.seguoer.po.Blog;
import com.seguoer.po.User;
import com.seguoer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
        return userMapper.selectBlogByPage(offset-1,rowCount);
    }

    @Override
    public List<User> selectUsersByName(String name) {
        return userMapper.selectUsersByName(name);
    }

    @Override
    public List<Blog> selectBlogs() {
        return userMapper.selectBlogs();
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
        return userMapper.changeUsersByID(id,account);
    }

    @Override
    public int changeBlogByID(String id, String content) {
        return userMapper.changeBlogByID(id,content);
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
        return userMapper.selectBlogContent(title);
    }
}
