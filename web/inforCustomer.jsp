<%-- 
    Document   : index.jsp
    Created on : Oct 18, 2018, 5:41:30 PM
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
            String mess = (String) request.getAttribute("mess");
            String check = "false";
            if (request.getAttribute("check") != null) {
                check = "true";
            }
            ResultSet rs;
            System.out.println("aaaaaaaaaaaaaa" + check);

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
                <div class="clearfix">
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
                                        <a href="checkout.html" class="step-title">
                                            Update Account
                                        </a>
                                        <%  rs = (ResultSet) request.getAttribute("rsInfor");
                                            if (rs.next()) {
                                        %>
                                        <div class="step-description">
                                            <form  method="post" action="Login?service=updateInfor">
                                                <input type="hidden"  name="cid" value="<%=rs.getString(1)%>"  >
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6">
                                                        <div class="your-details">
                                                            <h5>
                                                                Your Persional Details
                                                            </h5>
                                                            <div class="form-row">
                                                                <label class="lebel-abs">
                                                                    Name 
                                                                    <strong class="red">
                                                                        *
                                                                    </strong>
                                                                </label>
                                                                <input type="text" class="input namefild" name="Name" value="<%=rs.getString(2)%>"  required>
                                                            </div>
                                                            <div class="form-row">
                                                                <label class="lebel-abs">
                                                                    Telephone 
                                                                    <strong class="red">
                                                                        *
                                                                    </strong>
                                                                </label>
                                                                <input type="text" class="input namefild" name="Telephone" value="<%=rs.getString(4)%>" required>
                                                            </div>


                                                            <div class="form-row">
                                                                <label class="lebel-abs">
                                                                    Address 
                                                                    <strong class="red">
                                                                        *
                                                                    </strong>
                                                                </label>
                                                                <input type="text" class="input namefild" name="Address" value="<%=rs.getString(3)%>" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <h5><%=mess%></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6">
                                                        <div class="your-details">
                                                            <h5>
                                                                Register
                                                            </h5>
                                                            <div class="form-row">
                                                                <label class="lebel-abs">
                                                                    UserName 
                                                                    <strong class="red">
                                                                        *
                                                                    </strong>
                                                                </label>
                                                                <input type="text" class="input namefild" name="UserName" minlength="6" value="<%=rs.getString(5)%>" readonly="" required>
                                                            </div>

                                                            <div class="form-row">
                                                                <label class="lebel-abs">
                                                                    Your Password 
                                                                    <strong class="red">
                                                                        *
                                                                    </strong>
                                                                </label>
                                                                <input type="password" class="input namefild" name="Password" minlength="6" value="<%=rs.getString(6)%>" required>
                                                            </div>
                                                            <div class="form-row">
                                                                <label class="lebel-abs">
                                                                    Confirm Your Password 
                                                                    <strong class="red">
                                                                        *
                                                                    </strong>
                                                                </label>
                                                                <input type="password" class="input cpass" name="Password2" value="<%=rs.getString(6)%>" required>
                                                            </div>

                                                            <button>
                                                                Update
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <%}%>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="checkout-page">
                                <ol class="checkout-steps">
                                    <li class="steps active">
                                        <a href="checkout.html" class="step-title">
                                            Your Bill
                                        </a>
                                        <div class="step-description">
                                            <table class=" shop-table2 ">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            Bill ID
                                                        </th>
                                                        <th>
                                                            Customer Name
                                                        </th>
                                                        <th>
                                                            Date
                                                        </th>
                                                        <th>
                                                            Total
                                                        </th>
                                                        <th>
                                                            Status
                                                        </th>
                                                        <th>
                                                            View
                                                        </th>

                                                    </tr>
                                                </thead>
                                                <%
                                                    rs = (ResultSet) request.getAttribute("rsBillManager");
                                                    while (rs.next()) {
                                                %>
                                                <tbody>
                                                    <tr>
                                                        <td >
                                                            <%= rs.getString(1)%>
                                                        </td>
                                                        <td>
                                                            <%= rs.getString(4)%>
                                                        </td>
                                                        <td>
                                                            <%= rs.getString(2)%>
                                                        </td>
                                                        <td>
                                                            <%= rs.getDouble(7)%>
                                                        </td>
                                                        <td>
                                                            <%
                                                                String status = rs.getString(8);
                                                                if (status.equals("1")) {
                                                                    status = "Wait";
                                                                } else if (status.equals("2")) {
                                                                    status = "Shipping";
                                                                } else if (status.equals("3")) {
                                                                    status = "Stop";
                                                                } else if (status.equals("4")) {
                                                                    status = "Done";
                                                                } else if (status.equals("5")) {
                                                                    status = "Cancel";
                                                                }
                                                            %>
                                                            <%= status%>
                                                        </td>
                                                        <td>
                                                            <strong class="red">
                                                                <a href="Login?service=detailProduct&id=<%=rs.getString(1)%>" >
                                                                    Detail
                                                                </a>
                                                            </strong>
                                                        </td>

                                                    </tr>

                                                </tbody>
                                                <% }%>
                                            </table>
                                        </div>
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <%
                        if (check.equals("true")) {

                            String status = (String) request.getAttribute("status");
                            String HID = (String) request.getAttribute("hid");
                    %>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="checkout-page">
                                <ol class="checkout-steps">
                                    <li class="steps active">
                                        <a href="checkout.html" class="step-title">
                                            Detail for HID :   <%=HID%>
                                        </a>
                                        <div class="step-description">
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

                                                    </tr>
                                                </thead>
                                                <tbody>            
                                                    <%
                                                        ResultSet rs2 = (ResultSet) request.getAttribute("rsBill");
                                                        int x = 0;
                                                        while (rs2.next()) {
                                                            String name = rs2.getString("sname");
                                                            String id = rs2.getInt("sid") + "";
                                                            String quantity = rs2.getInt("quantity") + "";
                                                            String image = rs2.getString("picture");
                                                            Double total = rs2.getDouble(4);
                                                            Double price = rs2.getDouble(8);
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
                                                                    + "                              <strong class=\"pcode\">"
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
                                                                    + "                       <h5 name=\"quantity" + x + "\">"
                                                                    + quantity
                                                                    + "                      </h5>"
                                                                    + "                  </td>"
                                                                    + "                  <td>"
                                                                    + "                      <h5>"
                                                                    + "                          <strong class=\"red\">"
                                                                    + "                              $" + total
                                                                    + "                          </strong>"
                                                                    + "                      </h5>"
                                                                    + "                  </td>"
                                                                    + "              </tr>"
                                                            );
                                                            x++;

                                                        }

                                                    %>
                                                </tbody>
                                            </table>  
                                            <% if (status.equals("1")) {%>
                                            <form  action="Login" method="post" >
                                                <input type="hidden" name="service" value="huydon"/>
                                                <input type="hidden" name="id" value="<%=HID%>"/>
                                                <button type="submit" class="pull-left" >
                                                    Huy Don
                                                </button>
                                            </form>
                                            <%}   %>
                                        </div>

                                    </li>
                                </ol>
                            </div>

                        </div>

                    </div>
                    <%  }
                    %>                 

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