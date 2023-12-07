<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Products</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/product.css" type="text/css" />
        <link rel="stylesheet" href="styles/main.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;600;700display=swap" rel="stylesheet" />
        <style>
            /* header */
            .navbar {
                display: flex;
                align-items: center;
                padding: 20px;
            }
            nav {
                flex: 1;
                text-align: right;
            }
            nav ul {
                display: inline-block;
                list-style-type: none;
            }
            nav ul li {
                display: inline-block;
                margin-right: 20px;
                font-size: 16px;
            }
            nav ul li a {
                text-decoration: none;
                color: #555;
            }
            nav ul li a:hover {
                font-size: 20px;
                font-weight: bold;
            }
            .cart {
                font-size: 22px;
                text-decoration: none;
                color: #555;
                margin-left: 10px;
            }
            .cart:hover {
                font-size: 30px;
            }
            .navbar img {
                width: 125px;
            }
            #search-form {
                display: flex;
                align-items: center;
                padding: 5px;
            }
            #search-input {
                width: 200px;
                height: 30px;
                padding: 5px;
                font-size: 14px;
                margin-left: 10px;
            }
            #search-btn {
                width: 30px;
                height: 30px;
                padding: 5px;
                background: #555;
                color: #fff;
                font-size: 14px;
                text-align: center;
            }
            #search-btn:hover {
                background: grey;
            }

            .header-container {
                max-width: 1300px;
                margin: auto;
                padding-left: 25px;
                padding-right: 25px;
            }
            .menu-icon {
                width: 30px;
                height: 30px;
                margin-left: 20px;
                display: none;
            }
            header {
                background: radial-gradient(#fff, #4ef5c6);
            }
            .greeting {
                font-family: san-serif;
                font-size: 14px;
                padding: 5px;
                margin-left: 10px;
                text-align: right;
            }
            .greeting span {
                color: #333;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="header-container">
                <div class="navbar">
                    <div class="logo">
                        <img src="all_images/logo_black.png" alt="logo">
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a class="bx bxs-t-shirt" href="index.jsp"> Home</a></li>
                            <li><a class="bx bx-phone" href="contact.jsp"> Contact</a></li>
                                <c:if test="${sessionScope.acc != null}">
                                <li><a class='bx bx-log-out-circle' href="logout"> Logout</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc == null}">
                                <li><a class='bx bx-log-in-circle' href="login.jsp"> Login</a></li>
                                </c:if>

                        </ul>
                    </nav>
                    <form action="search" id="search-form" method="post">
                        <input name="search" type="text" id="search-input" placeholder="Search...">
                        <button type="submit" id="search-btn">
                            <i class='bx bx-search-alt-2' ></i>
                        </button>
                    </form>
                    <a class="cart" href="cart"><i class='bx bx-cart'></i></a>
                    <img src="all_images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                    <c:if test="${sessionScope.acc != null}">
                        <p class="greeting">Hello <span><i>${sessionScope.acc.firstName}</i></span></p>
                    </c:if>
                </div>
            </div>

        </header>
        <div class="products">
            <div class="category">
                <table>
                    <c:forEach items="${listCate}" var="o">
                        <tr>
                            <td class="${tag == o.cateId ? "active":""}">
                                <a href="category?cid=${o.cateId}"><i class='bx bx-menu-alt-left' ></i><span>${o.cateName}</span></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="container">
                <h1 class="lg-title">Special Shoe with offers</h1>
                <p class="text-light">Lorem ipsum, dolor sit amet
                    consectetur adipisicing elit. Sed maiores quia doloremque est
                    commodi aliquid minus aliquam accusamus, reiciendis facilis odit corrupti deserunt
                    animi dignissimos ea tempore quis unde saepe.</p>
                    <c:forEach items="${list}" var="o">
                    <div class="products-items">
                        <!--single products-->
                        <div class="product">
                            <div class="product-content">
                                <div class="product-img">
                                    <a href="info?code=${o.code}">
                                        <img src="all_images/both/${o.code}_both.png" alt="Product">
                                    </a>
                                </div>
                                <div class="product-btn">
                                    <a href="cart?action=add&code=${o.code}"><button type="button" class="btn-cart">
                                            Add to cart<span><i class='bx bx-plus'></i></span>
                                        </button></a>
                                            
                                     <a href="cart?action=add&code=${o.code}"><button type="button" class="btn-buy">
                                          Buy Now<span><i class='bx bx-plus'></i></span>
                                        </button></a>
                                   
                                </div>
                            </div>

                            <div class="product-info">
                                <div class="product-info-top">
                                    <div class="rating">
                                        <span><i class='bx bxs-star' ></i></span>
                                        <span><i class='bx bxs-star' ></i></span>
                                        <span><i class='bx bxs-star' ></i></span>
                                        <span><i class='bx bxs-star' ></i></span>
                                        <span><i class='bx bx-star' ></i></span>
                                    </div>
                                </div>
                                <a href="#" class="product-name">${o.description}</a>
                                <p class="product-price">${o.getPriceFormat()}</p><br>
                            </div>
                        </div>
                        <!--end of single product-->
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and iOS.</p>
                        <div class="app-logo">
                            <img src="all_images/play-store.png" alt="ggplay">
                            <img src="all_images/app-store.png" alt="appstore">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="all_images/logo.png" alt="download">
                        <p>Our Purpose Is To Sustainably Make the Pleasure and 
                            Benefits of Sports Accessibilities to the Many.</p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>
                        <ul>
                            <li>Coupons</li>
                            <li>Blog Post</li>
                            <li>Return Policies</li>
                            <li>Join Affiliate</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li>
                                <a class='bx bxl-facebook-square' href="#"> Facebook</a>
                            </li>
                            <li>
                                <a class='bx bxl-twitter' href="#"> Twitter</a>
                            </li>
                            <li>
                                <a class='bx bxl-instagram-alt' href="#"> Instagram</a>
                            </li>
                            <li>
                                <a class='bx bxl-youtube' href="#"> YouTube</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2020 - Easy Tutorials</p>
            </div>
        </footer>

        <!--JS for toggle menu-->
        <script>
            var MenuItems = document.getElementById("MenuItems");

            MenuItems.style.maxHeight = "0px";

            function menutoggle() {
                if (MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                } else
                {
                    MenuItems.style.maxHeight = "0px";
                }
            }
        </script>

        <!--JS for toggle menu-->
        <script>
            var MenuItems = document.getElementById("MenuItems");

            MenuItems.style.maxHeight = "0px";

            function menutoggle() {
                if (MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                } else
                {
                    MenuItems.style.maxHeight = "0px";
                }
            }
        </script>

        <!-- JS for toggle categories-->
        <script>
            function select(event) {
                event.preventDefault();

                var currentSelect = event.target;
                var currentClass = currentSelect.classList;

                if (currentClass.contains('active')) {
                    currentClass.remove('active');
                } else {
                    currentClass.add('active');
                }
            }
        </script>

    </body>
</html>