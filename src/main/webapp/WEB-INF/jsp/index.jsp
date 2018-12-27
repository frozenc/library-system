<%--
  Created by IntelliJ IDEA.
  User: frozenchan
  Date: 2018/11/23
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆管理系统</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script src="js/js.cookie.js"></script>
    <%--<script src="js/movingStar.js"></script>--%>
    <style>
        body {
            background-image: none;
        }
    </style>
    <script>
            $(function(){
                $('#myCarousel').carousel({
                    interval: 2000
                });
                // movingStar();
            });
    </script>
</head>
<body>
<c:if test="${!empty error}">
    <script>
            alert("${error}");
            window.location.href="login.html";
</script>
</c:if>
<table class="table" id="indexTable">
    <tbody>
        <td><h2 style="text-align: center;font-family: 'Adobe 楷体 Std R';color: palevioletred">图 书 馆 管 理 系 统</h2></td>
        <td class="type-info btn btn-primary btn-lg" data-toggle="modal" data-target="#loginModal">登录</td>
    </tbody>
</table>

<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="img/1.jpg" alt="第一张">
        </div>
        <div class="item">
            <img src="img/2.jpg" alt="第二张">
        </div>
        <div class="item">
            <img src="img/3.jpg" alt="第三张">
        </div>

    </div>
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;
    </a>
</div>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: white;">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    请登录
                </h4>
            </div>
            <div class="modal-body" id="login">
                        <div class="form-group">
                            <label for="id">用户名</label>
                            <input type="text" class="form-control" id="id" placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="passwd">密码</label>
                            <input type="password" class="form-control" id="passwd" placeholder="请输入密码">
                        </div>

                        <p style="text-align: right;color: grey;position: absolute" id="info"></p><br/>
            </div>
            <div class="modal-footer">
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭--%>
                <%--</button>--%>
                <button id="loginButton" type="button" class="btn btn-primary  btn-block">登陆
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

    <script>
        $("#id").keyup(
            function () {
                if(isNaN($("#id").val())){
                    $("#info").text("提示:账号只能为数字");
                }
                else {
                    $("#info").text("");
                }
            }
        )
        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }
        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#id').val(loginStatus.username);
                    $('#passwd').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 设置登录信息
        setLoginStatus();
        $("#loginButton").click(function () {
            var id =$("#id").val();
            var passwd=$("#passwd").val();
            var remember=$("#remember").prop('checked');

            if( id=='' && passwd==''){
                $("#info").text("提示:账号和密码不能为空");
            }
            else if ( id ==''){
                $("#info").text("提示:账号不能为空");
            }
            else if( passwd ==''){
                $("#info").text("提示:密码不能为空");
            }
            else if(isNaN( id )){
                $("#info").text("提示:账号必须为数字");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/api/loginCheck",
                    data: {
                        id:id ,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if(data.stateCode.trim() == "0") {
                            $("#info").text("提示:账号或密码错误！");
                        } else if(data.stateCode.trim() == "1") {
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="/admin_main.html";
                        } else if(data.stateCode.trim() == "2"){
                            if(remember){
                                rememberLogin(id,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="/reader_main.html";


                        }
                    }
                });
            }
        })

    </script>
<%--</div>--%>

</body>
</html>
