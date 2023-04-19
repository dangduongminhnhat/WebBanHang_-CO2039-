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
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./assets/css/reset.css" />
        <link rel="preconnect" href="https://cdnjs.cloudflare.com" />
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="57x57" href="./assets/favicon/apple-icon-57x57.png" />
        <link rel="apple-touch-icon" sizes="60x60" href="./assets/favicon/apple-icon-60x60.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="./assets/favicon/apple-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/favicon/apple-icon-76x76.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="./assets/favicon/apple-icon-114x114.png" />
        <link rel="apple-touch-icon" sizes="120x120" href="./assets/favicon/apple-icon-120x120.png" />
        <link rel="apple-touch-icon" sizes="144x144" href="./assets/favicon/apple-icon-144x144.png" />
        <link rel="apple-touch-icon" sizes="152x152" href="./assets/favicon/apple-icon-152x152.png" />
        <link rel="apple-touch-icon" sizes="180x180" href="./assets/favicon/apple-icon-180x180.png" />
        <link rel="icon" type="image/png" sizes="192x192" href="./assets/favicon/android-icon-192x192.png" />
        <link rel="icon" type="image/png" sizes="32x32" href="./assets/favicon/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="96x96" href="./assets/favicon/favicon-96x96.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="./assets/favicon/favicon-16x16.png" />
        <link rel="manifest" href="./assets/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="./assets/favicon/ms-icon-144x144.png" />
        <meta name="theme-color" content="#ffffff" />
        <!-- Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link rel="stylesheet" href="./assets/css/base.css" />
        <link rel="stylesheet" href="./assets/css/header.css" />
        <link rel="stylesheet" href="./assets/css/footer.css" />
        <link rel="stylesheet" href="./assets/css/style-adidas-all.css" />
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <script src="components/header.js" type="text/javascript" defer></script>
        <script src="components/footer.js" type="text/javascript" defer></script>
        <script src="components/adidas.js" type="text/javascript" defer></script>
        <script src="components/nike.js" type="text/javascript" defer></script>
        <script src="components/select-input.js" type="text/javascript" defer></script>

        <title>Adidas</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            ArrayList<ProductForSale> products = ManagerService.products;
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
			int size = 0;
        %>
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
                                        <img src="./assets/img/no_cart.jpg" alt="" class="header_cart-no-cart-img"/>
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
                                            <%size = user.getCartState().products.size();
                                            if(size > 4) size = 4;
                                            for(int i = 0; i < size; i++) {%>
                                            <li>
                                                <a href="#!" class="header_cart-anchor header_cart-item">
                                                    <div class="img-wrap">
                                                        <img src="<%=user.getCartState().products.get(i).getImage()%>" alt="<%=user.getCartState().products.get(i).getName()%>" class="header_cart-img"/>
                                                    </div>
                                                    <div class="header_cart-item-info">
                                                        <div class="header_cart-item-head">
                                                            <div class="header_cart-item-name">
                                                                <%=user.getCartState().products.get(i).getName()%>
                                                            </div>
                                                            <div class="header_cart-item-head">
                                                                <span class="header_cart-item-price"><%=formatter.format(Math.round(user.getCartState().products.get(i).getSaleoff() * user.getCartState().products.get(i).getUnitPrice()))%>đ</span>
                                                                <span class="header_cart-item-multiply">x</span>
                                                                <span class="header_cart-item-qnt"><%=user.getCartState().quantityEachProduct%></span>
                                                            </div>
                                                        </div>
                                                        <div class="header_cart-item-body">
                                                            <span class="header_cart-item-description">Size giày <%=user.getCartState().products.get(i).getSize()%></span>
                                                            <span class="header_cart-item-remove">Xóa</span>
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
        <div class="selection">
            <div class="sub_content">
                <div class="filter">
                    <!-- Tạo thanh tìm kiếm -->
                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Chọn Size Giày" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose39()">39</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose40()">40</div>
                            </li>
                            <li class="select-input_item" id="size-selct" value="39">
                                <div href="#!" class="select-input_link" onclick="chose41()">41</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose42()">42</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose43()">43</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose44()">44</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose45()">45</div>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Khoảng Giá" />
                        <ul class="select-input_list">
                            <li class="select-input_item" id="cost-selct" value="nor">
                                <div href="#!" class="select-input_link" onclick="choseLessThan3m()">Dưới 3 Triệu</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="chose3_5()">Từ 3 Đến 5 Triệu</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="choseGreaterThan5m()">Từ 5 Đến 10 Triệu</div>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Thương Hiệu" />
                        <ul class="select-input_list" id="sort-select" value="Adidas">
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="choseNike()">Nike</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="choseAdidas()">Adidas</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link">Biti's</div>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Phân Loại" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link">Giày Đi Với Crush</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link">Giày Thể Thao</div>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Sắp Xếp Theo" />
                        <ul class="select-input_list" id="sort-select" value="Nor">
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="choseDecOrder()">Giá Thấp Đến Cao</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="choseIncOrder()">Giá Cao Đến Thấp</div>
                            </li>
                            <li class="select-input_item">
                                <div href="#!" class="select-input_link" onclick="choseMostSaleOff()">Giảm Giá Nhiều Nhất</div>
                            </li>
                        </ul>
                    </div>
                    <div class="select-input select-input_last">
                        <form>
                            <input type="hidden" id="sort_select" value="nor"/>
                            <a id="filter" href="filter">
                                Tìm Kiếm Ngay
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="product">
            <div class="sub_content">
                <div class="new_product">
                    <div class="product_list">
                        <ul class="list">
                            <%for(int i = 0; i < products.size(); i++) {
                                String productJson = objectMapper.writeValueAsString(products.get(i));
                                if(products.get(i).getCategory().equals("Adidas")) {%>
                                <li class="list_item">
                                    <%if(products.get(i).getSaleoff() < 1.0) {%>
                                        <span class="status status_sale">-<%=Math.round((1-products.get(i).getSaleoff()) * 100)%>%</span>
                                    <%} else if(products.get(i).getNewOrHot() == true) {%>
                                        <span class="status">NEW</span>
                                    <%} else {%>
                                        <span class="status status status_hot">HOT</span>
                                    <%}%>
                                    <a href="product?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                        <img src="<%=products.get(i).getImage()%>" alt="<%=products.get(i).getName()%>" class="img"/>
                                        <div class="name"><%=products.get(i).getName()%></div>
                                    </a>
                                    <a class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </a>
                                    <%if(products.get(i).getSaleoff() < 1.0) {%>
                                        <span class="price"><%=formatter.format(Math.round(products.get(i).getSaleoff() * products.get(i).getUnitPrice()))%>đ</span>
                                        <span class="old_price"><%=formatter.format(products.get(i).getUnitPrice())%>đ</span>
                                    <%} else {%>
                                        <span class="price"><%=formatter.format(products.get(i).getUnitPrice())%>đ</span>
                                    <%}%>
                                </li>
                                <%}%>
                            <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <footer-component></footer-component>
    </body>
</html>
