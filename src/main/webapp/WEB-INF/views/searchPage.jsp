<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>
<%@include file="include/search.jsp"%>

<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>美妆商城</h1>
<%--            <span></span>
            <ul class="subnav">
                <li><a href="#" class="">护肤</a></li>
                <li><a href="#" class="">彩妆</a></li>
                <li><a href="#" class="">香氛</a></li>
                <li><a href="#" class="">品牌</a></li>
                <li><a href="#" class="">工具</a></li>
                <li><a href="#" class="">套装</a></li>
            </ul>--%>
        </div>
        <ul class="navlist fl">
            <li><a href="home">首页</a></li>
<%--            <li class="interval">|</li>
            <li><a href="">优惠</a></li>--%>
        </ul>
    </div>
</div>
<div class="breadcrumb">
<%--    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">护肤</a>--%>
</div>

<div class="main_wrap_search clearfix" style="width: 1200px;margin: 0 auto;">

    <!-- --------------------------新品推荐--------------------- -->
<%--    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <li>
                    <a href="#"><img src="images/goods/product6.jpg"></a>
                    <h4><a href="#">面膜</a></h4>
                    <div class="price">¥99</div>
                </li>
                <li>
                    <a href="#"><img src="images/goods/product8.jpg"></a>
                    <h4><a href="#">眼霜</a></h4>
                    <div class="price">¥23</div>
                </li>
            </ul>
        </div>
    </div>--%>

    <%--<div class="r_wrap fr clearfix">--%>
        <div class="sort_bar">
            <a <c:if test="${'all' == param.sort||empty param.sort}">class="active"</c:if> href="/sortProduct?sort=all&keyword=${param.keyword}" >默认</a>
            <a <c:if test="${'sale' == param.sort}">class="active"</c:if> href="/sortProduct?sort=sale&keyword=${param.keyword}">销量</a>
            <a <c:if test="${'price' == param.sort}">class="active"</c:if> href="/sortProduct?sort=price&keyword=${param.keyword}">价格</a>
        </div>

    <%--</div>--%>



    <ul class="goods_type_list clearfix">
        <c:forEach items="${products}" var="p">
        <li>
            <a href="/showProduct?product_id=${p.id}"><img src="/img/product/${p.id}/1.jpg"></a>
            <h4><a href="/showProduct?product_id=${p.id}">${p.name}</a></h4>
            <div class="operate">
                <span class="price">¥${p.price}</span>
                <%--<a href="#" class="add_goods" title="加入购物车"></a>--%>
                <div class="review_count" style="display: inline-block;width: 44px;height: 15px;position: absolute;right: 0;top: 3px;">评价<span style="color: #ff0000;">${p.reviewCount}</span></div>
            </div>
        </li>
        </c:forEach>

        <c:if test="${empty products}">
            <div style="width: 980px;text-align: center;margin-top: 50px;float: right;">
                <p>
                    没找到与
                    <span style="color: #fc66a2;font-size: 20px;font-weight: bold;">"${param.keyword}"</span>
                    相关的产品哦
                </p>
            </div>
        </c:if>
    </ul>




</div>


<%@include file="include/footer.jsp"%>