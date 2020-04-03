<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/util.js"></script>
    <script>
        $(function () {
            var user = "<%=session.getAttribute("user")%>";
            checkLogin(user);
        })
    </script>
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
            <ul class="nav navbar-nav navbar-right" id="loginFalse">
                <li><a href="#" data-target="#loginModal" data-toggle="modal">登录</a></li>
                <li><a href="#" data-target="#registerModal" data-toggle="modal">注册</a></li>
            </ul>
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

<%--登录模态框--%>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">登录</h4>
            </div>
            <form action="/login" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-group">
                            账户名称:<input type="text" class="form-control" name="username">
                        </div>
                        <div class="form-group">
                            密码:<input type="password" class="form-control" name="password">
                        </div>
                        <label class="control-label" id="loginMsg"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">登录</button>
                    <button type="reset" class="btn btn-primary">重置</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--注册模态框--%>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">注册</h4>
            </div>
            <form action="/register" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-group">
                            账户名称：<input type="text" class="form-control" name="username">
                        </div>
                        <div class="form-group">
                            密码：<input type="password" class="form-control" name="password">
                        </div>
                        <div class="form-group">
                            密码确认：<input type="password" class="form-control" name="passwordSure">
                        </div>
                        <label class="control-label" id="registerMsg"></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">注册</button>
                    <button type="reset" class="btn btn-primary">重置</button>
                </div>
            </form>
        </div>
    </div>
</div>

<label class="control-label">${requestScope.mav}</label>
<label class="control-label">${requestScope.r_msg}</label>
</body>
</html>
