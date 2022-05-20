<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>


<div class="search_bar clearfix">
    <a href="#" class="logo fl"><img src="../home/images/logo.png"></a>
    <%--<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>--%>
    <div class="search_con fr">
        <form action="/searchProduct">
            <input type="text" value="${param.keyword}" class="input_text fl" placeholder="搜索商品" name="keyword">
            <button type="submit" class="input_btn fr">搜索</button>
        </form>
    </div>
</div>

<div class="payedDiv">
    <div class="payedTextDiv">
        <span>您已成功付款o(*////▽///ω＼*）</span>
    </div>

    <div class="payedAddressInfo">
        <ul>
            <li>收货地址：${order.address} ${order.receiver} ${order.phone}</li>
            <li>实付款：<span class="payedInfoPrice">￥${param.total}</span></li>
        </ul>

        <div class="payedCheckLinkDiv">
            您可以
            <a class="payedCheckLink" href="bought">查看已买到的宝贝</a>
            <a class="payedCheckLink" href="bought">查看交易详情</a>
        </div>
    </div>
</div>
