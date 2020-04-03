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
            图书信息
        </h3>
    </div>
    <div class="panel-body">
        <c:if test="${requestScope.book!=null}">
            <div class="span12">
                    <fieldset>
                    <legend>${book.name}</legend>
                    <label>书籍编号</label>
                    <span>${book.id}</span><br/>
                    <label>书籍名称</label>
                    <span>${book.name}</span><br/>
                    <label>作者</label>
                    <span>${book.author}</span><br/>
                    <label>出版社</label>
                    <span>${book.publish}</span><br/>
                    <label>ISBN</label>
                    <span>${book.ISBN}</span><br/>
                    <label>简介</label>
                    <text>${book.introduction}</text><br/>
                    <label>价格</label>
                    <span>￥${book.price}</span><br/>
                    <label>出版日期</label>
                    <span>${book.pubdate}</span><br/>
                    <label>类别</label>
                    <span>${book.class_id}</span><br/>
                    <label>书架号</label>
                    <span>${book.pressmark}</span><br/>
                    <label>状态</label>
                    <span>
                        <c:if test="${book.state == 1}">已借出</c:if>
                        <c:if test="${book.state == 0}">在馆</c:if>
                    </span><br/>
                    <a class="btn btn-primary" href="/showBookLendList?b_no=${book.id}">借还历史</a>
                    <a class="btn btn-primary" href="/lendBook?b_no=${book.id}">借书</a>
                </fieldset>
            </div>
        </c:if>
        <c:if test="!${requestScope.book}">
            ${requestScope.s_msg};
        </c:if>
    </div>
</div>
</body>
</html>
