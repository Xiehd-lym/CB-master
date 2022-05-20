<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>


    <div class="login_top clearfix">
        <a href="home" class="login_logo">
            <img src="../home/images/logo02.png"/>
        </a>
    </div>
    <div class="login_center_bg">
        <div class="login_form_wrap clearfix">
            <div class="login_banner fl"></div>
            <div class="slogan fl">焕发魅力 · 绽放美丽</div>
            <div class="login_form fr">
                <div class="login_title clearfix">
                    <h1>用户登录</h1>
                    <a href="/registerPage">立即注册</a>
                </div>
                <div class="form_input">
                    <form action="/login" method="post" class="loginForm">
                        <input type="text" name="name" class="name_input" id="user_name" placeholder="请输入用户名"/>
                        <div class="user_error"></div>
                        <input type="password" name="password" class="pwd_input" id="pwd" placeholder="请输入密码"/>
                        <div class="pwd_error"></div>
                        <div class="more_input clearfix" style="text-align: center;top: 203px">
<%--                            <input type="checkbox" name="remember">
                            <label>记住用户名</label>
                            <a href="#">忘记密码</a>--%>
                            <span class="error" style="color:red;font-size:15px;font-weight: bold;"></span>
                        </div>
                        <input type="submit" value="登录" class="input_submit" style="top:140px;"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script>
    $(function () {
        <c:if test="${!empty msg}">
            $("span.error").html("${msg}");
            $("div.more_input").show();
        </c:if>

        $("form.loginForm").submit(function () {
            if(0 == $("#user_name").val().length || 0==$("#pwd").val().length) {
                $("span.error").html("请输入用户名、密码");
                $("div.more_input").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function() {
            $("div.more_input").hide();
        });
    })
</script>

<%@include file="include/footer.jsp"%>