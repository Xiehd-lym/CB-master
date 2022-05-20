<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<div class="header-con">
    <div class="header">
        <div class="welcome fl">欢迎来到素美妆园!</div>
        <div class="fr">

            <c:if test="${empty sessionScope.user}">
            <div class="login_btn fl">
                <a href="/loginPage">登录</a>
                <span>|</span>
                <a href="/registerPage">注册</a>
            </div>
            </c:if>

            <c:if test="${!empty sessionScope.user}">
                <div class="login_info fl">
                    欢迎：<em>${sessionScope.user.name}</em>
                    <span>|</span>
                    <a href="/logout">退出</a>
                </div>
            </c:if>



            <div class="user_link fl">
                <span>|</span>
<%--                <a href="user_center_info.html">用户中心</a>
                <span>|</span>--%>
                <a href="cart">我的购物车</a>
                <span>|</span>
                <a href="bought">我的订单</a>
            </div>
        </div>
    </div>
</div>
