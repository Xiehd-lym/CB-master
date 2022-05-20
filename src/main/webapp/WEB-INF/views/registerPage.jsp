<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>

<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="../home/images/logo02.png"/></a>
        <div class="reg_slogan">让您的美丽  ·  无处不在</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="/loginPage">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form action="/register" method="POST" class="registerForm">
                <ul>
                    <li>
                        <label>用户名</label>
                        <input type="text" name="name" id="user_name"  value="${username}" placeholder="请输入用户名">
                        <span class="error_tip"></span>
                    </li>
                    <li>
                        <label>密码</label>
                        <input type="password" name="password" id="pwd" placeholder="请输入密码">
                        <span class="error_tip"></span>
                    </li>
                    <li>
                        <label>确认密码</label>
                        <input type="password" name="repassword" id="repwd" placeholder="请再次输入密码">
                        <span class="error_tip"></span>
                    </li>
                    <li>
                        <label>邮箱</label>
                        <input type="text" name="email" id="email" placeholder="请输入邮箱">
                        <span class="error_tip"></span>
                    </li>
                    <li class="agreement" style="text-align: center; display: none;">
                        <%--<input type="checkbox" name="allow" id="allow" checked="checked">--%>
                        <%--<label>同意“素美妆园用户使用协议”</label>--%>
                            <span class="error_tip2" ></span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit" value="注册">
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>

<script>
    $(function() {
        <c:if test="${!empty msg}">
            $("span.error_tip2").html("${msg}");
            $("li.agreement").show();
        </c:if>

        $("form.registerForm").submit(function() {
            if(0 == $("#user_name").val().length ) {
                $("span.error_tip2").html("请输入用户名");
                $("li.agreement").show();
                return false;
            }

            if(0 == $("#pwd").val().length) {
                $("span.error_tip2").html("请输入密码");
                $("li.agreement").show();
                return false;
            }

            if(0 == $("#repwd").val().length || $("#repwd").val() != $("#pwd").val()) {
                $("span.error_tip2").html("两次密码输入不一致");
                $("li.agreement").show();
                return false;
            }

            if(0 == $("#email").val().length) {
                $("span.error_tip2").html("请输入邮箱");
                $("li.agreement").show();
                return false;
            }
            return true;
        });
        $("form.registerForm input").keyup(function() {
            $("li.agreement").hide();
        });

    })
</script>

<%@include file="include/footer.jsp"%>
