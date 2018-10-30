<%-- 
    Document   : Login1
    Created on : Oct 11, 2018, 8:40:08 AM
    Author     : NguyenDucThien
--%>

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
        <title>
            Welcome to SE1215
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
            String username =(String) request.getAttribute("LoginAdmin");
            String mess = (String) request.getAttribute("mess");
            if(!username.equals("Login")){
                response.sendRedirect("Admin");
            }
        %>

        <div class="wrapper">
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <div class="logo">
                                <a href="Product">
                                    <img src="images/logo.png" alt="FlatShop">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-8 ">
                            <div class="header_top">
                                <div class="row">
                                    <div class="col-md-3">

                                    </div>
                                
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
                          
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix">
            </div>
            <div class="page-index">
                <div class="container">
                    <p>
                        Home - CheckOut
                    </p>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
        <div class="container_fullwidth">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="checkout-page">
                            <ol class="checkout-steps">
                                <li class="steps active">
                                    <a href="AdminLogin" class="step-title">
                                        Admin Login
                                    </a>
                                    <div class="step-description">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-6">
                                                <div class="run-customer">
                                                    <form  method="post" action="AdminLogin">
                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Email 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="username" required>
                                                        </div>

                                                        <div class="form-row">
                                                            <label class="lebel-abs">
                                                                Password 
                                                                <strong class="red">
                                                                    *
                                                                </strong>
                                                            </label>
                                                            <input type="text" class="input namefild" name="password" required>
                                                        </div>
                                                         <div class="form-row">
                                                            <caption><%=mess%></caption>
                                                        </div>
                                                      
                                                        <button type="submit" value="Login" name="submit" >
                                                            Login
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                            </ol>
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
    <!-- Bootstrap core JavaScript==================================================-->
    <script type="text/javascript" src="js/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="js/bootstrap.min.js">
    </script>
    <script defer src="js/jquery.flexslider.js">
    </script>
    <script type="text/javascript" src="js/jquery.carouFredSel-6.2.1-packed.js">
    </script>
    <script type="text/javascript" src="js/script.min.js" >
    </script>
</body>
</html>