package com.seguoer.controller;

import com.seguoer.po.Blog;
import com.seguoer.po.User;
import com.seguoer.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
public class OperatingController {
    @Autowired
    UserService userService;
    @Autowired
    HttpServletRequest request;

    @PostMapping("/verify")
    String verify(String email, String pwd) {
        String result = userService.userLogin(email, pwd);
        System.out.println(email);
        System.out.println(pwd);
        if (result.equals("用户登录")) {
            request.getSession().setAttribute("user", userService.selectUsersByEmail(email).get(0));
            return "redirect:" + "/user";
        } else if (result.equals("管理员登陆")) {
            request.getSession().setAttribute("user", userService.selectUsersByEmail(email).get(0));
            return "redirect:" + "/admin";
        } else {
            return "redirect:" + "/index_login.html";
        }
    }

    @GetMapping("/user")
    String userPage(Model model) {
        model.addAttribute("user", request.getSession().getAttribute("user"));
        return "forward:" + "/User.jsp";
    }

    @PostMapping("/fileUpload")
    @ResponseBody
    public String uoLoad(@RequestParam("text") String text, @RequestParam("file") Part file) throws IOException {
        System.out.println("文件名：" + file.getSubmittedFileName());
        System.out.println("文件类型：" + file.getContentType());
        System.out.println("文件大小：" + file.getSize());
        //1.把文件写入到磁盘中的指定目录
        String url = "C:\\Users\\Administrator\\Desktop\\blog-project\\src\\main\\webapp\\WEB-INF\\img\\" + file.getSubmittedFileName();
        file.write(url);
        return url;
    }

    @GetMapping("/admin")
    String adminPage(Model model, @RequestParam(value = "nowPage", defaultValue = "0") String a) {
        int nowPage;
        if (a.equals("0")) {
            nowPage = 1;
        } else {
            nowPage = Integer.parseInt(a);
        }
        List<User> userList = userService.selectUsersByEmail("%");
        int stateCode = GetpageSum(userList, model, nowPage);
        return "forward:" + "/Admin.jsp";
    }

    @GetMapping("/adminBlog")
    String adminBlog(Model model, @RequestParam(value = "nowPage", defaultValue = "0") String a) {
        int nowPage;
        if (a.equals("0")) {
            nowPage = 1;
        } else {
            nowPage = Integer.parseInt(a);
        }
        List<Blog> blogList = userService.selectBlogs("%");
        int stateCode = GetpageSum(blogList, model, nowPage);
        return "forward:" + "/AdminBlog.jsp";
    }

    public int GetpageSum(List list, Model model, int nowPage) {
        int pageSum;
        if (list.size() % 9 == 0) {
            pageSum = list.size() / 9;
        } else {
            pageSum = list.size() / 9 + 1;
        }
        if ((nowPage - 1) * 9 > 0) {
            list.subList(0, (nowPage - 1) * 9).clear();
        }
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("list", list);
        model.addAttribute("pageSum", pageSum);
        return 1;
    }
    /*@PostMapping("/addBlog")
    void addBlog(String email,String content, String title) {
        if ((email != null || !email.equals("")) && content != null && title != null){
            int result = userService.addNewBlog(email, content,title);
        }
    }*/
}
