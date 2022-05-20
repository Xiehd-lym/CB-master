<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>


<div class="search_bar clearfix">
    <a href="#" class="logo fl"><img src="../home/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
    <div class="search_con fr">
        <form action="/searchProduct">
            <input type="text" value="${param.keyword}" class="input_text fl" placeholder="搜索商品" name="keyword">
            <button type="submit" class="input_btn fr">搜索</button>
        </form>
    </div>
</div>

<form action="/createOrder" method="post">
    <h3 class="common_title">确认收货地址</h3>

    <div class="common_list_con clearfix">
        <dl>
            <dt>寄送到</dt>
            <dd>
                <div class="site_con">
                    <div class="form_group">
                        <label>收件人:</label>

                        <input type="text" name="receiver">
                    </div>
                    <div class="form_group">
                        <label>手机号码:</label>
                        <input type="text" name="phone">
                    </div>
                    <div class="form_group form_group2">
                        <label>详细地址:</label>
                        <textarea class="site_area" name="address"></textarea>
                    </div>
                </div>
            </dd>
        </dl>
        <%--<a href="user_center_site.html" class="edit_site">编辑收货地址</a>--%>
    </div>

<h3 class="common_title">商品列表</h3>
<div class="common_list_con clearfix">
    <ul class="goods_list_th clearfix">
        <li class="col01">序号</li>
        <li class="col02">商品名称</li>
        <li class="col03">价格</li>
        <li class="col04">数量</li>
        <li class="col05">小计</li>
    </ul>
    <c:forEach items="${orderItems}" var="oi" varStatus="vs">
        <ul class="goods_list_td clearfix">
            <li class="col01">${vs.count}</li>
            <li class="col02"><img src="img/product/${oi.product_id}/1.jpg"></li>
            <li class="col03">${oi.product.name}</li>
            <li class="col04">${oi.product.price}元</li>
            <li class="col05">${oi.number}</li>
            <li class="col06">
                <fmt:formatNumber type="number" value="${oi.product.price * oi.number}" minFractionDigits="2"/>元
            </li>
        </ul>
    </c:forEach>
</div>

    <h3 class="common_title">给卖家留言</h3>

    <div class="common_list_con clearfix">
            <textarea class="message" name="user_message"></textarea>
    </div>

<h3 class="common_title">总金额结算</h3>
<div class="common_list_con clearfix">
    <div class="settle_con">
        <div class="total_goods_count">总金额<b>${total}元</b></div>
        <div class="transit">运费：<b>免运费</b></div>
        <div class="total_pay">实付款：<b>${total}元</b></div>
    </div>
</div>

    <div class="order_submit clearfix">
            <input type="submit" class="submitOrder" style="cursor: pointer" value="付款">
    </div>
</form>



<%@include file="include/footer.jsp"%>