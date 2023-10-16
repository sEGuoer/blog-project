package com.seguoer.controller;

import com.seguoer.po.Blog;
import com.seguoer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
}
