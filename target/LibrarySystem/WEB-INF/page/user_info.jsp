<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/util.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/index.jsp">cc图书馆</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <%--<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>--%>
                <li><a href="/showBooks">图书列表</a></li>
                <li><a href="/showLendList">借还历史</a></li>
            </ul>
            <form class="navbar-form navbar-left" action="/searchBook" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="查找书名" name="b_name">
                </div>
                <button type="submit" class="btn btn-default">查找</button>
            </form>
            <ul class="nav navbar-nav navbar-right" id="loginTrue">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user"></span>&nbsp;${sessionScope.user.username},已登录 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/showUserLendList">我的借还历史</a></li>
                        <li><a href="/user_info">修改密码</a></li>
                    </ul>
                </li>
                <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span>&nbsp;注销</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid col-md-10 col-md-offset-1 thumbnail">
    <div class="row-fluid col-md-offset-1" style="margin-top: 20px">
        <div class="span12">
            <form action="/updPwd" method="post">
                <fieldset>
                    <legend>修改密码</legend>
                    <label>请输入旧密码：</label>
                    <input type="password" name="oldPwd"><br/>
                    <label>请输入新密码：</label>
                    <input type="password" name="newPwd"><br/>
                    <label>请确认新密码：</label>
                    <input type="password" name="newPwdSure"><br/>
                    <button type="submit" class="btn btn-primary">确认修改</button><span>${requestScope.msg}</span>
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
</html>
