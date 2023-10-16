package com.seguoer.controller;

import com.seguoer.po.Blog;
import com.seguoer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class JSPController {
    @Autowired
    UserService userService;

    @GetMapping("/blogs{page}")
    public String redirect(Model model,@PathVariable String page){
        List<Blog> blogList = userService.selectBlogByPage(Integer.parseInt(page)*3-2,3);
        if (blogList == null){
            return "redirect:" + "blogs1";
        }else {
            model.addAttribute("Blogs",blogList);
            model.addAttribute("page",page);
            return "forward:" + "article_list.jsp";
        }
    }
    @GetMapping("/blogs{page}/{title}")
    String blogPage(@PathVariable String title,@PathVariable String page,Model model) {
        String content = userService.selectBlogContent(title);
        model.addAttribute("Content",content);
        return "forward:" + "../blogs/blog.jsp";
    }

    @PostMapping("/addBlog")
    @ResponseBody
    String addBlog(String email,String content, String title) {
        if ((email != null || !email.equals("")) && content != null && title != null){
            int result = userService.addNewBlog(email, content,title);
            return "博客添加成功";
        }
        return "博客添加失败请返回重试";
    }
   /* @PostMapping("/blogs{page}/{title}")
    @ResponseBody
    String updateBlog(@PathVariable String title,@PathVariable String page) {
        return "forward:" + "../blogs/blog.jsp";
    }*/
}
