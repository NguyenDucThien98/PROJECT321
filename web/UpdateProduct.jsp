<%-- 
    Document   : UpdateProduct
    Created on : Oct 21, 2018, 8:37:51 PM
    Author     : NguyenDucThien
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/favicon.png">
        <title>
            Welcome to FlatShop
        </title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
    </script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js">
    </script>
    <![endif]-->
    </head>
    <body>
        <%
            
            String username = (String) request.getAttribute("LoginAdmin");
            ResultSet rs;
            ResultSet rs1;
            String mess = "a";// (String) request.getAttribute("mess");
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
                                                <a href="Admin" class="log">
                                                    <%=username%>
                                                </a>
                                            </li>
                                            <%
                                                if (!username.equals("Login")) {
                                                    out.print("<li>"
                                                            + " <a href=\"Admin?service=signout\" class=\"log\">"
                                                            + " Sign out"
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

                                        <li>

                                            <a href="Admin?service=customerManager" >
                                                Customer Manager
                                            </a>
                                        </li>
                                        <li>

                                            <a  href="Admin?service=productManager">
                                                Product Manager
                                            </a>
                                        </li>
                                        <li>
                                            <a  href="Admin?service=billManager">
                                                Bill Manager
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
                        <%
                            rs = (ResultSet) request.getAttribute("rsSanPham");
                            rs1 = (ResultSet) request.getAttribute("rsHangSanXuat");
                            if (rs.next()) {
                        %>
                        <div class="col-md-12">
                            <div class="products-details">
                                <div class="preview_image">
                                    <img  src="<%= rs.getString(5)%>"  alt="">
                                </div>
                                <div class="products-description">
                                    <h3 class="name">
                                        <%= rs.getString(2)%>
                                    </h3>
                                    <h5  class="namee">
                                        ID : <%= rs.getString(1)%>
                                    </h5>
                                    <h5  class="namee">
                                        Quantity : <%= rs.getString(3)%>
                                    </h5>
                                    <h5  class="namee">
                                        Description : <%= rs.getString(6)%>
                                    </h5>
                                    <h5  class="namee">
                                        Price : <%= rs.getString(4)%>
                                    </h5>
                                    <h5  class="namee">
                                        Picture : <%= rs.getString(5)%>
                                    </h5>
                                    <h5  class="namee">
                                        Manufacturer : <%= rs.getString(10)%>
                                    </h5>
                                    <h5  class="namee">
                                        Status : <%= rs.getString(7)%>
                                    </h5>

                                </div>

                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="tab-box">
                                <div class="tab-content-wrap">
                                    <div class="tab-content" id="Reviews">
                                        <form   action="Admin"  method="post">
                                            <input type="hidden" name="service" value="updateProduct">
                                            <input type="hidden" name="sid" value="<%=rs.getString(1)%>">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">

                                                    <div class="form-row">
                                                        <label class="lebel-abs">
                                                            Name
                                                            <strong class="red">
                                                                *
                                                            </strong>
                                                        </label>
                                                        <input  type="text" name="sname" class="input namefild" value="<%= rs.getString(2)%>" required> 
                                                    </div>
                                                    <div class="form-row">
                                                        <label class="lebel-abs">
                                                            Quantity
                                                            <strong class="red">
                                                                *
                                                            </strong>
                                                        </label>
                                                        <input type="text" name="quantity" class="input namefild" value="<%= rs.getString(3)%>" required>
                                                    </div>
                                                    <div class="form-row">
                                                        <label class="lebel-abs">
                                                            Price 
                                                            <strong class="red">
                                                                *
                                                            </strong>
                                                        </label>
                                                        <input type="text" name="price" class="input namefild" value="<%= rs.getString(4)%>" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="form-row">
                                                        <label class="lebel-abs">
                                                            Picture 
                                                            <strong class="red">
                                                                *
                                                            </strong>
                                                        </label>
                                                        <input type="text" name="picture" class="input namefild" value="<%= rs.getString(5)%>" required>
                                                    </div>
                                                    <div class="form-row">
                                                        <label class="lebel-abs">
                                                            Description 
                                                            <strong class="red">
                                                                *
                                                            </strong>
                                                        </label>
                                                        <input type="text" name="description" class="input namefild" value="<%= rs.getString(6)%>">
                                                    </div>

                                                    <div class="form-row">
                                                        <label class="lebel-abs">
                                                            Manufacturer 
                                                            <strong class="red">
                                                                *
                                                            </strong>
                                                        </label>
                                                        <select name="hid" style="height: 40px; width: 100%; margin-left: 0px; border-radius: 10px; border: 1px solid #cccccc; padding-left: 100px;  ">
                                                            <% while (rs1.next()) {
                                                                    if (rs.getInt(8) == rs1.getInt(1)) {
                                                            %>                                                                   %>
                                                            <option value="<%= rs1.getInt(1)%>" selected> <%= rs1.getString(2)%> </option>
                                                            <% } else {%>

                                                            <option value="<%= rs1.getInt(1)%>" > <%= rs1.getString(2)%> </option>
                                                            <% }
                                                                }%>
                                                        </select>

                                                    </div>
                                                    <div class="form-row">
                                                        <input type="submit" value="Submit" class="button">


                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <%}%>
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
    </body>
</html>