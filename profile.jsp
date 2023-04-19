<%@ page language="java"
import="java.net.*"
import="java.lang.*"
import="java.util.*"
import="java.text.*"
import="java.time.*"
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
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
            User.BuyingHistory buyingHistory = user.getbuyingHistory();
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
						<%if(user != null) {%>
                        <li>
                            <a href="home?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>"><i>TRANG CHỦ</i></a>
                        </li>
						<li>
							<a href="#!"><i>THEO DÕI ĐƠN HÀNG</i></a>    
							<ul class="sub-list">
								<li>
									<a href="#!">CHỜ THANH TOÁN</a>
								</li>
								<li>
									<a href="#!">ĐANG VẬN CHUYỂN</a>
								</li>
								<li>
									<a href="history?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">HOÀN THÀNH</a>
								</li>
								<li>
									<a href="#!">ĐÃ HỦY</a>
								</li>
								<li>
									<a href="#!">TRẢ VỀ/HOÀN TIỀN</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="####"><i>${user.getFullName().toUpperCase()}</i></a>
							<ul class="sub-list">
								<a>
									<form method="post" action="Logout">
										<input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
										<input type="submit" value = "Đăng xuất">
									</form>
									<form method="post" action="profile">
										<input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
										<input type="submit" value = "Hồ sơ">
									</form>
									<form method="post" action="history">
										<input type="hidden" name = "userJson" value = "<%=URLEncoder.encode(userJson, "UTF-8")%>">
										<input type="submit" value = "Lịch sử">
									</form>
								</a>
							</ul>
						</li>
						<%} else {%>
                        <li>
                            <a href="home?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>"><i>TRANG CHỦ</i></a>
                        </li>
						<%}%>
                        <li>
                            <a href="#!"><i>HỖ TRỢ</i></a>
                        </li>
                    </ul>
                    <!-- Action -->
                    <div class="action">
                        <ul class="list">
                            <li>
                                <a href="profile?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>" class="action-btn">
                                    <%if(user != null) {%>
                                    <i class="fa-regular fa-user"></i><br>
                                    <%=formatter.format(user.getBankAcc().getBalance())%>đ
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
                                                                <span class="header_cart-item-qnt"><%=user.getCartState().quantityEachProduct%></span>
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
                        <div class="desc_2">
                            Cam kết sản phẩm 100% chính hãng
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
        <!----------------------- Product Details -------------------------->
		<style>
			.product1 {
				margin-top: 75px;
			}
			.product1 .title {
				display: flex;
				justify-content: space-between;
				align-items: center;
			}
			.product1 .title .heading {
				font-weight: 700;
				font-size: 2.5rem;
				color: #1d1d1d;
			}
			.product1 .title .action-btn {
				margin-left: 10;
				background-color: var(--primary-color);
			}
			.product1 .title .action-btn:hover {
				opacity: 0.6;
			}
			.product1 .title .more {
				font-size: 2rem;
				font-weight: 400;
			}
			.product1 .title .more i {
				color: var(--primary-color);
			}
			.product1 .list {
				margin-top: 40px;
				display: flex;
				justify-content: space-between;
			}
			.product1 .product_list .list_item:hover {
				border: 0.8px solid rgb(170, 160, 160);
			}
			.product1 .list_item .img {
				width: 40%;
				height: 100%;
				object-fit: cover;
				object-position: center;
				float: left; /* Add float left to the image */
  				margin-right: 20px;
			}
			.product1 .list_item .name {
				margin-left: 10px;
				margin-top: 5px;
				/* margin-bottom: 14px; */
				font-size: 2rem;
				font-weight: 1000;
				line-height: 2rem;
				position: relative;
				color: var(--color-shoes);
				/* padding-top: 5px; Add some padding to align text with image */
				/* float: right; */
				margin-right: 20px;
				display: block;
			}
		</style>
        <div class="product1">
            <div class="title" id="profile">
                <h2 class="heading action-btn">
                    <a href="#profile">THÔNG TIN CÁ NHÂN</a>
                </h2>
            </div>
            <div class="product_list">
                <ul class="list">
                    <div class="list_item">
                        <span class="name">
                            Họ và tên: <%=user.getFullName()%><br>
                            Số điện thoại: <%=user.getPhoneNums()%><br>
                            Id tài khoản: <%=user.getUserId()%><br>
                            Mật khẩu: <%=user.getPassword()%><br>
                            Tài khoản ngân hàng: <%=formatter.format(user.getBankAcc().getBalance())%>đ<br>
                        </span>
                    </div>
                </ul>
            </div><br><br>
            <div class="title">
                <h2 class="heading action-btn">
                    <a href="#!">LỊCH SỬ MUA HÀNG</a>
                </h2>
                <div class="more">
                    <a href="#!">
                        Xem thêm
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            <%for(int i = 0, j = 0; j < buyingHistory.products.size() / 5 + 1; j += 1) {%>
            <div class="product_list">
                <ul class="list">
                    <%for( ; i < buyingHistory.products.size() && i < (j + 1) * 5; i++) {
                        String productJson = objectMapper.writeValueAsString(buyingHistory.products.get(i));%>
                    <li class="list_item">
                        <a href="product?userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>">
                            <img
                            src="<%=buyingHistory.products.get(i).getImage()%>"
                            alt="<%=buyingHistory.products.get(i).getName()%>"
                            class="img"
                            />
                            <div class="name">
                                <%=buyingHistory.products.get(i).getName()%><br>
                                Ngày đặt: <%=LocalDate.now().toString()%>
                                <%=formatter.format(Math.round(buyingHistory.products.get(i).getSaleoff() * buyingHistory.products.get(i).getUnitPrice()))%>đ x <%=buyingHistory.quantityEachProduct.get(i)%>
                            </div>
                        </a>
                        <form method="post" action="a-r">
                            <lable for="query">Đánh giá</lable>
                            <input type="text" id="query" name="review"><br>
                            <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>">
                            <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>">
                            <input type="submit" value="Hoàn tất">
                        </form>
                    </li>
                    <%}%>
                </ul>
            </div>
            <%}%>
        </div>
        <!----------------------- Footer -------------------------->
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