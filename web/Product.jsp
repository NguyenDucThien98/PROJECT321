<%-- 
    Document   : ProductAll
    Created on : Oct 9, 2018, 3:13:59 PM
    Author     : NguyenDucThien
--%>



<%@page import="model.DAOProduct"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/favicon.png">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <%
            String username = (String) request.getAttribute("username");
            String countP = (String) request.getAttribute("countProduct");
            ResultSet rs;
            if (request.getAttribute("username") == null || request.getAttribute("countProduct") == null || request.getAttribute("listManufacturer") == null) {
                response.sendRedirect("Product");
            } else {
        %>
        <div class="wrapper">
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <div class="logo">
                                <a href="Product">
                                    <img src="images/logo.png" alt="SE1215">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-10 col-sm-10">
                            <div class="header_top">
                                <div class="row">
                                    <div class="col-md-3">

                                    </div>
                                    <div class="col-md-6">
                                        <ul class="topmenu">
                                            <li>
                                                <a href="#">
                                                    Nguyễn Đức Thiện 
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    SE1215
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    SE05883
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    Project PRJ321
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                    <div class="col-md-3">
                                        <ul class="usermenu">
                                            <li>
                                                <a href="Login" class="log">
                                                    <%=username%>
                                                </a>
                                            </li>
                                            <%
                                                if (!username.equals("Login")) {
                                                    out.print("<li>"
                                                            + " <a href=\"Product?service=signout\" class=\"log\">"
                                                            + " Sign out"
                                                            + " </a>"
                                                            + " </li>");
                                                } else {
                                                    out.print("<li>"
                                                            + " <a href=\"Register\" class=\"reg\">"
                                                            + "  Register"
                                                            + " </a>"
                                                            + " </li>");
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="header_bottom">
                                <ul class="option">
                                    <li id="search" class="search">
                                        <form>
                                            <input class="search-submit" type="submit" value="">
                                            <input class="search-input" placeholder="Enter your search term..." type="text" value="" name="search">
                                        </form>
                                    </li>
                                    <li class="option-cart">
                                        <a href="Cart" class="cart-icon">
                                            cart 
                                            <span class="cart_no">
                                                <%=countP%>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="sr-only">
                                            Toggle navigation
                                        </span>
                                        <span class="icon-bar">
                                        </span>
                                        <span class="icon-bar">
                                        </span>
                                        <span class="icon-bar">
                                        </span>
                                    </button>
                                </div>
                                <div class="navbar-collapse collapse">
                                    <ul class="nav navbar-nav">
                                        <li class="active dropdown">
                                            <a href="Product">
                                                Home
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix">
            </div>
            <div class="container_fullwidth">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="category leftbar">
                                <h3 class="title">
                                    Hãng Sản Xuất
                                </h3>
                                <ul>
                                    <%
                                        rs = (ResultSet) request.getAttribute("listManufacturer");
                                        while (rs.next()) {
                                            if (rs.getBoolean(4) == true) {
                                                out.println("<li><a href = \"Product?hid=" + rs.getInt(1) + "\">" + rs.getString(2) + "</a> </li >");
                                            }
                                        }
                                    %>
                                </ul>
                            </div>
                            <div class="leftbanner">
                                <img src="images/banner-small-01.png" alt="">
                            </div>

                        </div>
                        <div class="col-md-9">
                            <div class="banner">
                                <div class="bannerslide" id="bannerslide">
                                    <ul class="slides">
                                        <li>
                                            <a href="#">
                                                <img src="images/banner-01.jpg" alt=""/>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/banner-02.jpg" alt=""/>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="products-grid">
                                <div class="toolbar">


                                </div>
                                <div class="clearfix">
                                </div>
                                <div class="row">
                                    <%
                                        ResultSet rsLoadProduct = (ResultSet) request.getAttribute("listProduct");
                                        while (rsLoadProduct.next()) {
                                            String checkNew = rsLoadProduct.getString(6);
                                            if (checkNew.equals("")) {
                                                checkNew = "";
                                            } else {
                                                checkNew = "<div class=\"offer\">" + checkNew + "</div>";
                                            }
                                            boolean checkQuantity = true;
                                            if (rsLoadProduct.getInt(3) <= 0) {
                                                checkQuantity = false;
                                            }
                                    %>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="products">
                                            <%=checkNew%>
                                            <div class="thumbnail">
                                                <a href="details.html">
                                                    <img src=" <%=rsLoadProduct.getString(5)%>" alt="Product Name">
                                                </a>
                                            </div>
                                            <div class="productname">
                                                <%=rsLoadProduct.getString(2)%>
                                            </div>
                                            <h4 class="price">
                                                $ <%=rsLoadProduct.getDouble(4)%>
                                            </h4>
                                            <div class="button_group">
                                                <% if (checkQuantity) {%>
                                                <a href=Cart?service=AddProduct&id=<%=rsLoadProduct.getInt(1)%>>
                                                    <button class="button add-cart" type="button">
                                                        Add To Cart
                                                    </button>
                                                </a>
                                                <%} else {%>
                                                <button class="button add-cart" type="button">
                                                    Add To Cart
                                                </button>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }

                                    %>
                                </div>
                                <div class="clearfix">
                                </div>
                                <div class="toolbar">
                                    <%  int pageProduct = 1;
                                        if (request.getParameter("page") != null) {
                                            pageProduct = Integer.parseInt(request.getAttribute("page").toString());
                                        }
                                        int pageNum = 1;
                                        if (request.getAttribute("countpage") != null) {
                                            pageNum = Integer.parseInt(request.getAttribute("countpage").toString());
                                        }
                                        System.out.println("aaaaaaaaaaa"+pageNum);

                                    %>
                                    <div class="pager">
                                        <%for (int i = 0; i < pageNum; i++) {
                                        String checkSelect="";
                                        if((i+1)==pageProduct){
                                            checkSelect = "class=\"active\"";
                                        }
                                        %>
                                        <a href="Product?page=<%=(i+1)%>" <%=checkSelect%>>
                                            <%=i+1%>
                                        </a>
                                        <% } %>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
            <div class="clearfix">
            </div>
            <div class="footer">
                <div class="footer-info">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="footer-logo">
                                    <a href="#">
                                        <img src="images/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <h4 class="title">
                                    Contact 
                                    <strong>
                                        Info
                                    </strong>
                                </h4>
                                <p>
                                    Nguyễn Đức Thiện - SE05883
                                </p>
                                <p>
                                    Call Us : 0566662225
                                </p>
                                <p>
                                    Email : Thienndse05883@gmail.com
                                </p>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <h4 class="title">
                                    Customer
                                    <strong>
                                        Support
                                    </strong>
                                </h4>
                                <ul class="support">
                                    <li>
                                        <a href="#">
                                            FAQ
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Payment Option
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Booking Tips
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Infomation
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <h4 class="title">
                                    PRJ
                                    <strong>
                                        321
                                    </strong>
                                </h4>
                                <p>
                                    Project PRJ321
                                </p>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyright-info">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <p>
                                    Copyright © 2018. Designed by 
                                    <a href="#">
                                        Nguyen Duc Thien
                                    </a>
                                    . All rights reseved
                                </p>
                            </div>
                            <div class="col-md-6">
                                <ul class="social-icon">
                                    <li>
                                        <a href="#" class="linkedin">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="google-plus">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="twitter">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="facebook">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="js/jquery-1.10.2.min.js">
        </script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js">
        </script>
        <script type="text/javascript" src="js/bootstrap.min.js">
        </script>
        <script defer src="js/jquery.flexslider.js">
        </script>
        <script type="text/javascript" src="js/jquery.sequence-min.js">
        </script>
        <script type="text/javascript" src="js/jquery.carouFredSel-6.2.1-packed.js">
        </script>
        <script type="text/javascript" src="js/script.min.js" >
        </script>
        <%}%>
    </body>
</html>