<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>cc图书馆</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/util.js"></script>
    <script>
        <%--$(function () {--%>
            <%--var user = "<%=session.getAttribute("user")%>";--%>
            <%--alert("hello");--%>
            <%--alert(user);--%>
        <%--})--%>
    </script>
</head>
<body style="background-image: ">
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
            图书列表
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <%--<th>ISBN</th>--%>
                    <%--<th>简介</th>--%>
                    <th>价格</th>
                    <th>出版日期</th>
                    <th>类别</th>
                    <th>书架号</th>
                    <th>图书状态</th>
                    <th>详情</th>
                    <th>历史</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${bookList}" var="book">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.name}</td>
                        <td>${book.author}</td>
                        <td>${book.publish}</td>
                        <%--<td>${book.ISBN}</td>--%>
                        <%--<td>${book.introduction}</td>--%>
                        <td>${book.price}</td>
                        <td>${book.pubdate}</td>
                        <td>${book.class_id}</td>
                        <td>${book.pressmark}</td>
                        <%--书籍状态1在馆2借出--%>
                        <c:if test="${book.state==1}"><td>在馆</td></c:if>
                        <c:if test="${book.state==2}"><td>借出</td></c:if>
                        <td><a class="btn btn-primary" href="/getBookInfo?b_id=${book.id}">查看</a></td>
                        <td><a class="btn btn-primary" href="/showBookLendList?b_no=${book.id}">查看</a></td>
                        <td><a class="btn btn-primary" href="/lendBook?b_no=${book.id}">借书</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <%--分页功能，太多了不做--%>
        <%--<nav aria-label="Page navigation" style="text-align: center">--%>
            <%--<ul class="pagination">--%>
                <%--<li>--%>
                    <%--<a href="#" aria-label="Previous">--%>
                        <%--<span aria-hidden="true">&laquo;</span>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li><a href="#">1</a></li>--%>
                <%--<li><a href="#">2</a></li>--%>
                <%--<li><a href="#">3</a></li>--%>
                <%--<li><a href="#">4</a></li>--%>
                <%--<li><a href="#">5</a></li>--%>
                <%--<li>--%>
                    <%--<a href="#" aria-label="Next">--%>
                        <%--<span aria-hidden="true">&raquo;</span>--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</nav>--%>

    </div>
</div>
</body>
</html>
