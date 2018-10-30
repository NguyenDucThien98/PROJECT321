<%-- 
    Document   : ProductAll
    Created on : Oct 9, 2018, 3:13:59 PM
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
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body>
        <%
            String username = (String) request.getAttribute("LoginAdmin");
            ResultSet rs;
            String Select = (String) request.getAttribute("Select");
            String mess = (String) request.getAttribute("mess");
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
                                        <%     if (Select.equals("customerManager")) {    %>
                                        <li class="active dropdown">
                                            <%  } else { %> 
                                        <li>
                                            <%}%>
                                            <a href="Admin?service=customerManager" >
                                                Customer Manager
                                            </a>
                                        </li>


                                        <%     if (Select.equals("productManager")) {    %>
                                        <li class="active dropdown">
                                            <%  } else { %> 
                                        <li>
                                            <%}%>
                                            <a  href="Admin?service=productManager">
                                                Product Manager
                                            </a>
                                        </li>


                                        <%     if (Select.equals("billManager")) {    %>
                                        <li class="active dropdown">
                                            <%  } else { %> 
                                        <li>
                                            <%}%>
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
        </div>
        <div class="clearfix">
        </div>

        <h3><%=mess%></h3>
        <%
            if (Select.equals("customerManager")) {
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="checkout-page">
                    <ol class="checkout-steps">
                        <li class="steps active">
                            <a href="#" class="step-title">
                                Customer Manager
                            </a>
                            <div class="step-description">
                                <table class="shop-table2">
                                    <thead>
                                        <tr>
                                            <th>
                                                CID
                                            </th>
                                            <th>
                                                CName
                                            </th>
                                            <th>
                                                Address
                                            </th>
                                            <th>
                                                Phone
                                            </th>
                                            <th>
                                                UserName
                                            </th>
                                            <th>
                                                Password
                                            </th>
                                            <th>
                                                Status
                                            </th>
                                            <th>
                                                Delete
                                            </th>
                                        </tr>
                                    </thead>
                                    <%
                                        rs = (ResultSet) request.getAttribute("rsCustomerManager");
                                        while (rs.next()) {
                                    %>
                                    <tbody>
                                        <tr>
                                            <td >
                                                <%= rs.getString(1)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(2)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(3)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(4)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(5)%>
                                            </td>
                                            <td>
                                                <%=rs.getString(6)%>
                                            </td>
                                            <td>
                                                <strong class="red">
                                                    <%
                                                        out.println((rs.getInt(7) == 1 ? "<a href=\"Admin?service=StatusCustomer&username=" + rs.getString(5) + "&status=" + rs.getInt(7) + "\" onclick=\"return confirm('Are you sure?')\">Active</a>"
                                                                : "<a href=\"Admin?service=StatusCustomer&username=" + rs.getString(5) + "&status=" + rs.getInt(7) + "\" onclick=\"return confirm('Are you sure?')\">DeActive</a>"));
                                                    %>
                                                </strong>
                                            </td>
                                            <td>
                                                <a href="Admin?service=preDeleteCustomer&id=<%=rs.getInt(1)%>" onclick="return confirm('Are you sure?')">
                                                    <img src="images/remove.png" alt="">
                                                </a>
                                            </td>
                                        </tr>

                                    </tbody>
                                    <% } %>
                                </table>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
        <%  } else if (Select.equals("productManager")) {
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="checkout-page">
                    <ol class="checkout-steps">
                        <li class="steps active">
                            <a href="#" class="step-title">
                                Product Manager
                            </a>
                            <div class="step-description">
                                <table class=" shopp ">
                                    <thead>
                                        <tr>
                                            <th>
                                                SID
                                            </th>
                                            <th>
                                                SName
                                            </th>
                                            <th>
                                                Quantity
                                            </th>
                                            <th>
                                                Price
                                            </th>
                                            <th>
                                                Picture
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                            <th>
                                                HID
                                            </th>
                                            <th>
                                                Status
                                            </th>
                                            <th>
                                                UpDate
                                            </th>
                                            <th>
                                                Delete
                                            </th>
                                        </tr>
                                    </thead>
                                    <%
                                        rs = (ResultSet) request.getAttribute("rsProductManager");
                                        while (rs.next()) {
                                    %>
                                    <tbody>
                                        <tr>
                                            <td >
                                                <%= rs.getString(1)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(2)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(3)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(4)%>
                                            </td>
                                            <td>
                                                <%= rs.getString(5)%>
                                            </td>
                                            <td>
                                                <%=rs.getString(6)%>
                                            </td>
                                            <td>
                                                <%=rs.getString(10)%>
                                            </td>
                                            <td>
                                                <strong class="red">
                                                    <%
                                                        out.println((rs.getInt(7) == 1 ? "<a href=\"Admin?service=StatusProduct&id=" + rs.getString(1) + "&status=" + rs.getInt(7) + "\" onclick=\"return confirm('Are you sure?')\">Active</a>"
                                                                : "<a href=\"Admin?service=StatusProduct&id=" + rs.getString(1) + "&status=" + rs.getInt(7) + "\" onclick=\"return confirm('Are you sure?')\">DeActive</a>"));
                                                    %>
                                                </strong>
                                            </td>
                                            <td>
                                                <strong class="red">
                                                    <a href="Admin?service=updateProductForm&id=<%=rs.getString(1)%>">
                                                        Update
                                                    </a>
                                                </strong>
                                            </td>
                                            <td>
                                                <a href="Admin?service=preDeleteProduct&id=<%=rs.getString(1)%>" onclick="return confirm('Are you sure?')">
                                                    <img src="images/remove.png" alt="">
                                                </a>
                                            </td>
                                        </tr>

                                    </tbody>
                                    <% } %>
                                </table>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
        <div class="row">
            <div class="col-md-11">
            </div>

            <div class="col-lg-1">
                <a href="Admin?service=displayInsertForm">
                    <button>
                        Insert Product
                    </button>
                </a>
            </div>

        </div>
        <br>
        <%  } else if (Select.equals("billManager")) {
        %>
        <div class="row">
            <div class="col-md-12">
                <div class="checkout-page">
                    <ol class="checkout-steps">
                        <li class="steps active">
                            <a href="#" class="step-title">
                                Bill Manager
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
                                                    <a href="Admin?service=detailProduct&id=<%=rs.getString(1)%>&total=<%=rs.getDouble(7)%>" >
                                                        Detail
                                                    </a>
                                                </strong>
                                            </td>

                                        </tr>

                                    </tbody>
                                    <% } %>
                                </table>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </div>

        <%}%>


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