<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div class="search_bar clearfix">
    <a href="#" class="logo fl"><img src="../home/images/logo.png"></a>
    <div class="search_con fl">
        <form action="/searchProduct">
        <input type="text" name="keyword" class="input_text fl"  placeholder="搜索商品">
            <button type="submit" class="input_btn fr">搜索</button>
        </form>
    </div>
    <div class="guest_cart fr">
        <a href="cart" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="cartTotalItemNumber">${cartTotalItemNumber}</div>
    </div>
</div>
