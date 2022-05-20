<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>素美妆园-后台登录</title>
    <link rel="shortcut icon" href="../assets/smzy.ico" type="image/x-icon">
    <link href="../assets/login.css" rel="stylesheet"/>
</head>
<body>
<div id="wrapper" class="login">
    <div id="login_form" class="form">
        <form class="login_form" action="aLogin" method="post">
            <h2>管理员登录</h2>
            <input type="text" placeholder="用户名" id="username" name="name">
            <input type="password" placeholder="密码" id="password" name="password">
            <button id="login" type="submit">登录</button><br>
            <span style="color: #ff0000;text-align: center;font-size: 20px;font-weight: bold;">${msg}</span>
        </form>
    </div>
</div>
<%--<script src="js/jquery.min.js"></script>
<script>
    function check_login() {
        var name = $("#username").val();
        var pass = $("#password").val();
        if(name=="${admin.name}" && pass=="${admin.password}") {
            alert("登录成功！");
            $("#username").val("");
            $("#password").val("");
            $(location).attr('href', 'admin/listCategory');
        }else{
            $("#login_form").removeClass('shake_effect');
            setTimeout(function(){
                $("#login_form").addClass('shake_effect')
            },1);
        }
    }
    $(function(){
        $("#create").click(function(){
            check_register();
            return false;
        })
        $("#login").click(function(){
            check_login();
            return false;
        })
        $('.message a').click(function () {
            $('form').animate({
                height: 'toggle',
                opacity: 'toggle'
            }, 'slow');
        });
    })
</script>--%>
</body>
</html>
