<%@ page import="com.seguoer.po.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.seguoer.service.UserService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>article_list</title>
    <link rel="stylesheet" href="vite/build/assets/app.css">
    <style>
        html {
            height: 100%;
            width: 100%;
        }

        body {
            height: 100%;
            width: 100%;
        }

        #hoverfloat:hover {
            animation-duration: 1s;
            -webkit-animation-duration: var(--animate-duration);
        }

        #hoverfloat:hover {
            -webkit-animation-name: pulse;
            animation-name: pulse;
            -webkit-animation-timing-function: ease-in-out;
            animation-timing-function: ease-in-out
        }

        .card {
            width: 640px;
        }
    </style>
</head>
<body>
<div class="h-100 d-flex flex-column m-auto justify-content-between">
    <header class="mb-5">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <h1 class="d-flex align-items-center ">
                    <img src="img/Cache_247709949bd616a9..jpg" width="36" height="36" alt="MyPhoto">
                    <a class="link-underline link-underline-opacity-0 link-body-emphasis fs-6"
                       href="./index.html">我的主页</a>
                </h1>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavAltMarkup"
                        aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav ms-auto">
                        <a class="nav-link active" aria-current="page" href="#resume">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-file-earmark-person" viewBox="0 0 16 16">
                                <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5v2z"/>
                            </svg>
                            简历</a>
                        <a class="nav-link" href="#boke">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-book-half" viewBox="0 0 16 16">
                                <path d="M8.5 2.687c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
                            </svg>
                            博客</a>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                学习仓库
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#javack">Java仓库</a></li>
                                <li><a class="dropdown-item" href="#htmlck">html仓库</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#myWebsiteck">主页仓库</a></li>
                            </ul>
                        </li>
                        <a href="./index_login.html" id="hoverfloat">
                            <button class="btn btn-danger">
                                <span class="text-center">登录</span>
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <div class="container" id="main_content">
        <div class="mx-lg-auto">
            <div class="row">
                <div class="col-md-6">
                    <article class="border-bottom h-100 pb-5  pt-md-0">
                        <div class="row justify-content-between">
                            <div class="col-7">
                                <h2 class="mb-2 h5"><a class="text-info"
                                                       href="show.html">||||||||||||||||||||||||||||||</a></h2>
                                <div class="small text-muted">
                                    <a href="#"
                                       class="link-secondary link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">admin</a>
                                    <span> - </span>
                                    <span>2023-06-11 14:59:23.0</span>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex">
                                    <a href="show.html" class="w-100">
                                        <img class="img-fluid shadow-sm rounded ratio-16x9" src="./img/MySQL.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-md-6">
                    <article class="border-bottom h-100 pb-5 pt-5 pt-md-0">
                        <div class="row justify-content-between">
                            <div class="col-7">
                                <h2 class="mb-2 h5"><a class="text-info" href="post/MySQL.html">MySQL语句</a></h2>
                                <div class="small text-muted">
                                    <a href="#"
                                       class="link-secondary link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">admin</a>
                                    <span> - </span>
                                    <span>2023-06-11 14:59:23.0</span>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex">
                                    <a href="post/MySQL.html" class="w-100">
                                        <img class="img-fluid shadow-sm rounded ratio-16x9" src="./img/MySQL.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-md-6">
                    <article class="border-bottom h-100 pb-5 pt-5 ">
                        <div class="row justify-content-between">
                            <div class="col-7">
                                <h2 class="mb-2 h5"><a class="text-info" href="./MySQL">composer 加速，修改镜像源</a>
                                </h2>
                                <div class="small text-muted">
                                    <a href="#"
                                       class="link-secondary link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">admin</a>
                                    <span> - </span>
                                    <span>2023-06-11 14:59:23.0</span>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex">
                                    <a href="./MySQL" class="w-100">
                                        <img class="img-fluid shadow-sm rounded ratio-16x9" src="./img/MySQL.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-md-6">
                    <article class="border-bottom h-100 pb-5 pt-5 ">
                        <div class="row justify-content-between">
                            <div class="col-7">
                                <h2 class="mb-2 h5"><a class="text-info" href="./MySQL">yarn 加速，修改镜像源</a></h2>
                                <div class="small text-muted">
                                    <a href="#"
                                       class="link-secondary link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">admin</a>
                                    <span> - </span>
                                    <span>2023-06-11 14:59:23.0</span>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex">
                                    <a href="./MySQL" class="w-100">
                                        <img class="img-fluid shadow-sm rounded ratio-16x9" src="./img/MySQL.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-md-6">
                    <article class="border-bottom h-100 pb-5 pt-5 ">
                        <div class="row justify-content-between">
                            <div class="col-7">
                                <h2 class="mb-2 h5"><a class="text-info" href="./MySQL">npm 加速，修改镜像源</a></h2>
                                <div class="small text-muted">
                                    <a href="#"
                                       class="link-secondary link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">admin</a>
                                    <span> - </span>
                                    <span>2023-06-11 14:59:23.0</span>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex">
                                    <a href="./MySQL" class="w-100">
                                        <img class="img-fluid shadow-sm rounded ratio-16x9" src="./img/MySQL.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <% List<Blog> blogList = (List<Blog>) request.getAttribute("Blogs"); %>
                <%for (Blog blog : blogList) { %>
                <div class="col-md-6">
                    <article class="border-bottom h-100 pb-5 pt-5 ">
                        <div class="row justify-content-between">
                            <div class="col-7">
                                <h2 class="mb-2 h5"><a class="text-info" href=<%= "blogs/"+blog.getTitle()%>>
                                    <%= blog.getTitle()%>
                                </a></h2>
                                <div class="small text-muted">
                                    <a href="#"
                                       class="link-secondary link-offset-2 link-underline-opacity-0 link-underline-opacity-100-hover">
                                        <%=blog.getCreator()%>
                                    </a>
                                    <span> - </span>
                                    <span><%=blog.getUpdateTime()%></span>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="d-flex">
                                    <a href=<%= "blogs/"+blog.getTitle()%> class="w-100">
                                        <img class="img-fluid shadow-sm rounded ratio-16x9" src="./img/MySQL.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <% } %>
            </div>


        </div>
    </div>
    <footer>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-md justify-content-center justify-content-md-start align-items-center">
                <small class="my-2 text-body-secondary">Desingned by <a href="#"
                                                                        class="link-body-emphasis text-decoration-none">@sEGuoer</a>-From
                    2023 to 2033</small>
            </div>
        </nav>
    </footer>
</div>
<script>
    var select = document.querySelector('select')
    select.onchange = function () {
        window.location = this.value;
    }
</script>
<script src="vite/build/assets/app.js"></script>
</body>
</html>
