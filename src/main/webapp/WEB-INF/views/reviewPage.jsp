<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>

<div class="search_bar clearfix">
    <a href="home" class="logo fl"><img src="../home/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;评价</div>
    <div class="search_con fr">
        <form action="/searchProduct">
            <input type="text" value="${param.keyword}" class="input_text fl" placeholder="搜索商品" name="keyword">
            <button type="submit" class="input_btn fr">搜索</button>
        </form>
    </div>
</div>

<div class="reviewDiv">
    <div class="reviewProductInfoDiv">
        <div class="reviewProductInfoImg"><img width="200px" height="200px" src="img/product/${product.id}/1.jpg"></div>
        <div class="reviewProductInfoRightDiv">
            <div class="reviewProductInfoRightText">
                ${product.name}
            </div>
            <table class="reviewProductInfoTable">
                <tr>
                    <td width="75px">价格:</td>
                    <td><span class="reviewProductInfoTablePrice">￥${product.price}</span> 元</td>
                </tr>
                <tr>
                    <td>配送</td>
                    <td>快递: 0.00</td>
                </tr>
                <tr>
                    <td>月销量:</td>
                    <td><span class="reviewProductInfoTableSellNumber">${product.sale}</span> 件</td>
                </tr>
            </table>

        </div>
        <div style="clear:both"></div>
    </div>
    <div class="reviewStasticsDiv">
        <div class="reviewStasticsLeft">
            <div class="reviewStasticsLeftTop"></div>
            <div class="reviewStasticsLeftContent">累计评价 <span
                    class="reviewStasticsNumber"> ${product.reviewCount}</span></div>
            <div class="reviewStasticsLeftFoot"></div>
        </div>
        <div class="reviewStasticsRight">
            <div class="reviewStasticsRightEmpty"></div>
            <div class="reviewStasticsFoot"></div>
        </div>
    </div>

    <c:if test="${param.showonly==true}">
        <div class="reviewDivlistReviews">
            <c:forEach items="${reviews}" var="r">
                <div class="reviewDivlistReviewsEach">
                    <div class="reviewDate">${r.createDate}</div>
                    <div class="reviewContent">${r.content}</div>
                    <div class="reviewUserInfo pull-right">${r.user.anonymousName}<span class="reviewUserInfoAnonymous">(匿名)</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${param.showonly!=true}">
        <div class="makeReviewDiv">
            <form method="post" action="doReview">
                <div class="makeReviewText">其他买家，需要你的建议哦！</div>
                <table class="makeReviewTable">
                    <tr>
                        <td class="makeReviewTableFirstTD">评价商品</td>
                        <td><textarea name="content"></textarea></td>
                    </tr>
                </table>
                <div class="makeReviewButtonDiv">
                    <input type="hidden" name="order_id" value="${order.id}">
                    <input type="hidden" name="product_id" value="${product.id}">
                    <button type="submit">提交评价</button>
                </div>
            </form>
        </div>
    </c:if>
</div>

<%@include file="include/footer.jsp"%>