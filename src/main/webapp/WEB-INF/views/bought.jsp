<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>
<%@include file="include/modal.jsp"%>
<style>
    .myTr td{
        float: none;
    }
    button.orderListItemStyle {
        border: 1px solid #dcdcdc;
        background-color: #fff;
        border-radius: 2px;
        color: #3C3C3C;
        font-size: 12px;
        font-weight: bold;
        padding: 6px 12px;
    }
    button.orderListItemStyle:hover {
        border-color: #fc66a2;
        color: #fc66a2;
    }
</style>
<div class="boughtDiv">
    <div class="orderType">
        <div class="selectOrderType"><a orderStatus="all" href="#">所有订单</a></div>
        <div><a orderStatus="waitPay" href="#">待付款</a></div>
        <div><a orderStatus="waitDelivery" href="#">待发货</a></div>
        <div><a orderStatus="waitConfirm" href="#">待收货</a></div>
        <div><a orderStatus="waitReview" href="#" class="noRightborder">待评价</a></div>
        <div class="orderTypeLastOne"><a class="noRightborder"> </a></div>
    </div>

    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tr>
                <td>宝贝</td>
                <td width="121px">单价</td>
                <td width="121px">数量</td>
                <td width="141px">实付款</td>
                <td width="121px">交易操作</td>
            </tr>
        </table>
    </div>
<c:forEach items="${orders}" var="o">
     <div orderStatus="${o.status}" oid="${o.id}">
        <table class="order_list_th w978s clearfix">
            <tr class="myTr">
                <td class="col01">${o.create_date}</td>
                <td class="col02">订单号:${o.order_code}</td>
                <td class="orderItemDeleteLi">
                    <a href="#" class="deleteOrderLink" oid="${o.id}">
                       <span class="orderListItemDelete" style=" margin-right: -13px;">删除</span>
                    </a>
                </td>
            </tr>
        </table>
        <table class="order_list_table w980">
            <c:forEach items="${o.orderItems}" var="oi" varStatus="vs">
                <tr>
                    <td>
                        <ul class="order_goods_list clearfix">
                            <li class="col01"><img src="img/product/${oi.product.id}/1.jpg"></li>
                            <li class="col02">${oi.product.name}</li>
                        </ul>
                    </td>
                    <td width="121px">${oi.product.price}元</td>
                    <td width="121px">${oi.number}</td>
                    <td width="141px">
                        <fmt:formatNumber type="number" value=" ${o.total}" minFractionDigits="2"/>元
                    </td>
                    <td width="121px">
                        <c:if test="${o.status=='waitConfirm'}">
                            <a href="confirmPay?order_id=${o.id}">
                                <button class="orderListItemStyle">确认收货</button>
                            </a>
                        </c:if>

                        <c:if test="${o.status=='waitPay'}">
                            <a href="payPage.jsp?order_id=${o.id}&total=${o.total}">
                                <button class="orderListItemStyle">付款</button>
                            </a>
                        </c:if>

                        <c:if test="${o.status=='waitDelivery'}">
                            <span>待发货</span>
                        </c:if>

                        <c:if test="${o.status=='waitReview'}">
                            <a href="review?order_id=${o.id}">
                                <button class="orderListItemStyle">评价</button>
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
     </div>
</c:forEach>
</div>

<script>
    var deleteOrder = false;
    var deleteOrderId = 0;
    $(function() {
        $("a[orderStatus]").click(function() {
            var orderStatus = $(this).attr("orderStatus");
            if('all' == orderStatus) {
                $("div[orderStatus]").show();
            }else {
                $("div[orderStatus]").hide();
                $("div[orderStatus=" + orderStatus + "]").show();
            }
            $("div.orderType div").removeClass("selectOrderType");
            $(this).parent("div").addClass("selectOrderType");
        });
        $("a.deleteOrderLink").click(function() {
            deleteOrderId = $(this).attr("oid");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });
        $("button.deleteConfirmButton").click(function() {
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });
        $('#deleteConfirmModal').on('hidden.bs.modal',function(e) {
            if(deleteOrder) {
                var page = "deleteOrder";
                $.post(
                    page,
                    {"order_id":deleteOrderId},
                    function(result) {
                        if("success" == result) {
                            $("table.orderListItemTable[oid=" + deleteOrderId + "]").hide();
                        }else {
                            location.href="login.jsp";
                        }
                    }
                );
            }
        })
    });
</script>
<%@include file="include/footer.jsp"%>