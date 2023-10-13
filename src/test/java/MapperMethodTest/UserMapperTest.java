package MapperMethodTest;

import com.seguoer.config.AppConfig;
import com.seguoer.mapper.UserMapper;
import com.seguoer.po.Blog;
import com.seguoer.po.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import java.util.Date;
import java.util.List;

@SpringJUnitConfig(AppConfig.class)
public class UserMapperTest {
    @Autowired
    UserMapper userMapper;

    @Test
    @DisplayName("offset是从0开始，所以到时候应该用Sevice去处理usermapper的方法.")
    void selectBlogByPage(){
        System.out.println(userMapper.selectBlogByPage(1, 1));
    }
    @DisplayName("选出所有的用户")
    @Test
    void selectUsers(){
        System.out.println(userMapper.selectUsers());
    }
    @DisplayName("通过用户ID改账号")
    @Test
    void changeUsersByID(){
        System.out.println(userMapper.changeUsersByID("55","709074535234"));
    }
    @DisplayName("通过博客ID改内容")
    @Test
    void changeBlogByID(){
        System.out.println(userMapper.changeBlogByID("3","changeBlogByIDTest"));
    }
    @DisplayName("添加新的博客")
    @Test
    void addNewBlog(){
        Blog blog = new Blog(4,"addNewBlog","admin","cover","slug",new Date(),new Date(),2,"addNewBlogTest","md",0);
        System.out.println(userMapper.addNewBlog(blog));
    }
    @DisplayName("删除已有用户")
    @Test
    void deleteUsersByID(){
        System.out.println(userMapper.deleteUsersByID("71"));
    }
    @DisplayName("删除已有博客")
    @Test
    void deleteBlogByID(){
        System.out.println(userMapper.deleteBlogByID("7"));
    }
    @DisplayName("删除已有博客")
    @Test
    void selectBlogs(){
        List<Blog> blogList = userMapper.selectBlogs("%");
        for (Blog blog : blogList) {
            System.out.println(blog.toString());
        }
    }
    @DisplayName("登陆测试(登陆一个人)")
    @Test
    void userLogin(){
        List<User> userList = userMapper.selectUsersByName("%@%");
        System.out.println(userList.size());
    }
}
