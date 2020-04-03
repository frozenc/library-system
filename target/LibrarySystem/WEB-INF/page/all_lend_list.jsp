<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>图书列表</title>
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
<div class="panel panel-default col-md-10 col-md-offset-1 thumbnail">
    <div class="panel-heading">
        <h3 class="panel-title">
            全部借还历史
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>编号</th>
                    <th>书籍编号</th>
                    <th>用户编号</th>
                    <th>借出日期</th>
                    <th>归还日期</th>
                    <th>图书状态</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${lendList}" var="lend">
                    <tr>
                        <td>${lend.id}</td>
                        <td>${lend.book_id}</td>
                        <td>${lend.user_id}</td>
                        <td>${lend.lend_date}</td>
                        <td>${lend.back_date}</td>
                        <%--借还状态0借出，1已还--%>
                        <c:if test="${lend.state==0}"><td>借出</td></c:if>
                        <c:if test="${lend.state==1}"><td>已还</td></c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
