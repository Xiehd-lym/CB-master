<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>

<style>
    div.orderFinishDiv{
        border: 1px solid #E5E5E5;
        padding: 40px;
        max-width: 1013px;
        margin: 10px auto;
    }
    div.orderFinishDiv span{
        font-size: 14px;
        color: black;
        font-weight: bold;
        margin-left: 20px;
        padding-top: 20px;
    }
</style>

<div class="search_bar clearfix">
    <a href="home" class="logo fl"><img src="../home/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;收货成功</div>
    <div class="search_con fr">
        <form action="/searchProduct">
            <input type="text" value="${param.keyword}" class="input_text fl" placeholder="搜索商品" name="keyword">
            <button type="submit" class="input_btn fr">搜索</button>
        </form>
    </div>
</div>

<div class="orderFinishDiv">
    <div class="orderFinishTextDiv">
        <span>交易已经成功，卖家将收到您的货款。</span>
    </div>
</div>