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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer"        />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <script src="components/header.js" type="text/javascript" defer></script>
        <script src="components/footer.js" type="text/javascript" defer></script>
        <script src="components/adidas.js" type="text/javascript" defer></script>
        <script src="components/nike.js" type="text/javascript" defer></script>

        <title>Thợ Code Bán Giày</title>
    </head>
    <body>
        <%
            ArrayList<ProductForSale> newProducts = ManagerService.newProducts;  
            ArrayList<ProductForSale> hotProducts = ManagerService.hotProducts;  
            ArrayList<ProductForSale> saleOffProducts = ManagerService.saleOffProducts;  
            NumberFormat formatter = NumberFormat.getNumberInstance();
            User user = (User) request.getAttribute("user");
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
        %>
        <!-- <header class="header"> -->
        <div class="content_1">
            <div class="sub_content">
                <div class="navbar">
                    <!-- Logo -->
                    <a href="home?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="logo">
                        <img src="./assets/img/logo.png" alt="Thợ Code Bán Giày"/>
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
                                                <input type="submit" id="post" value = "Đăng xuất">
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
                                    <i class="header_cart-ico fa-solid fa-cart-plus"></i>
                                </a>
                                <%} else {%>
                                <a href="Cart?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="action-btn cart">
                                    <i class="header_cart-icon fa-solid fa-cart-plus"></i>
                                    <span class="header_cart-notice"><%=user.getCartState().totalQuantity%></span>
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
                                                        <a href="Cart?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                                            ...
                                                        </a>
                                                    </div>
                                                </div>
                                            <%}%>
                                        </ul>
                                        <div>
                                            Tổng cộng: <%=formatter.format(user.getCartState().totalCost)%>đ
                                        </div>
                                        <a href="Cart?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="header_cart-view-cart action-btn">Xem Giỏ Hàng</a>
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
                        <div class="desc_2">Cam kết sản phẩm 100% chính hãng</div>
                    </li>
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-solid fa-truck-moving"></i>
                        </div>
                        <div class="title">GIAO HÀNG HỎA TỐC</div>
                        <div class="desc_2">Vận chuyển hoả tốc trong 2h nội thành</div>
                    </li>
                    <li class="list_item">
                        <div class="desc_1">
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div class="title">HỖ TRỢ 24/24</div>
                        <a href="tel: +84782844906" class="desc_2">Gọi ngay</a>
                    </li>
                </ul>
            </div>
        </div>
        <!----------------------- New Products -------------------------->
        <div class="product">
            <div class="sub_content">
                <div class="new_product" id="new_product">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">SẢN PHẨM MỚI</a>
                        </h2>
                        <div class="more">
                            <a href="#!">
                                Xem thêm
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < newProducts.size(); i++) {
                                String productJson = objectMapper.writeValueAsString(newProducts.get(i));%>
                                <li class="list_item">
                                    <span class="status">NEW</span>
                                    <a href="product?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                        <img src="<%=newProducts.get(i).getImage()%>" alt="<%=newProducts.get(i).getName()%>" class="img"/>
                                        <div class="name"><%=newProducts.get(i).getName()%></div>
                                    </a>
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <span class="price"><%=formatter.format(newProducts.get(i).getUnitPrice())%>đ</span>
                                </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <div class="hot_product" id="hot_product">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">SẢN PHẨM HOT</a>
                        </h2>
                        <div class="more">
                            <a href="#!">
                                Xem thêm
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < hotProducts.size(); i++) {
                                String productJson = objectMapper.writeValueAsString(hotProducts.get(i));%>
                                <li class="list_item">
                                    <span class="status status status_hot">HOT</span>
                                    <a href="product?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                        <img src="<%=hotProducts.get(i).getImage()%>" alt="<%=hotProducts.get(i).getName()%>" class="img"/>
                                        <div class="name"><%=hotProducts.get(i).getName()%></div>
                                    </a>
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <span class="price"><%=formatter.format(hotProducts.get(i).getUnitPrice())%>đ</span>
                                </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <div class="hot_product">
                    <div class="title">
                        <h2 class="heading action-btn">
                            <a href="#!">SẢN PHẨM KHUYẾN MÃI</a>
                        </h2>
                        <div class="more">
                            <a href="#!">
                                Xem thêm
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < saleOffProducts.size(); i++) {
                                String productJson = objectMapper.writeValueAsString(saleOffProducts.get(i));%>
                                <li class="list_item">
                                    <span class="status status_sale">-<%=Math.round((1-saleOffProducts.get(i).getSaleoff()) * 100)%>%</span>
                                    <a href="product?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                        <img src="<%=saleOffProducts.get(i).getImage()%>" alt="<%=saleOffProducts.get(i).getName()%>" class="img"/>
                                        <div class="name"><%=saleOffProducts.get(i).getName()%></div>
                                    </a>
                                    <a class="star" href="product?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <span class="price"><%=formatter.format(Math.round(saleOffProducts.get(i).getSaleoff() * saleOffProducts.get(i).getUnitPrice()))%>đ</span>
                                    <span class="old_price"><%=formatter.format(saleOffProducts.get(i).getUnitPrice())%>đ</span>
                                </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <footer-component></footer-component>
    </body>
</html>
