package com.seguoer.mapper;

import com.seguoer.dao.UserDao;
import com.seguoer.po.Blog;
import com.seguoer.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper extends UserDao {
    @Override
    List<Blog> selectBlogByPage(int offset, int rowCount);

    @Override
    List<User> selectUsers();

    @Override
    int changeBlogByID(String id, String content);

    @Override
    int addNewBlog(Blog blog);

    @Override
    int updateBlog(Map map);

    @Override
    List<User> selectUsersByName(@Param("name") String name);

    @Override
    List<Blog> selectAllBlog();

    @Override
    List<Blog> selectBlogs();

    @Override
    int changeUsersByID(String id, String newName);

    @Override
    int addNewUser(User user);

    @Override
    int deleteUsersByID(String id);

    @Override
    int deleteBlogByID(String id);

    @Override
    List<User> selectAllUser();

    @Override
    String selectBlogContent(@Param("title") String title);

}
