

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
            String Select = "";
            String finalTotal = (String) request.getAttribute("finalTotal");
            String HID = (String) request.getAttribute("hid");
            String status = (String) request.getAttribute("status");
            String c1 = " ", c2 = " ", c3 = " ", c4 = " ", c5 = " ";
            if (status.equals("1")) {
                c1 = "selected";
            } else if (status.equals("2")) {
                c2 = "selected";
            } else if (status.equals("3")) {
                c3 = "selected";
            } else if (status.equals("4")) {
                c4 = "selected";
            } else if (status.equals("5")) {
                c5 = "selected";
            }
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
            <div class="clearfix">
            </div>
            <div class="container_fullwidth">
                <div class="container shopping-cart">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="title">
                                Detail for HID :   <%=HID%>
                            </h3>
                            <div class="clearfix">
                            </div>

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
                                        rs = (ResultSet) request.getAttribute("rsBill");
                                        int x = 0;

                                        while (rs.next()) {
                                            String name = rs.getString("sname");
                                            String id = rs.getInt("sid") + "";
                                            String quantity = rs.getInt("quantity") + "";
                                            String image = rs.getString("picture");
                                            Double total = rs.getDouble(4);
                                            Double price = rs.getDouble(8);
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

                            <div class="clearfix">
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-sm-6">
                                </div>
                                <div class="col-md-4 col-sm-6">
                                </div>
                                <div class="col-md-4 col-sm-6">
                                    <div class="shippingbox">

                                        <div class="grandtotal">
                                            <h5>
                                                Total
                                            </h5>
                                            <span>
                                                $<%=finalTotal%>
                                            </span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form method="get">
                        <input type="hidden"  name="service" value="updateStatus">
                         <input type="hidden"  name="statusOld" value="<%=status%>">
                        <div class="form-row">
                            <label class="lebel-abs">
                                Status 
                                <strong class="red">
                                    *
                                </strong>
                            </label>
                            <select name="status" style="height: 40px; width: 100%; margin-left: 0px; border-radius: 10px; border: 1px solid #cccccc; padding-left: 100px;  ">
                                <option value="1" <%=c1%>> Wait </option>
                                <option value="2" <%=c2%>> Shipping </option>
                                <option value="3" <%=c3%>> Stop </option>
                                <option value="4" <%=c4%>> Done </option>
                                <option value="5" <%=c5%>> Cancel </option>
                            </select>
                        </div>
                        <div class="form-row">
                            <input type="submit" value="Update" class="button">
                            <input type="hidden" name="hdid" value="<%=HID%>" class="button">
                        </div>
                    </form>
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
