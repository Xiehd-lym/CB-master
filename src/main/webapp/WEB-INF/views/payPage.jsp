<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>

<div class="alipayPageDiv">
    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">${param.total}</span>
    </div>

    <div>
        <img class="alipayImg" src="../home/images/alipay.jpg">
    </div>

    <div>
        <a href="payed?order_id=${param.order_id}&total=${param.total}">
            <button class="confirmPay">确认支付</button>
        </a>
    </div>
</div>