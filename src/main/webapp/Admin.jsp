<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023/8/23
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Users</title>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body class="sidebar-mini" style="height: auto;">
<div class="wrapper">

    <nav class="main-header navbar navbar-expand navbar-white navbar-light">

        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Content</a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto">


            <li class="nav-item dropdown">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    <img src="./img/Cache_247709949bd616a9..jpg" alt="touxiang" width="20px" height="20px"> </a>

            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                    <div onclick=logoff() id="hoverfloat">
                        <button class="btn btn-danger">
                            <span class="text-center">注销</span>
                        </button>
                    </div>
                </a>
            </li>
        </ul>
    </nav>


    <aside class="main-sidebar sidebar-dark-primary elevation-4">


        <div class="sidebar">

            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="./img/Cache_247709949bd616a9..jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Admin</a>
                </div>
            </div>


            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Users
                                <span class="right badge badge-danger">无语了哥们</span>
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>

        </div>

    </aside>

    <div class="content-wrapper" style="min-height: 1000px;">

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1></h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right" id="UserList">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">
                                <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                    <div class="btn-group me-2" role="group" aria-label="First group">
                                        <button type="button" class="btn btn-primary" onclick="inputAddUser()">+
                                        </button>
                                        <button type="button" class="btn btn-primary" onclick="previousPage()">上一页
                                        </button>
                                        <button type="button" class="btn btn-primary" onclick="nextPage()">下一页
                                        </button>
                                    </div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">用户列表</h3>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
                            <input type="text" name="table_search" id="table_search" class="form-control float-right" placeholder="Search">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default" onclick="searchUser()">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table mb-0">
                        <tr>
                            <th scope="col">
                                <div class="form-check">
                                    <span>#</span>
                                </div>
                            </th>
                            <th scope="col">Email</th>
                            <th scope="col">Password</th>
                            <th scope="col">Account</th>
                            <th scope="col">
                                <button class="btn btn-danger text-center" id="deleteManyUser"
                                        onclick="deleteManyUser()">批量删除
                                </button>
                            </th>
                        </tr>
                        <c:forEach items="${list}" var="user" begin="0" end="8" varStatus="i">
                            <tr id="${user.getEmail()}">
                                <th scope="col">
                                    <div class="form-check">
                                        </label><span class="number"> ${i.count}</span>
                                    </div>
                                </th>
                                <td>${user.getEmail()}</td>
                                <td>${user.getPassword()}</td>
                                <td>${user.getAccount()} </td>
                                <td>
                                    <div class="btn-group me-2" role="group" aria-label="First group">
                                        <button id="deleteUser" type="button" class="btn btn-info"
                                                onclick="deleteUser()">删除
                                        </button>
                                        <button id="updateUser" type="button" class="btn btn-info"
                                                onclick="updateUserButton()">更新
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="card-footer clearfix">
                    <ul class="pagination pagination-sm m-0 float-right">
                        <li class="page-item">当前<span id="nowPage">${nowPage}</span>页，共${pageSum}页</li>
                        <li class="page-item" onclick=homePage()><span class="page-link">«</span></li>
                        <li class="page-item" onclick=previousPage()><span class="page-link">«</span></li>
                        <li class="page-item" onclick=homePage()><span class="page-link">1</span></li>
                        <li class="page-item" id="pageSum" onclick=lastPage()><span class="page-link"
                                                                                    id="lastPage">${pageSum}</span></li>
                        <li class="page-item" onclick=nextPage()><span class="page-link">»</span></li>
                    </ul>
                </div>
            </div>

        </section>

    </div>

    <footer class="main-footer">
        <div class="float-right d-none d-sm-block">
            <b>QQ:</b> 8571848
        </div>
        <strong>Desingned by <a href="https://adminlte.io">@sEGuoer</a>© 2023</strong>
    </footer>

    <div id="sidebar-overlay"></div>
</div>

<script>
    function deleteConfirmButton() {
        var x = confirm("Are you sure you want to delete?");
        if (x) {
            let deleteEmailList = new Array();
            var a = $(".form-check .flexCheckIndeterminate")
            a.each(function () {
                if ($(this).prop("checked") == true) {
                    var eachEmail = $(this).parent().parent().parent().prop("id")
                    deleteEmailList.push(eachEmail)
                    $.post("deleteUser",      // send HTTP POST request to a page and get the answer
                        {
                            email: eachEmail       // send data
                        },
                        function (data, status) { //retreive response
                        });
                }
            })
            window.location.reload();
            console.log(deleteEmailList)
        }
    }
</script>
<script>
    function searchUser() {
        let searchEmailElement = document.getElementById("table_search")
        let searchEmail = searchEmailElement.value
        $.ajax({
                url : './searchUser?email=' + searchEmail,
                dataType : 'json',
            success : function (result) {
                    if (result.email == searchEmail){
                        var account ="账号:" + result.account + "\n";
                        var email ="邮箱:" + result.email + "\n";
                        var password ="密码:" + result.password;
                        var message = account + email + password;
                        alert(message)
                    }else {
                        alert("没有找到该用户")
                    }
            }
            });
    }
    function logoff() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'clearSession', true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
        xhr.send("email=admin")
        xhr.onreadystatechange = function () {
            if ((xhr.status == 200 || xhr.status == 304) && xhr.readyState == 4) {
                window.location.href = "index_login.html"
            }
        }
    }

    let deleteManyUserIsExist = false

    function deleteManyUser() {
        if (deleteManyUserIsExist === false) {
            let checkboxInput = document.createElement("input")
            checkboxInput.className = "flexCheckIndeterminate form-check-input"
            checkboxInput.type = "checkbox"
            checkboxInput.value = ""

            let checkboxLabel = document.createElement("label")
            checkboxLabel.className = "flexCheckIndeterminatelabel form-check-label"
            checkboxLabel.setAttribute("for", "flexCheckIndeterminate")
            $("span.number").before(checkboxInput)
            $("span.number").before(checkboxLabel)

            let confirmDeleteButton = document.createElement("button")
            confirmDeleteButton.id = "confirmDeleteButton"
            confirmDeleteButton.className = "btn btn-danger text-center"
            confirmDeleteButton.innerText = "一键删除"
            confirmDeleteButton.setAttribute("onclick", "deleteConfirmButton()")
            document.getElementById("deleteManyUser").after(confirmDeleteButton)

            deleteManyUserIsExist = true;
            console.log(false)
        } else if (deleteManyUserIsExist === true) {
            document.getElementById("confirmDeleteButton").remove()
            var x = document.querySelectorAll(".flexCheckIndeterminate")
            var i2;
            for (i2 = 0; i2 < x.length; i2++) {
                x[i2].remove()
            }
            var y = document.querySelectorAll(".flexCheckIndeterminatelabel")
            var i1;
            for (i1 = 0; i1 < y.length; i1++) {
                y[i1].remove()
            }
            deleteManyUserIsExist = false;
            console.log(true)
        }
    }
</script>

<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="./vite/build/assets/app.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<script src="./js/admin.js "></script>
</body>
</html>
