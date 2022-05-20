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
                <c:forEach items="${categories}" var="c" varStatus="vs">
                <li><a href="model0${vs.count}" >${c.name}</a></li>
                </c:forEach>
            </ul>--%>
        </div>
        <ul class="navlist fl">
            <li><a href="home">首页</a></li>
            <li class="interval">|</li>
            <li><a href=""></a></li>
        </ul>
    </div>
</div>

<div class="breadcrumb">
<%--    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">美妆</a>
    <span>></span>
    <a href="#">眼影</a>--%>
</div>

<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl">
        <img class="bigImg" src="img/product/${product.id}/1.jpg" >
        <div class="smallImgDiv">
            <img class="smallImg" src="img/product/${product.id}/1.jpg" bigImgURL="img/product/${product.id}/1.jpg">
            <img class="smallImg" src="img/product/${product.id}/2.jpg" bigImgURL="img/product/${product.id}/2.jpg">
            <img class="smallImg" src="img/product/${product.id}/3.jpg" bigImgURL="img/product/${product.id}/3.jpg">
            <img class="smallImg" src="img/product/${product.id}/4.jpg" bigImgURL="img/product/${product.id}/4.jpg">
            <img class="smallImg" src="img/product/${product.id}/5.jpg" bigImgURL="img/product/${product.id}/5.jpg">
        </div>
    </div>
    <div class="goods_detail_list fr">
        <h3>${product.name}</h3>
        <p>${product.sub_title}</p>
        <div class="price_bar">
            <span class="show_price">¥<em>${product.price}</em></span>
        </div>
        <div class="productSaleAndReviewNumber">
            <div>销量<span style="color: red;font-weight: bold">${product.sale}</span></div>
            <div>累计评价<span style="color: red;font-weight: bold">${product.reviewCount}</span></div>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数量:</div>
            <div class="num_add fl">
                <input type="text" class="num_show fl" value="1" id="number">
                <a href="#nowhere" class="add fr">+</a>
                <a href="#nowhere" class="minus fr">-</a>
            </div>
        </div>
        <div class="total">库存：<em>${product.stock}</em></div>
        <div class="operate_btn">
            <a onclick="javascript:buyLink()" class="buy_btn">立即购买</a>
            <a href="#" class="add_cart" id="add_cart">
                <button class="addCartButton">加入购物车</button>
            </a>
        </div>
    </div>
</div>

<div class="main_wrap clearfix">
<%--    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>热销推荐</h3>
            <ul>
                <c:forEach items="product" var="p" varStatus="vs">
                    <c:if test="${vs.count<=2}">
                        <li>
                            <a href="#"><img src="img/product/${p.id}/1.jpg"></a>
                            <h4><a href="#">${p.name}</a></h4>
                            <div class="price">¥${p.price}</div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>--%>
    <%--  ------------------------------------- 商品介绍-----------------------------%>
    <div class="productDetailDiv">
        <div class="r_wrap fr clearfix">
            <ul class="detail_tab clearfix">
                <li class="native">商品介绍</li>
                <li class="comment">累计评论
                    <span class="reviewCount_number">${product.reviewCount}</span>
                </li>
            </ul>
            <div class="tab_content">
                <div class="productParameterPart clearfix">
                    <div class="productParameter">产品参数:</div>
                    <div class="productParameterList">
                        <c:forEach items="${propertyValues}" var="pv">
                            <span>${pv.property.name} : ${pv.value}</span>
                        </c:forEach>
                    </div>
                </div>

                <div class="productDescriptionPart" style="height: 150px;">
                    <div class="productDescription">产品简介:</div>
                    <span>${product.description}</span>
                </div>
            </div>
        </div>
    </div>

<%--  ------------------------------------- 评价-----------------------------%>
    <div class="productReviewDiv">
        <div class="r_wrap fr clearfix">
            <ul class="detail_tab clearfix">
                <li class="reviewTopDetail">商品介绍</li>
                <li class="native">累计评论
                    <span class="reviewCount_number">${product.reviewCount}</span>
                </li>
            </ul>
            <div class="tab_content">
                <c:forEach items="${reviews}" var="r">
                    <div class="productReviewItem clearfix">
                        <div class="productReviewItemDesc">
                            <div class="productReviewItemContent">${r.content}</div>
                            <div class="productReviewItemDate">${r.createDate}</div>
                        </div>

                        <div class="productReviewItemUserInfo">
                            ${r.user.anonymousName}<span class="userInfoItemPart">（匿名）</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="include/footer.jsp"%>

<script>
    $(function() {
        $("img.smallImg").mouseenter(function() {
            var bigImgURL = $(this).attr("bigImgURL");
            $("img.bigImg").attr("src",bigImgURL);
        });

        var stock = ${product.stock};
        $(".num_show").keyup(function() {
            var num = $(".num_show").val();
            num = parseInt(num);
            if(isNaN(num))
                num = 1;
            if(num <= 0)
                num = 1;
            if(num > stock)
                num = stock;
            $(".num_show").val(num);
        });

        $(".add").click(function() {
            var num = $(".num_show").val();
            num++;
            if(num > stock)
                num = stock;
            $(".num_show").val(num);
        });

        $(".minus").click(function() {
            var num = $(".num_show").val();
            --num;
            if(num <= 0)
                num = 1;
            $(".num_show").val(num);
        });

        $("div.productReviewDiv").hide();
        $("li.comment").click(function() {
            $("div.productReviewDiv").show();
            $("div.productDetailDiv").hide();
        });

        $("li.reviewTopDetail").click(function() {
            $("div.productReviewDiv").hide();
            $("div.productDetailDiv").show();
        });

        $(".add_cart").click(function() {
            var page = "checkLogin";
            $.get(
                page,
                function(result) {
                    if("success" == result) {
                        var product_id = ${product.id};
                        var num = $(".num_show").val();
                        var addCartPage = "/addCart";
                        $.get(
                            addCartPage,
                            {"product_id":product_id,"num":num},
                            function(result) {
                                if("success" == result) {
                                    $(".addCartButton").html("已加入购物车");
                                    $(".addCartButton").attr("disabled","disabled");
                                    $(".addCartButton").css("background-color","lightgray");
                                    $(".addCartButton").css("border-color","lightgray");
                                    $(".addCartButton").css("color","black");
                                }else {
                                }
                            }
                        );
                    }else {
                        alert("请先登录");
                    }
                }
            );
            return false;
        });
    });

    function buyLink() {
        window.location = "/buyOne?product_id=" + ${product.id} + "&number=" + $("#number").val();
    }
</script>
