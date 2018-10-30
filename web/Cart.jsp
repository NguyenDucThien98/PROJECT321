<%-- 
    Document   : Cart
    Created on : Oct 11, 2018, 11:38:25 AM
    Author     : NguyenDucThien
--%>

<%@page import="model.DAODetailedInvoice"%>
<%@page import="entity.DetailedInvoice"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.DAOInvoice"%>
<%@page import="entity.Invoice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
            String username = (String) request.getAttribute("username");
            String countP = (String) request.getAttribute("countProduct");
            String mess = (String) request.getAttribute("mess");
            ResultSet rs;
            Double finalTotal = (Double) request.getAttribute("finalTotal");
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
                <div class="container shopping-cart">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="title">
                                Shopping Cart
                            </h3>
                            <div class="clearfix">
                            </div>
                            <form method="get" action="Cart">
                                <input type="hidden" name="service" value="update"/>

                                <table class="shop-table" >
                                    <thead>
                                        <tr>
                                            <th>
                                                Image
                                            </th>
                                            <th>
                                                Dtails
                                            </th>
                                            <th>
                                                Price
                                            </th>
                                            <th>
                                                Quantity
                                            </th>
                                            <th>
                                                Price
                                            </th>
                                            <th>
                                                Delete
                                            </th>
                                        </tr>
                                    </thead>

                                    <tbody>            
                                        <%
                                            String check = (String) request.getAttribute("check");
                                            int i = 0;
                                            if (check.equals("true")) {
                                                rs = (ResultSet) request.getAttribute("rsDisProduct");
                                                while (rs.next()) {
                                                    String name = rs.getString("sname");
                                                    String id = rs.getInt("sid") + "";
                                                    String quantity = session.getAttribute(id).toString();
                                                    String image = rs.getString(5);
                                                    Double price = rs.getDouble("price");
                                                    Double total = Integer.parseInt(quantity) * price;
                                                    %> <input type="hidden" name="id<%=i%>" value="<%=id%>"/><%
                                                    out.println(
                                                            "<tr>"
                                                            + "                  <td>"
                                                            + "                      <img src=\"" + image + "\" alt=\" \">"
                                                            + "                  </td>"
                                                            + "                  <td>"
                                                            + "                      <div class=\"shop-details\">"
                                                            + "                          <div class=\"productname\">"
                                                            + "                             " + name
                                                            + "                          </div>"
                                                            + "                          <p>"
                                                            + "                              Product Code : "
                                                            + "                              <strong class=\"pcode\"  >"
                                                            + "                                  " + id
                                                            + "                              </strong>"
                                                            + "                          </p>"
                                                            + "                      </div>"
                                                            + "                  </td>"
                                                            + "                  <td>"
                                                            + "                      <h5>"
                                                            + "                       $" + price
                                                            + "                      </h5>"
                                                            + "                  </td>"
                                                            + "                  <td>"
                                                            + "  <input id=\"quantity\" type=\"number\" name=\"quantity" + i + "\" value=\"" + quantity + "\" min=\"1\" max=\"10\" class=\"form-control quantity-input\" >"
                                                            + "                  </td>"
                                                            + "                  <td>"
                                                            + "                      <h5>"
                                                            + "                          <strong class=\"red\">"
                                                            + "                              $" + total
                                                            + "                          </strong>"
                                                            + "                      </h5>"
                                                            + "                  </td>"
                                                            + "                  <td>"
                                                            + "                      <a href=\"Cart?service=removeAProduct&idRemove=" + id + "\">"
                                                            + "                          <img src=\"images/remove.png\" alt=\"\">"
                                                            + "                      </a>"
                                                            + "                  </td>"
                                                            + "              </tr>"
                                                    );
                                                    i++;
                                                }
                                            }
                                        %>

                                    </tbody>
                                    <input type="hidden" name="i" value="<%=i%>"/>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">
                                                <a href = "Product">
                                                    <button type="button" class="pull-left" >
                                                        Continue Shopping
                                                    </button>
                                                </a>

                                                <a href = "Cart?service=removeAllProduct">
                                                    <button type="button" class=" pull-right"   >
                                                        Remove All
                                                    </button>
                                                </a>
                                                <button class=" pull-right" type = "submit">
                                                    Update Shopping Cart
                                                </button>
                                            </td>
                                        </tr>
                                    </tfoot>

                                </table>
                            </form>
                            <h1><%=mess%></h1>
                            <div class="clearfix">
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-sm-6">
                                </div>
                                <div class="col-md-4 col-sm-6">
                                </div>
                                <div class="col-md-4 col-sm-6">
                                    <div class="shippingbox">
                                        <div class="subtotal">
                                            <h5>
                                                Sub Total
                                            </h5>
                                            <span>
                                                $<%=finalTotal%>
                                            </span>
                                        </div>
                                        <div class="grandtotal">
                                            <h5>
                                                GRAND TOTAL 
                                            </h5>
                                            <span>
                                                $<%=finalTotal%>
                                            </span>
                                        </div>

                                        <a href="Cart?service=insertDB&finalTotal=<%=finalTotal%>">
                                            <button>
                                                Process To Checkout
                                            </button>
                                        </a>

                                    </div>
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
