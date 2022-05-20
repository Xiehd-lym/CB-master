<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp"%>
<%@include file="include/search.jsp"%>

<div class="navbar_con">
    <div class="navbar">
        <h1 class="fl">美妆商城</h1>
        <ul class="navlist fl">
            <li><a href="home">首页</a></li>
            <%--<li class="interval">|</li>--%>
            <%--<li><a href="">优惠</a></li>--%>
        </ul>
    </div>
</div>

<div class="center_con clearfix">
    <ul class="subnav fl">
        <c:forEach items="${categories}" var="c" varStatus="status">
            <li><a href="#model0${status.count}" class="" category_id="${c.id}">${c.name}</a></li>
        </c:forEach>
    </ul>
    <div class="slide fl">
        <ul class="slide_pics">
            <li><img src="../home/images/slide.jpg" alt="幻灯片"></li>
            <li><img src="../home/images/slide02.jpg" alt="幻灯片"></li>
            <li><img src="../home/images/slide03.jpg" alt="幻灯片"></li>
            <li><img src="../home/images/slide04.jpg" alt="幻灯片"></li>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
</div>

<c:forEach items="${categories}" var="c" varStatus="vs">
    <c:if test="${!empty c.products}">
        <div class="list_model">
            <div class="list_title clearfix">
                <h3 class="fl" id="model0${vs.count}">${c.name}</h3>
                <div class="subtitle fl">
                    <span>|</span>
                    <a href="#"></a>
                </div>
                <a href="/searchProduct?keyword=${c.name}&category_id=${c.id}" class="goods_more fr" id="protect_more">查看更多></a>
            </div>
            <div class="goods_con clearfix">
                <div class="goods_banner fl"><img src="${c.img_url}"></div>
                <ul class="goods_list fr">
                    <c:forEach items="${c.products}" var="p" varStatus="vs">
                        <c:if test="${vs.count<=4}">
                            <li>
                                <h4><a href="showProduct?product_id=${p.id}">${p.name}</a></h4>
                                <a href="showProduct?product_id=${p.id}"><img src="img/product/${p.id}/1.jpg"></a>
                                <div class="price">¥${p.price}</div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </c:if>
</c:forEach>

<%@include file="include/footer.jsp"%>