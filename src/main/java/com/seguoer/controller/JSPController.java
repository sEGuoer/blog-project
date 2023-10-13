package com.seguoer.controller;

import com.seguoer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blogs")
public class JSPController {
    @Autowired
    UserService userService;
    @GetMapping
    public String redirect(Model model){
        model.addAttribute("Blogs",userService.selectBlogs("%"));
        return "forward:" + "/article_list.jsp";
    }
    @GetMapping("/{title}")
    String destory(@PathVariable String title,Model model) {
        String content = userService.selectBlogContent(title);
        model.addAttribute("Content",content);
        return "forward:" + "../blogs/blog.jsp";
    }
}
