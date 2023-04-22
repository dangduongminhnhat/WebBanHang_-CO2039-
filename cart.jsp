<%@ page language="java"
import="java.net.*"
import="java.lang.*"
import="java.util.*"
import="java.text.*"
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/cart.css" />

        <script src="components/header.js" type="text/javascript" defer></script>
        <script src="components/footer.js" type="text/javascript" defer></script>

        <title>Giỏ hàng</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            NumberFormat formatter = NumberFormat.getNumberInstance();
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
                            <a href="#!"><i>THƯƠNG HIỆU</i></a>
                            <ul class="sub-list">
                                <li>
                                    <a href="adidas?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">Adidas</a>
                                </li>
                                <li>
                                    <a href="#!">Nike</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#!"><i>PHÂN LOẠI</i></a>
                            <ul class="sub-list">
                                <li>
                                    <a href="#!">Giày đi với crush</a>
                                </li>
                                <li>
                                    <a href="#!">Giày đi chơi</a>
                                </li>        
                            </ul>
                        </li>
                        <li>
                            <a href="#sa"><i>KHUYẾN MÃI</i></a>
                        </li>
                        <li>
                            <a href="#new_product"><i>SẢN PHẨM MỚI</i></a>
                        </li>
                        <li>
                            <a href="#!"><i>HỖ TRỢ</i></a>
                        </li>
                    </ul>
                    <!-- Searchbar -->
                    <div class="header_search">
                        <input type="text" class="header_search-input" placeholder="Tìm kiếm sản phẩm"/>
                        <button class="header_search-btn">
                            <i class="header_search-btn-icon fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                    <!-- Action -->
                    <%if(user == null) {%>
                        <a href="login.jsp" class="action-btn">
                            <i class="fa-regular fa-user"></i>
                        </a>
                    <%} else {%>
                        <div class="navbar">
                            <ul class="list">
                                <li>
                                    <a href="#!"><i class="fa-regular fa-user"></i></a>
                                    <ul class="sub-list">
                                        <a>
                                            <form method="post" action="Logout">
                                                <input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                                <input type="submit" value = "Đăng xuất">
                                            </form>
                                        </a>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    <%}%>
                    <div class="action">
                        <div class="header_cart">
                            <div class="header_cart-wrap">
                                <%if(user == null) {%>
                                <a href="login.jsp?cart=true" class="action-btn cart">
                                    <i class="header_cart-icon fa-solid fa-cart-plus"></i>
                                </a>
                                <%} else {%>
                                <a href="Cart?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="action-btn cart">
                                    <i class="header_cart-icon fa-solid fa-cart-plus"></i>
                                    <span class="header_cart-notice"><%=user.getCartState().totalQuantity%></span><br>
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
                                        <h4 class="header_cart-heading">Sản Phẩm Đã Thêm: <%=user.getCartState().products.size()%></h4>
                                        <ul class="header_cart-list-item">
                                            <!-- Cart item -->
                                            <%int size = user.getCartState().products.size();
                                            if(size > 4) size = 4;
                                            for(int i = 0; i < size; i++) {
                                                String productJson = objectMapper.writeValueAsString(user.getCartState().products.get(i));%>
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
                                                                <span class="header_cart-item-price"><%=formatter.format(Math.round(user.getCartState().products.get(i).getSaleoff() * user.getCartState().products.get(i).getUnitPrice()))%>đ</span>
                                                                <span class="header_cart-item-multiply">x</span>
                                                                <span class="header_cart-item-qnt"><%=user.getCartState().quantityEachProduct.get(i)%></span>
                                                            </div>
                                                        </div>
                                                        <div class="header_cart-item-body">
                                                            <span class="header_cart-item-description">Size giày <%=user.getCartState().products.get(i).getSize()%></span>
                                                            <span class="header_cart-item-remove">Xóa</span>
                                                            <!-- <span class="header_cart-item-remove"><a href="u-t-c?clear=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">Xóa</a></span> -->
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <%} if(user.getCartState().products.size() > 4) {%>
                                                <div class="title">
                                                    <div class="more">
                                                        <a href="#cart">
                                                            ...
                                                        </a>
                                                    </div>
                                                </div>
                                            <%}%>
                                        </ul>
                                        <div>
                                            Tổng cộng: <%=formatter.format(user.getCartState().totalCost)%>đ
                                        </div>
                                        <!-- <a href="pmt?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="header_cart-view-cart action-btn">Thanh toán</a> -->
                                    </div>
                                    <%}%>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!----------------------- Cart -------------------------->
        <div class="title" style="margin: 0 auto; width: 25%;">
            <h2 class="heading action-btn">
                ${message}
            </h2>
        </div>
        <%if(cart.totalQuantity == 0) {%>
        <div class="cart-detail">
            <!-- Không có sản phẩm -->
            <div class="no-cart">
                <img class="img-no-cart" src="./assets/img/no_cart.jpg" alt="" />
                <span class="desc-no-cart">Không có sản phẩm nào trong giỏ hàng</span>
                <div class="frame_buy">
                    <a class="action-btn action-btn-custom" href="home?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">Trang Chủ</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="cart-detail have-cart">
            <!-- Có sản phẩm -->
            <div class="cart-detail_content">
                <div class="title">Giỏ Hàng</div>
                <ul class="list_item">
                    <%for(int i = 0; i < cart.products.size(); i++) {
                        String productJson = objectMapper.writeValueAsString(cart.products.get(i));%>
                    <script>
                        function increaseValue<%=Integer.toString(i)%>() {
                            var value = parseInt(document.getElementById('number<%=Integer.toString(i)%>').value, 10);
                            value = isNaN(value) ? 1 : value;
                            value++;
                            document.getElementById('number<%=Integer.toString(i)%>').value = value;
                            document.getElementById('outputQuantity<%=Integer.toString(i)%>').textContent = value;
                            updateLink<%=Integer.toString(i)%>();
                        }
                        function decreaseValue<%=Integer.toString(i)%>() {
                            var value = parseInt(document.getElementById('number<%=Integer.toString(i)%>').value, 10);
                            value = isNaN(value) ? 1 : value;
                            value < 2 ? value = 2 : '';
                            value--;
                            document.getElementById('number<%=Integer.toString(i)%>').value = value;
                            document.getElementById('outputQuantity<%=Integer.toString(i)%>').textContent = value;
                            updateLink<%=Integer.toString(i)%>();
                        }
                        function updateLink<%=Integer.toString(i)%>() {
                            var link = document.getElementById('upd-ct<%=Integer.toString(i)%>');
                            var quantity = document.getElementById('number<%=Integer.toString(i)%>').value;
                            var size = document.getElementById('size<%=Integer.toString(i)%>').value;
                            link.href = 'upd-ct?cart=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&quantity=' + quantity + "&size=" + size;
                        }
                    </script>
                    <li class="item">
                        <div class="frame_img">
                            <a href="#!">
                                <img class="img_item" src="<%=cart.products.get(i).getImage()%>" alt="<%=cart.products.get(i).getName()%>"/>
                            </a>
                        </div>
                        <div class="content_item">
                            <div class="name"><a href="#!"><%=cart.products.get(i).getName()%></a></div>
                            <div class="size_item">
                                <span class="size_item_content">Size Giày: <%=cart.products.get(i).getSize()%></span>
                            </div>
                            <div class="count_multi">
                                <div class="frame_count">
                                    <button class="count-btn" id="decrease<%=Integer.toString(i)%>" onclick="decreaseValue<%=Integer.toString(i)%>()">
                                        <i class="fa-solid fa-minus"></i>
                                    </button>
                                    <span class="count_content" id="outputQuantity<%=Integer.toString(i)%>"><%=Integer.toString(cart.quantityEachProduct.get(i))%></span>
                                    <input type="hidden" id="number<%=Integer.toString(i)%>" name = "quantity" value="<%=Integer.toString(cart.quantityEachProduct.get(i))%>"/>
                                    <input type="hidden" id="size<%=Integer.toString(i)%>" name = "size" value="<%=Integer.toString(cart.products.get(i).getSize())%>"/>
                                    <button class="count-btn" id="increase<%=Integer.toString(i)%>" onclick="increaseValue<%=Integer.toString(i)%>()">
                                        <i class="fa-solid fa-plus"></i>
                                    </button>
                                    <button class="count-btn">
                                        <a id="upd-ct<%=Integer.toString(i)%>" href="upd-ct?cart=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&quantity=<%=cart.quantityEachProduct.get(i)%>&size=<%=cart.products.get(i).getSize()%>" >
                                            <span>Áp dụng</span>
                                        </a>
                                    </button>
                                </div>
                                <span class="multi"><i class="fa-solid fa-xmark"></i></span>
                                <span class="unit_price"><%=formatter.format(Math.round(cart.products.get(i).getSaleoff() * cart.products.get(i).getUnitPrice()))%>đ</span>
                            </div>
                            <div class="frame_price">
                                <span class="desc_price">Thành tiền:</span>
                                <span class="total_price-item"><%=formatter.format(Math.round(cart.products.get(i).getSaleoff() * cart.products.get(i).getUnitPrice() * cart.quantityEachProduct.get(i)))%>đ</span>
                            </div>
                        </div>
                        <div class="remove-btn">
                            <a href="upd-ct?cart=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&quantity=0&size=39"><i class="fa-solid fa-circle-xmark"></i></a>
                        </div>
                    </li>
                    <%}%>
                    </ul>
                    <div class="summary">
                        <div class="unit_price"><%=formatter.format(Math.round(cart.totalCost))%>đ</div>
                        <div class="desc_price" style="color: #000">Tổng tiền:</div>
                    </div>
                    <div class="frame_buy">
                        <a class="action-btn action-btn-custom" href="pmt?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">Mua Hàng</a>
                    </div>
                </div>
            </div>
        <%}%>
        <footer-component></footer-component>
    </body>
</html>
