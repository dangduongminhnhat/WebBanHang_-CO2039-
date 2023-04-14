<%@ page language="java"
import="java.net.*"
import="java.lang.*"
import="java.util.*"
import="com.example.model.user.*"
import="com.example.model.user.User.BankAccount"
import="com.example.model.manager.*"
import="com.example.model.*"
import="com.fasterxml.jackson.databind.*"
import="com.fasterxml.jackson.annotation.*"
import="com.fasterxml.jackson.core.*"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
<!-- <!DOCTYPE html> -->
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./assets/css/reset.css" />
        <link rel="preconnect" href="https://cdnjs.cloudflare.com" />
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="./assets/favicon/apple-icon-57x57.png"/>
        <link rel="apple-touch-icon" sizes="60x60" href="./assets/favicon/apple-icon-60x60.png"/>
        <link rel="apple-touch-icon" sizes="72x72" href="./assets/favicon/apple-icon-72x72.png"/>
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/favicon/apple-icon-76x76.png"/>
        <link rel="apple-touch-icon" sizes="114x114" href="./assets/favicon/apple-icon-114x114.png"/>
        <link rel="apple-touch-icon" sizes="120x120" href="./assets/favicon/apple-icon-120x120.png"/>
        <link rel="apple-touch-icon" sizes="144x144" href="./assets/favicon/apple-icon-144x144.png"/>
        <link rel="apple-touch-icon" sizes="152x152" href="./assets/favicon/apple-icon-152x152.png"/>
        <link rel="apple-touch-icon" sizes="180x180" href="./assets/favicon/apple-icon-180x180.png"/>
        <link rel="icon" type="image/png" sizes="192x192" href="./assets/favicon/android-icon-192x192.png"/>
        <link rel="icon" type="image/png" sizes="32x32" href="./assets/favicon/favicon-32x32.png"/>
        <link rel="icon" type="image/png" sizes="96x96" href="./assets/favicon/favicon-96x96.png"/>
        <link rel="icon" type="image/png" sizes="16x16" href="./assets/favicon/favicon-16x16.png"/>
        <link rel="manifest" href="./assets/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="./assets/favicon/ms-icon-144x144.png"/>
        <meta name="theme-color" content="#ffffff" />
        <!-- Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        />
        <link rel="stylesheet" href="./assets/css/style.css" />

        <title>Thợ Code Bán Giày</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
            User.CartState cart = user.getCartState();
        %>
        <!-- <header class="header"> -->
        <div class="content_1">
            <div class="sub_content">
                <div class="navbar">
                    <!-- Logo -->
                    <a href="home?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="logo">
                        <img
                            src="./assets/img/logo.png"
                            alt="Thợ Code Bán Giày"
                        />
                        <!-- <div class="brand">Thợ Code Bán Giày</div> -->
                    </a>
                    <!-- Navigation -->
                    <ul class="list">
                        <li>
                            <a href="#sa"><i>THEO DÕI ĐƠN HÀNG</i></a>
                        </li>
                        <li>
                            <a href="#sa"><i>ĐỊA ĐIỂM GIAO HÀNG</i></a>
                        </li>
                        <li>
                            <a href="home?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>"><i>TRANG CHỦ</i></a>
                        </li>
                        <%if(cart.totalQuantity > 0) {%>
                        <li>
                            <a href="pmt?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                <i>THANH TOÁN</i>
                            </a>
                        </li>
                        <%}
                        if(user != null) {%>
                        <li>
                            <a href="####"><i>${user.getFullName().toUpperCase()}</i></a>
                            <ul class="sub-list">
                                <a>
                                    <form method="post" action="index.jsp">
                                        <input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                        <%user.logout();%>
                                        <input type="submit" value = "Đăng xuất">
                                    </form>
                                </a>
                                <a>
                                    <form method="post" action="account">
                                        <input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                        <input type="submit" value = "Tài khoản">
                                    </form>
                                </a>
                            </ul>
                        </li>
                        <%}%>
                    </ul>
                    <!-- Action -->
                    <div class="action">
                        <ul class="list">
                            <li>
                                <a href="account" class="action-btn">
                                    <%if(user != null) {%>
                                    <i class="fa-regular fa-user"></i><br>
                                    $<%=user.getBankAcc().getBalance()%>
                                    <%} else {%>
                                    <i class="fa-regular fa-user"></i>
                                    <%}%>
                                </a>
                            </li>
                        </ul>
                        <div class="header_cart">
                            <div class="header_cart-wrap">
                                <%if(user == null) {%>
                                <a href="login.jsp?cart=true" class="action-btn cart">
                                    <i class="header_cart-ico fa-solid fa-cart-plus"></i>
                                </a>
                                <%} else {%>
                                <a href="Cart?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="action-btn cart">
                                    <i class="header_cart-icon fa-solid fa-cart-plus"></i>
                                    <span class="header_cart-notice"><%=user.getCartState().totalQuantity%></span>
                                    <%=user.getCartState().totalCost%>
                                </a>
                                    <%
                                    if(user.getCartState().totalQuantity == 0) {%>
                                    <!-- No cart: header_cart-list--no-cart -->
                                    <div class="header_cart-list header_cart-list--no-cart">
                                        <img
                                            src="./assets/img/no_cart.jpg"
                                            alt=""
                                            class="header_cart-no-cart-img"
                                        />
                                        <div class="header_cart-list-no-cart-msg">
                                            Chưa Có Sản Phẩm
                                        </div>
                                    </div>
                                    <%} else {%> 
                                    <div class="header_cart-list">
                                        <!-- Cart Cart Cart -->
                                        <h4 class="header_cart-heading">Sản Phẩm Đã Thêm</h4>
                                        <ul class="header_cart-list-item">
                                            <!-- Cart item -->
                                            <%for(int i = 0; i < user.getCartState().products.size(); i++) {
                                                String productJson = objectMapper.writeValueAsString(user.getCartState().products.get(i));
                                            %>
                                            <li>
                                                <a href="#!" class="header_cart-anchor header_cart-item">
                                                    <div class="img-wrap">
                                                        <img
                                                            src="<%=user.getCartState().products.get(i).getImage()%>"
                                                            alt="<%=user.getCartState().products.get(i).getName()%>"
                                                            class="header_cart-img"
                                                        />
                                                    </div>
                                                    <div class="header_cart-item-info">
                                                        <div class="header_cart-item-head">
                                                            <div class="header_cart-item-name">
                                                                <%=user.getCartState().products.get(i).getName()%>
                                                            </div>
                                                            <div class="header_cart-item-head">
                                                                <span class="header_cart-item-price"><%=Math.round(user.getCartState().products.get(i).getSaleoff() * user.getCartState().products.get(i).getUnitPrice())%>đ</span>
                                                                <span class="header_cart-item-multiply">x</span>
                                                                <span class="header_cart-item-qnt"><%=user.getCartState().quantityEachProduct.get(i)%></span>
                                                            </div>
                                                        </div>
                                                        <div class="header_cart-item-body">
                                                            <span class="header_cart-item-description">Size giày NULL</span>
                                                            <span class="header_cart-item-remove">Xóa</span>
                                                            <!-- <span class="header_cart-item-remove"><a href="u-t-c?clear=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">Xóa</a></span> -->
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <%}%>
                                        </ul>
                                        <!-- <a href="#!" class="header_cart-view-cart action-btn">Xem Giỏ Hàng</a> -->
                                    </div>
                                    <%}%>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content_2">
            <div class="slider">
                <div class="slides">
                    <!-- Tao cac nut bam -->
                    <input type="radio" name="radio-btn" id="radio1" />
                    <input type="radio" name="radio-btn" id="radio2" />
                    <input type="radio" name="radio-btn" id="radio3" />
                    <input type="radio" name="radio-btn" id="radio4" />
                    <!-- Tai len cac anh -->
                    <div class="slide first">
                        <img src="./assets/img/background_1.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="./assets/img/background_2.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="./assets/img/background_3.jpg" alt="" />
                    </div>
                    <div class="slide">
                        <img src="./assets/img/background_4.jpg" alt="" />
                    </div>
                    <!-- Tu dong chuyen slide -->
                    <div class="navigation_auto">
                        <div class="auto_btn1"></div>
                        <div class="auto_btn2"></div>
                        <div class="auto_btn3"></div>
                        <div class="auto_btn4"></div>
                    </div>
                    <!-- Thu cong -->
                    <div class="navigation_manual">
                        <label for="radio1" class="manual_btn"></label>
                        <label for="radio2" class="manual_btn"></label>
                        <label for="radio3" class="manual_btn"></label>
                        <label for="radio4" class="manual_btn"></label>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var counter = 1;
            setInterval(function () {
                document.getElementById("radio" + counter).checked = true;
                counter++;
                if (counter > 4) {
                    counter = 1;
                }
            }, 5000);
        </script>
        <!-- </header> -->
        <div class="service">
            <div class="sub_content">
                <ul class="list">
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-regular fa-handshake"></i>
                        </div>
                        <div class="title">UY TÍN HÀNG ĐẦU</div>
                        <div class="desc_2">
                            Cam kết sản phầm 100% chính hãng
                        </div>
                    </li>
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-solid fa-truck-moving"></i>
                        </div>
                        <div class="title">GIAO HÀNG HỎA TỐC</div>
                        <div class="desc_2">
                            Vận chuyển hoả tốc trong 2h nội thành
                        </div>
                    </li>
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div class="title">HỖ TRỢ 24/24</div>
                        <a href="tel: +84399231049" class="desc_2">Gọi ngay</a>
                    </li>
                </ul>
            </div>
        </div>
        <!----------------------- Cart -------------------------->
        <div class="title" style="margin: 0 auto; width: 25%;">
            <h2 class="heading action-btn">
                ${message}
            </h2>
        </div>
        <%if(cart.totalQuantity > 0) {%>
        <div class="product" style="margin: 0 auto; width: 10%;">
            <div class="title">
                <h2 class="heading action-btn">
                    <a href="upd-ct?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">
                        XÓA GIỎ HÀNG
                    </a>
                </h2>
            </div>
        </div>
        <%}%>
        <div class="product">
            <div class="sub_content">
                <div class="cart">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">GIỎ HÀNG</a>
                        </h2>
                        <div class="more">
                            <a href="#!">
                                Xem thêm
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <%for(int i = 0, j = 0; j < cart.products.size() / 5 + 1; j += 1) {%>
                <div class="product_list">
                    <ul class="list">
                        <%for( ; i < cart.products.size() && i < (j + 1) * 5; i++) {
                            String productJson = objectMapper.writeValueAsString(cart.products.get(i));
                            String number = "number";%>
                        <script>
                            function increaseValue<%=Integer.toString(i)%>() {
                            var value = parseInt(document.getElementById('<%=number.concat(Integer.toString(i))%>').value, 10);
                            value = isNaN(value) ? 0 : value;
                            value++;
                            document.getElementById('<%=number.concat(Integer.toString(i))%>').value = value;
                            }
                            function decreaseValue<%=Integer.toString(i)%>() {
                            var value = parseInt(document.getElementById('<%=number.concat(Integer.toString(i))%>').value, 10);
                            value = isNaN(value) ? 0 : value;
                            value < 1 ? value = 1 : '';
                            value--;
                            document.getElementById('<%=number.concat(Integer.toString(i))%>').value = value;
                            }
                        </script>
                        <style>
                            #cart-form {
                                width: 0px;
                                margin: 0 auto;
                                text-align: center;
                                padding-top: 5x;
                            }
                            .value-button {
                                text-align: center;
                                border: none;
                                border-top: 1px solid #ddd;
                                border-bottom: 1px solid #ddd;
                                margin: 0px;
                                width: 20px;
                                height: 15px;
                                padding: 0px;
                            }
                            .submit-button {
                                text-align: center;
                                border: none;
                                border-top: 1px solid #ddd;
                                border-bottom: 1px solid #ddd;
                                padding: 0px;
                                margin: 0px;
                                width: 50px;
                                height: 20px;
                            }
                            .value-button:hover {
                                cursor: pointer;
                            }
                            form #decrease<%=Integer.toString(i)%> {
                                margin-right: -4px;
                                border-radius: 8px 0 0 8px;
                            }
                            form #increase<%=Integer.toString(i)%> {
                                margin-left: -4px;
                                border-radius: 0 8px 8px 0;
                            }
                            form #input-wrap {
                                margin: 0px;
                                padding: 0px;
                            }
                            input#<%=number.concat(Integer.toString(i))%> {
                                text-align: center;
                                border: none;
                                border-top: 1px solid #ddd;
                                border-bottom: 1px solid #ddd;
                                margin: 0px;
                                width: 20px;
                                height: 20px;
                            }
                            input[type=number]::-webkit-inner-spin-button,
                            input[type=number]::-webkit-outer-spin-button {
                                -webkit-appearance: none;
                                margin: 0;
                            }
                        </style>
                        <li class="list_item">
                            <span class="status">NULL</span>
                            <a href="#!">
                                <img
                                src="<%=cart.products.get(i).getImage()%>"
                                alt="<%=cart.products.get(i).getName()%>"
                                class="img"
                                />
                                <div class="name"><%=cart.products.get(i).getName()%></div>
                                <form id="cart-form" method="post" action="upd-ct">
                                    <div class="value-button" id="decrease=Integer.toString(i)" onclick="decreaseValue<%=Integer.toString(i)%>()" value="Decrease Value">-</div>
                                    <input type="number" id="<%=number.concat(Integer.toString(i))%>" name = "quantity" value="<%=Integer.toString(cart.quantityEachProduct.get(i))%>" />
                                    <div class="value-button" id="increase=Integer.toString(i)" onclick="increaseValue<%=Integer.toString(i)%>()" value="Increase Value">+</div>
                                    <input type="hidden" name = "cart" value = "true">
                                    <input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                    <input type="hidden" name = "productJson" value = "<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                    <input type="submit" class="submit-button" value = "Áp dụng">
                                </form>
                            </a>
                            <span class="price"><%=Math.round(cart.products.get(i).getSaleoff() * cart.products.get(i).getUnitPrice())%></span>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </div>
        <%}%>
        <footer class="footer">
            <div class="sub_content">
                <div class="left">
                    <ul class="list">
                        <li class="list_item">
                            <a href="#!">THÔNG TIN VỀ CÔNG TY</a>
                        </li>
                        <li class="list_item"><a href="#!">Giới thiệu</a></li>
                        <li class="list_item">
                            <a href="#!">Cơ hội nghề nghiệp</a>
                        </li>
                        <li class="list_item"><a href="#!">Tin tức</a></li>
                    </ul>
                    <ul class="list">
                        <li class="list_item">
                            <a href="#!">HỖ TRỢ KHÁCH HÀNG</a>
                        </li>
                        <li class="list_item">
                            <a href="#!">Chăm sóc khách hàng</a>
                        </li>
                        <li class="list_item"><a href="#!">Thanh toán</a></li>
                        <li class="list_item">
                            <a href="#!">Hướng dẫn mua hàng</a>
                        </li>
                    </ul>
                    <ul class="list">
                        <li class="list_item"><a href="#!">CHÍNH SÁCH</a></li>
                        <li class="list_item">
                            <a href="#!">Chế độ bảo hành</a>
                        </li>
                        <li class="list_item">
                            <a href="#!">Chính sách đổi hàng</a>
                        </li>
                        <li class="list_item">
                            <a href="#!">Bảo mật thông tin</a>
                        </li>
                        <li class="list_item">
                            <a href="#!">Chính sách giao nhận</a>
                        </li>
                    </ul>
                </div>
                <div class="right">
                    <ul class="list">
                        <li class="list_item">
                            <a href="https://twitter.com/elonmusk"
                                ><i class="fa-brands fa-twitter"></i
                            ></a>
                        </li>
                        <li class="list_item">
                            <a href="https://www.facebook.com/mp151103"
                                ><i class="fa-brands fa-facebook"></i
                            ></a>
                        </li>
                        <li class="list_item">
                            <a href="https://www.youtube.com/channel/UCRl9Zt_6Bzx-LrMRYFyYcVw"
                                ><i class="fa-brands fa-youtube"></i
                            ></a>
                        </li>
                        <li class="list_item">
                            <a href="https://www.instagram.com/dgtpg.21/"
                                ><i class="fa-brands fa-square-instagram"></i
                            ></a>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>
    </body>
</html>
