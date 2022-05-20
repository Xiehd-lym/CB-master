<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>素美妆园-后台管理</title>
    <link rel="shortcut icon" href="../assets/smzy.ico" type="image/x-icon">
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="../assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

    <link href="../css/nav.css"  rel="stylesheet"/>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="listCategory">C&B</a>
        </div>
        <ul class="BtnWrap">
            <li class="Admin" style="margin-right: 20px;position: relative;width: 60px;">
                <a href="javascript:;">${admin.name}</a>
                <dl class="nav-child">
                    <dd><a href="/adminLogout" style="color: #000">退出</a></dd>
                </dl>
            </li>
            <%--<li class=""><a href="home">前台首页</a></li>--%>
        </ul>
    </nav>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu" href="listCategory"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="listUser"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a href="listOrder"><i class="fa fa-list-alt"></i> 订单管理</a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        分类管理
                        <small> - ${category.name} : 属性值管理 - 编辑属性</small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="javascript:history.back()" class="btn btn-success">返回上一页</a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-6">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            编辑属性名称
                        </div>
                        <div class="panel-body">
                            <div class="row col-lg-12">
                                <form action="updateProperty" role="form">
                                    <div class="form-group">
                                        <%-- 隐藏id属性，一并提交 --%>
                                        <input type="hidden" name="id" value="${property.id}">
                                        <label>属性名称：</label>
                                        <input name="name" class="form-control" value="${property.name}"> <br/>
                                        <input type="hidden" name="category_id" value="${category.id}">
                                        <div class="pull-right">
                                            <input type="submit" class="btn btn-default">
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
</body>
</html>
