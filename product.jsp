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
<!DOCTYPE html>
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
        <link rel="stylesheet" href="./assets/css/select-input.css" />
        <link rel="stylesheet" href="./assets/css/style-superstar.css" />
        <script src="./components/header.js" type="text/javascript" defer></script>
        <script src="./components/footer.js" type="text/javascript" defer></script>
        <script src="./components/adidas.js" type="text/javascript" defer></script>
        <script src="./components/nike.js" type="text/javascript" defer></script>
        <script src="./components/select-input.js" type="text/javascript" defer></script>

        <title>Thợ Code Bán Giày</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            ProductForSale product = (ProductForSale) request.getAttribute("product");
            for(int i = 0; i < ManagerService.products.size(); i++) {
                if(ManagerService.products.get(i).getName().equals(product.getName())) {
                    product = ManagerService.products.get(i);
                    break;
                }
            }
            NumberFormat formatter = NumberFormat.getNumberInstance();
            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);
            String productJson = objectMapper.writeValueAsString(product);
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
                                            for(int i = 0; i < size; i++) {
                                                productJson = objectMapper.writeValueAsString(user.getCartState().products.get(i));%>
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
                                                                <span class="header_cart-item-qnt"><%=user.getCartState().quantityEachProduct.get(i)%></span>
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
		<select_input-component></select_input-component>
		<div class="product_detail">
            <div class="sub_content">
                <div class="main_content">
                    <%if(product.getName().equals("SUPERSTAR")) {%>
                    <div class="small_image">
                        <div class="small_image-link">
                            <a href="<%=product.getSmallImg1()%>">
                                <img
                                    src="<%=product.getSmallImg1()%>"
                                    alt="<%=product.getName()%>"
                                    class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="<%=product.getSmallImg2()%>">
                                <img
									src="<%=product.getSmallImg2()%>"
									alt="<%=product.getName()%>"
									class="small_image-img" />
                            </a>
                        </div>
                        <div class="small_image-link">
                            <a href="<%=product.getSmallImg3()%>">
                                <img
									src="<%=product.getSmallImg3()%>"
									alt="<%=product.getName()%>"
									class="small_image-img" />
                            </a>
                        </div>
                    </div>
                    <%}%>
                    <div class="main_image">
                        <img src="<%=product.getImage()%>" alt="<%=product.getName()%>" class="main_image-img" />
                    </div>
                    <div class="info_buy">
                        <div class="name"><%=product.getName()%></div>
                        <div class="star">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <div class="price"><%=formatter.format(Math.round(product.getSaleoff() * product.getUnitPrice()))%>đ</div>
                        <%if(user != null) {
                            productJson = objectMapper.writeValueAsString(product);%>
                        <script>
                            function increaseValue() {
                                var value = parseInt(document.getElementById('number').value, 10);
                                value = isNaN(value) ? 1 : value;
                                value++;
                                document.getElementById('number').value = value;
                                document.getElementById('outputQuantity').textContent = value;
                                updateLink();
                            }
                            function decreaseValue() {
                                var value = parseInt(document.getElementById('number').value, 10);
                                value = isNaN(value) ? 1 : value;
                                value < 2 ? value = 2 : '';
                                value--;
                                document.getElementById('number').value = value;
                                document.getElementById('outputQuantity').textContent = value;
                                updateLink();
                            }

                            function increaseSize() {
                                var value = parseInt(document.getElementById('size').value, 10);
                                value = isNaN(value) ? 39 : value;
                                value > 44 ? value = 44 : '';
                                value++;
                                document.getElementById('size').value = value;
                                document.getElementById('outputSize').textContent = value;
                                updateLink();
                            }
                            function decreaseSize() {
                                var value = parseInt(document.getElementById('size').value, 10);
                                value = isNaN(value) ? 0 : value;
                                value < 40 ? value = 40 : '';
                                value--;
                                document.getElementById('size').value = value;
                                document.getElementById('outputSize').textContent = value;
                                updateLink();
                            }
                            function updateLink() {
                                var link = document.getElementById('upd-ct');
                                var quantity = document.getElementById('number').value;
                                var size = document.getElementById('size').value;
                                link.href = 'upd-ct?product=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&quantity=' + quantity + '&size=' + size;
                            }
                        </script>
                        <br>
                        <span class="desc-size">Số lượng:</span>
                        <form class="select-input">
                            <div class="filter_page-btn" id="decrease" onclick="decreaseValue()" value="Decrease Value">
                                <i class="fa-solid fa-minus"></i>
                            </div>
                            <span class="count" id="outputQuantity">1</span>
                            <input type="hidden" id="number" name = "quantity" value="1"/>
                            <div class="filter_page-btn" id="increase" onclick="increaseValue()" value="Increase Value">
                                <i class="fa-solid fa-plus"></i>
                            </div>                               
                        </form>
                        <div class="option-size">
                            <span class="desc-size">Kích Thước:</span>
                            <form class="select-input">
                                <!-- <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div> -->
                                <div class="filter_page-btn" id="decrease" onclick="decreaseSize()" value="Decrease Size">
                                    <i class="fa-solid fa-minus"></i>
                                </div>
                                <span class="count" id="outputSize">39</span>
                                <input type="hidden" id="size" name = "size" value="39"/>
                                <div class="filter_page-btn" id="increase" onclick="increaseSize()" value="Increase Size">
                                    <i class="fa-solid fa-plus"></i>
                                </div>                               
                            </form>
                        </div>
                        <div class="action-buy">
                            <div class="action-btn">
                                <a id="upd-ct" href="upd-ct?product=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&quantity=1&size=39" >
                                    <i class="fa-solid fa-cart-plus"></i>
                                    <span>Thêm Vào Giỏ</span>
                                </a>
                            </div>
                            <div class="action-btn">
                                <a href="#!">
                                    <i style="color: #ededed" class="fa-solid fa-money-check-dollar"></i>
                                    <span style="color: #ededed">Mua Ngay</span>
                                </a>
                            </div>
                        </div>
                        <%} else {%>
                        <script>
                            function increaseValue() {
                                var value = parseInt(document.getElementById('number').value, 10);
                                value = isNaN(value) ? 1 : value;
                                value++;
                                document.getElementById('number').value = value;
                                document.getElementById('outputQuantity').textContent = value;
                                updateLink();
                            }
                            function decreaseValue() {
                                var value = parseInt(document.getElementById('number').value, 10);
                                value = isNaN(value) ? 1 : value;
                                value < 2 ? value = 2 : '';
                                value--;
                                document.getElementById('number').value = value;
                                document.getElementById('outputQuantity').textContent = value;
                                updateLink();
                            }
                            function increaseSize() {
                                var value = parseInt(document.getElementById('size').value, 10);
                                value = isNaN(value) ? 39 : value;
                                value > 44 ? value = 44 : '';
                                value++;
                                document.getElementById('size').value = value;
                                document.getElementById('outputSize').textContent = value;
                                updateLink();
                            }
                            function decreaseSize() {
                                var value = parseInt(document.getElementById('size').value, 10);
                                value = isNaN(value) ? 0 : value;
                                value < 40 ? value = 40 : '';
                                value--;
                                document.getElementById('size').value = value;
                                document.getElementById('outputSize').textContent = value;
                                updateLink();
                            }
                            function updateLink() {
                                var link = document.getElementById('login');
                                var quantity = document.getElementById('number').value;
                                var size = document.getElementById('size').value;
                                link.href = 'login.jsp?product=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>&quantity=' + quantity + '&size=' + size;
                            }
                        </script>
                        <br>
                        <span class="desc-size">Số lượng:</span>
                        <form class="select-input" method="post" action="upd-ct">
                            <div class="filter_page-btn" id="decrease" onclick="decreaseValue()" value="Decrease Value">
                                <i class="fa-solid fa-minus"></i>
                            </div>
                            <span class="count" id="outputQuantity">1</span>
                            <input type="hidden" id="number" name = "quantity" value="1"/>
                            <div class="filter_page-btn" id="increase" onclick="increaseValue()" value="Increase Value">
                                <i class="fa-solid fa-plus"></i>
                            </div>                               
                        </form>
                        <div class="option-size">
                            <span class="desc-size">Kích Thước:</span>
                            <form class="select-input">
                                <div class="filter_page-btn" id="decrease" onclick="decreaseSize()" value="Decrease Size">
                                    <i class="fa-solid fa-minus"></i>
                                </div>
                                <span class="count" id="outputSize">39</span>
                                <input type="hidden" id="size" name = "size" value="39"/>
                                <div class="filter_page-btn" id="increase" onclick="increaseSize()" value="Increase Size">
                                    <i class="fa-solid fa-plus"></i>
                                </div>                               
                            </form>
                        </div>
                        <div class="action-buy">
                            <div class="action-btn">
                                <a id="login" href="login.jsp?product=true&productJson=<%=URLEncoder.encode(productJson, "UTF-8")%>&userJson=<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                    <i class="fa-solid fa-cart-plus"></i>
                                    <span>Thêm Vào Giỏ</span>
                                </a>
                            </div>
                            <div class="action-btn">
                                <a href="#!">
                                    <i style="color: #ededed" class="fa-solid fa-money-check-dollar"></i>
                                    <span style="color: #ededed">Mua Ngay</span>
                                </a>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <%if(product.getName().equals("SUPERSTAR")) {%>
            <div class="desc_detail">
                <div class="reason">4 LÝ DO BẠN KHÔNG NÊN BỎ LỠ SUPERSTAR</div>
                <div class="paragraph">
                    Hàng ngày nhìn thấy những đôi giày Adidas Superstar được rất nhiều các bạn trẻ mang trên đường phố
                    đã bao giờ bạn thắc mắc tại sao đôi giày này lại có sức hút lớn như vậy chưa? Rất có thể đọc xong
                    bài viết này bạn sẽ lập tức muốn sở hữu đôi giày huyền thoại này đấy!
                </div>
                <div class="reason">1. Mẫu giày không bao giờ lỗi thời</div>
                <div class="paragraph">
                    Adidas Superstar Authentic là mẫu giày vô cùng classic được liệt kê vào danh sách những đôi giày
                    kinh điển, trường tồn và không bao giờ lỗi thời. Đôi giày được ra mắt vào năm 1969 và đã trở thành
                    một trong những yếu tố có ảnh hưởng vô cùng mạnh mẽ trong các giới thể thao, thời trang và văn hóa
                    hip-hop lúc bấy giờ. Thậm chí, năm 1986, Run D.M.C còn cho ra ca khúc “My adidas” nằm trong album
                    “Raising Hell”, khẳng định một lần nữa vị thế của dòng giày Superstar trong từng ngõ ngách của đường
                    phố.
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 1.jpg" alt="superstar" />
                </div>
                <div class="reason">2. Khả năng mix đồ không giới hạn</div>
                <div class="paragraph">
                    Đôi giày Adidas Superstar này có thể nói là một con tắc kè hoa chính hiệu. Chúng có khả năng biến
                    hóa vô cùng linh hoạt, phù hợp với mọi giới tính, mọi tính cách và mọi hoàn cảnh. Với các bạn nữ,
                    nếu các bạn muốn có một vẻ ngoài năng động, khỏe khoắn và phá cách một chút thì một chiếc quần jeans
                    rách gối và một đôi giày adidas Superstar sẽ là một lựa chọn không sai vào đâu được. Thế nhưng, nếu
                    bạn lại là một cô nàng bánh bèo thì sao nhỉ? Hãy yên tâm rằng điều đó cũng không làm khó được đôi
                    giày adidas huyền thoại này đâu! Bạn chỉ cần kết hợp với một chiếc váy xòe, vậy là sẽ có một vẻ
                    ngoài ngọt ngào, đáng yêu ngay thôi!
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 2.jpg" alt="superstar" />
                </div>
                <div class="reason">3. Mức giá dễ chịu</div>
                <div class="paragraph">
                    Đây là một trong số ít những đôi high end (cao cấp) mà lại có giá cả rất phải chăng. Mức giá của đôi
                    giày chính hãng Adidas Superstar này giao động từ 2.100.000- 2.500.000. Tuy nhiên khi mua hàng các
                    bạn cũng nên cân nhắc thật kĩ tránh trường hợp vì ham giá rẻ mà chọn những nơi mua hàng không đảm
                    bảo chất lượng. Tại Thợ Code Bán Giày, giá đôi Adidas Superstar hiện tại chỉ còn 1.900.000đ. Cực êm
                    ái và phù hợp cho túi tiền của các bạn ngân sách không nhiều nhưng lại thích sở hữu cho hình một đôi
                    giày đúng nghĩa.
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 3.jpg" alt="superstar" />
                </div>

                <div class="reason">4. Bảo quản dễ dàng</div>
                <div class="paragraph">
                    Với thiết kế chủ yếu được làm bằng chất liệu da nên đôi giày không bị bám bụi và rất dễ dàng trong
                    việc làm sạch và bảo quản. Nếu chẳng may bị dính bẩn, bạn chỉ cần dùng một chiếc giẻ ẩm, lau đi ngay
                    lúc đó là vết bẩn sẽ tự động biến mất thôi. Còn nếu trong trường hợp gặp những vết bẩn cứng đầu hơn,
                    bạn có thể sử dụng các loại tẩy rửa chuyên dụng như Crep.
                </div>
                <div class="img-desc">
                    <img src="./assets/img/superstar desc 4.jpg" alt="superstar" />
                </div>
            </div>
            <%}%>
            <div class="comment">
                <%if(user != null) {
                    for(int i = 0; i < user.getbuyingHistory().products.size(); i++) {
                        if(user.getbuyingHistory().products.get(i).getName().equals(product.getName()) && user.getbuyingHistory().hasAsset.get(i) == false) {%>
                            <p class="reason">Đánh giá của bạn:</p>
                            <div class="rating star">
                                <script>
                                    var noOfStars = 0;
                                </script>
                                <img id="star1" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset1()">
                                <img id="star2" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset2()">
                                <img id="star3" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset3()">
                                <img id="star4" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset4()">
                                <img id="star5" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 31.92px; height: 31.92px;" onclick="asset5()">
                                <script>
                                    function asset1() {
                                        var id = document.getElementById('star1');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 1;
                                    }
                                    function asset2() {
                                        asset1();
                                        var id = document.getElementById('star2');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 2;
                                    }
                                    function asset3() {
                                        asset1();
                                        asset2();
                                        var id = document.getElementById('star3');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 3;
                                    }
                                    function asset4() {
                                        asset1();
                                        asset2();
                                        asset3();
                                        var id = document.getElementById('star4');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 4;
                                    }
                                    function asset5() {
                                        asset1();
                                        asset2();
                                        asset3();
                                        asset4();
                                        var id = document.getElementById('star5');
                                        id.src = "http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png";
                                        document.getElementById('noOfStars').value = 5;
                                    }
                                </script>
                            </div>
                            <form method="post" action="a-r">
                                <div class="frame">
                                    <input type="hidden" id="noOfStars" name="noOfStars" value="0"/>
                                    <textarea type="text" name="review" id="comment-box" placeholder="Nhập đánh giá của bạn" value=""></textarea>
                                    <input type="hidden" name="userJson" value="<%=URLEncoder.encode(userJson, "UTF-8")%>">
                                    <input type="hidden" name="productJson" value="<%=URLEncoder.encode(productJson, "UTF-8")%>">
                                </div>
                                <input type="submit" id="post" value="Đánh giá"/>
                            </form>
                        <%break;
                        }
                    }
                }%>
                <ul id="unordered">
                    <%if(product.getCrs().size() == 0) {%>
                        Sản phẩm chưa có đánh giá nào.
                    <%} else {
                        for(int i = 0; i < product.getCrs().size(); i++) {%>
                            <li>
                                <div>
                                    <%for(int j = 0; j < product.getCrs().get(i).getNoOfStars(); j++) {%>
                                    <img class="rating star" src="http://laz-img-cdn.alicdn.com/tfs/TB19ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 20.46px; height: 20.46px;">
                                    <%}%>
                                    <%for(int j = 0; j < 5 - product.getCrs().get(i).getNoOfStars(); j++) {%>
                                    <img class="rating star" src="http://laz-img-cdn.alicdn.com/tfs/TB18ZvEgfDH8KJjy1XcXXcpdXXa-64-64.png" style="width: 20.46px; height: 20.46px;">
                                    <%}%>
                                    <%=LocalDate.now().toString()%>
                                </div>
                                Bởi: <div class="user_name"><%=product.getCrs().get(i).getFromUser()%></div>
                                <div class="comment_content"><%=product.getCrs().get(i).getReview()%></div>
                                <div class="react heart-solid">
                                    <!-- Heart: heart-full -->
                                    <a href="#!"><i class="fa-regular fa-heart"></i></a>
                                    <a href="#!"><i class="fa-solid fa-heart"></i></a>
                                    <span class="react_count">1</span>
                                </div>
                            </li>
                        <%}
                    }%>
                </ul>
            </div>
        </div>
        <footer-component></footer-component>
    </body>
</html>