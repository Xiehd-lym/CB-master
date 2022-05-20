<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>
<%@include file="include/modal.jsp"%>
<div class="search_bar clearfix">
    <a href="home" class="logo fl"><img src="../home/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
    <div class="search_con fr">
        <form action="/searchProduct">
            <input type="text" value="${param.keyword}" class="input_text fl" placeholder="搜索商品" name="keyword">
            <button type="submit" class="input_btn fr">搜索</button>
        </form>
    </div>
</div>

<div class="total_count"><em></em></div>
<ul class="cart_list_th clearfix">
    <li class="col01">
        <img selectit="false" class="selectAllItem" src="img/fore/cartNotSelected.png">全选</li>
    <li class="col02">商品名称</li>
    <li class="col03">价格</li>
    <li class="col04">数量</li>
    <li class="col05">小计</li>
    <li class="col06">操作</li>
</ul>
<c:forEach items="${orderItems}" var="oi">
    <ul class="cart_list_td clearfix cartProductItemUl" orderItemId="${oi.id}">
        <li class="col01">
            <img selectit="false" orderItemId="${oi.id}" class="cartProductItemIfSelected" src="img/fore/cartNotSelected.png">
            <a style="display:none" href="#nowhere"><img src="img/fore/cartSelected.png"></a>

        </li>
        <li class="col02"><img src="img/product/${oi.product.id}/1.jpg"></li>
        <li class="col03">
            <a href="/showProduct?product_id=${oi.product.id}">
                ${oi.product.name}
            </a>
        </li>
        <li class="col04">${oi.product.price}元</li>
        <li class="col05">
            <div class="num_add">
                <span class="hidden orderItemStock" product_id="${oi.product.id}" style="display: none">${oi.product.stock}</span>
                <span class="hidden orderItemPrice" product_id="${oi.product.id}" style="display: none">${oi.product.price}</span>
                <a href="#" class="add fl" product_id="${oi.product.id}" stock="${oi.product.stock}">+</a>
                <input product_id="${oi.product.id}" orderItemId="${oi.id}" autocomplete="off" class="num_show fl" value="${oi.number}">
                <a href="#" class="minus fl"  product_id="${oi.product.id}">-</a>
            </div>
        </li>
        <li class="col06">
            <span orderItemId="${oi.id}" product_id="${oi.product.id}" class="cartProductItemSmallSumPrice">
                    <fmt:formatNumber type="number" value="${oi.product.price * oi.number}" minFractionDigits="2"/>
            </span>
        </li>
        <li class="col07"><a class="deleteOrderItem" orderItemId="${oi.id}" href="#" >删除</a></li>
    </ul>
</c:forEach>
<ul class="settlements">
    <li class="col01"><img selectit="false" class="selectAllItem" src="img/fore/cartNotSelected.png"></li>
    <li class="col02">全选</li>
    <li class="col03">合计：<em><span class="cartSumPrice">¥ 0.00</span></em><br>共计<b class="cartSumNumber">0</b>件商品</li>
    <li class="col04"><button class="createOrderButton" disabled="disabled" style="cursor: pointer">结算</button></li>
</ul>
<script>
    function formatMoney(num) {
        num = num.toString().replace(/\$|\,/g,'');
        if(isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num * 100 + 0.50000000001)
        cents = num % 100;
        num = Math.floor(num / 100).toString();
        if(cents < 10)
            cents = "0" + cents;
        for(var i = 0;i <Math.floor((num.length - (1 + i)) / 3);i++)
            num = num.substring(0,num.length - (4 * i + 3)) + ','+ num.substring(num.length - (4 * i + 3));
        return (((sign) ? '' : '-') + num + '.' + cents);
    }


    var deleteOrderItem = false;
    var deleteOrderItemId = 0;
    $(function() {
        $("a.deleteOrderItem").click(function() {
            deleteOrderItem = false;
            var orderItemId = $(this).attr("orderItemId");
            deleteOrderItemId = orderItemId;
            $("#deleteConfirmModal").modal('show');
        });
        $("button.deleteConfirmButton").click(function() {
            deleteOrderItem = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal',function(e) {
            if(deleteOrderItem) {
                var page = "deleteOrderItem";
                $.post(
                    page,
                    {"orderItemId" : deleteOrderItemId},
                    function(result) {
                        if("success" == result) {
                            $("ul.cartProductItemUl[orderItemId=" + deleteOrderItemId + "]").hide();
                        }else {
                            location.href = "/cart";
                        }
                    }
                );
            }
        })

        $("img.cartProductItemIfSelected").click(function () {
            var selectit = $(this).attr("selectit");
            if("selectit" == selectit) {
                $(this).attr("src","img/fore/cartNotSelected.png");
                $(this).attr("selectit","false");
                $(this).parents("ul.cartProductItemUl").css("background-color","#fff");
            }else {
                $(this).attr("src","img/fore/cartSelected.png");
                $(this).attr("selectit","selectit");
                $(this).parents("ul.cartProductItemUl").css("background-color","#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });

        $("img.selectAllItem").click(function() {
            var selectit = $(this).attr("selectit");
            if("selectit" == selectit) {
                $("img.selectAllItem").attr("src","img/fore/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit","false");
                $(".cartProductItemIfSelected").each(function() {
                    $(this).attr("src","img/fore/cartNotSelected.png");
                    $(this).attr("selectit","false");
                    $(this).parents("ul.cartProductItemUl").css("background-color","#fff");
                });
            }else {
                $("img.selectAllItem").attr("src","img/fore/cartSelected.png");
                $("img.selectAllItem").attr("selectit","selectit");
                $(".cartProductItemIfSelected").each(function() {
                    $(this).attr("src","img/fore/cartSelected.png");
                    $(this).attr("selectit","selectit");
                    $(this).parents("ul.cartProductItemUl").css("background-color","#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });

        $(".num_show").keyup(function() {
            var product_id = $(this).attr("product_id");
            var stock = $("span.orderItemStock[product_id=" + product_id + "]").text();
            var price = $("span.orderItemPrice[product_id=" + product_id + "]").text();
            var num = $(".num_show[product_id=" + product_id + "]").val();
            num = parseInt(num);
            if(isNaN(num))
                num = 1;
            if(num <= 0)
                num = 1;
            if(num = stock)
                num = stock;
            syncPrice(product_id,num ,price);
        });

        $(".add").click(function() {
            var product_id = $(this).attr("product_id");
            var stock = $("span.orderItemStock[product_id=" + product_id + "]").text();
            var price = $("span.orderItemPrice[product_id=" + product_id + "]").text();
            var num = $(".num_show[product_id=" + product_id + "]").val();
            num++;
            if(num > stock)
                num = stock;
            syncPrice(product_id,num,price);
        });

        $(".minus").click(function() {
            var product_id = $(this).attr("product_id");
            var stock  =$("span.orderItemStock[product_id=" + product_id + "]").text();
            var price = $("span.orderItemPrice[product_id=" + product_id + "]").text();
            var num = $(".num_show[product_id=" + product_id + "]").val();
            --num;
            if(num <= 0)
                num = 1;
            syncPrice(product_id,num,price);
        });

        $("button.createOrderButton").click(function() {
            var params = "";
            $(".cartProductItemIfSelected").each(function() {
                if("selectit" == $(this).attr("selectit")) {
                    var orderItemId = $(this).attr("orderItemId");
                    params += "&orderItemId=" + orderItemId;
                }
            });
            params = params.substring(1);
            location.href = "buy?" + params;
        });
    });

    function syncCreateOrderButton() {
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function() {
            if("selectit" == $(this).attr("selectit")) {
                selectAny = true;
            }
        });

        if(selectAny) {
            $("button.createOrderButton").css("background-color","#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }else {
            $("button.createOrderButton").css("background-color","#AAAAAA");
            $("button.createOrderButton").removeAttr("disabled","disabled");
        }
    }

    function syncSelect() {
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function() {
            if("false" == $(this).attr("selectit")) {
                selectAll = false;
            }
        });
        if(selectAll)
            $("img.selectAllItem").attr("src","img/fore/cartSelected.png");
        else
            $("img.selectAllItem").attr("src","img/fore/cartNotSelected.png");
    }

    function calcCartSumPriceAndNumber() {
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function() {
            var orderItemId = $(this).attr("orderItemId");
            var price = $(".cartProductItemSmallSumPrice[orderItemId=" + orderItemId + "]").text();
            price = price.replace(/,/g,"");
            price = price.replace(/￥/g,"");
            sum += new Number(price);
            var num = $(".num_show[orderItemId=" + orderItemId + "]").val();
            totalNumber += new Number(num);
        });
        $("span.cartSumPrice").html("￥" + formatMoney(sum));
        $("b.cartSumNumber").html(totalNumber);
    }
        function syncPrice(product_id,num ,price) {
            $(".num_show[product_id=" + product_id + "]").val(num);
            var cartProductItemSmallSumPrice = formatMoney(num * price);
            $(".cartProductItemSmallSumPrice[product_id=" + product_id + "]").html("￥" + cartProductItemSmallSumPrice);
            calcCartSumPriceAndNumber();

            var page = "changeOrderItem";
            $.post(
                page,
                {"product_id":product_id,"number":num},
                function(resullt) {
                    if("success" != result) {
                        location.href = "login.jsp"
                    }
                }
            );
        }

</script>
<%@include file="include/footer.jsp"%>