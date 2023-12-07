<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Detail Page</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/detail-product.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
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
            }
            .cart:hover {
                font-size: 30px;
            }
            .navbar img {
                width: 30px;
                height: 30px;
            }
            .header-container {
                max-width: 88vw;
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
                            <li><a class="bx bx-home" href="index.jsp"> Home</a></li>
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
                    <a class="cart" href="shopping-cart.jsp"><i class='bx bx-cart'></i></a>
                    <img src="images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                    <c:if test="${sessionScope.acc != null}">
                        <p class="greeting">Hello <span><i>${sessionScope.acc.firstName}</i></span></p>
                    </c:if>
                </div>
            </div>
        </header>

        <div class="flex-box">
            <c:if test="${detail.type != 'boots'}">
                <div class="left">
                    <div class="big-img">
                        <img src="all_images/both/${detail.code}_both.png">
                    </div>
                    <div class="image">
                        <div class="small-img">
                            <img src="all_images/front/${detail.code}_front.png" onclick="showImage(this.src)">
                        </div>
                        <div class="small-img">
                            <img src="all_images/back/${detail.code}_back.png" onclick="showImage(this.src)">
                        </div>
                        <div class="small-img">
                            <img src="all_images/both/${detail.code}_both.png" onclick="showImage(this.src)">
                        </div> 
                    </div>
                </div>

                <div class="right">
                    <div class="url">Home > Product > Kit</div>
                    <div class="pname">${detail.description}</div>
                    <div class="rating">
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star-half' ></i>
                    </div>
                    <div class="price">${detail.getPriceFormat()}</div>
                    <div class="size">
                        <p>Size: </p>
                        <div class="psize">S</div>
                        <div class="psize">M</div>
                        <div class="psize">L</div>
                        <div class="psize">XL</div>
                        <div class="psize">XXL</div>
                    </div>
                </c:if>

                <c:if test="${detail.type == 'boots'}">
                    <div class="left">
                        <div class="big-img">
                            <img src="all_images/both/${detail.code}_${detail.type}_both.png">
                        </div>
                        <div class="image">
                            <div class="small-img">
                                <img src="all_images/front/${detail.code}_front.png" onclick="showImage(this.src)">
                            </div>
                            <div class="small-img">
                                <img src="all_images/back/${detail.code}_back.png" onclick="showImage(this.src)">
                            </div>
                            <div class="small-img">
                                <img src="all_images/both/${detail.code}_both.png" onclick="showImage(this.src)">
                            </div> 
                        </div>
                    </div>

                    <div class="right">
                        <div class="url">Home > Product > Kit</div>
                        <div class="pname">${detail.description}</div>
                        <div class="rating">
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star-half' ></i>
                        </div>
                        <div class="price">${detail.getPriceFormat()}</div>
                        <div class="size">
                            <p>Size: </p>
                            <div class="psize">32</div>
                            <div class="psize">33</div>
                            <div class="psize">34</div>
                            <div class="psize">35</div>
                            <div class="psize">36</div>
                            <div class="psize">37</div>
                            <div class="psize">38</div>
                            <div class="psize">39</div>
                            <div class="psize">40</div>       
                        </div>
                    </c:if>

                    <!-- <div class="quantity">
                        <p>Quantity: </p>
                        <input type="number" name="quantity" min="1" value="1" required> 
                    </div> -->
                    <div class="btn-box">
                        <a href="cart?action=add&code=${detail.code}"><button class="cart-btn">Add to Cart</button</a>
                        <!-- <input type="submit" class="cart-btn" value="Add to Cart"> -->
                        <button class="buy-btn">Buy Now</button>
                    </div>
                </div>
                <a href="product"><button class="return-btn">Return</button></a>
            </div>
            <!-- </form> -->



            <script>
                let bigImg = document.querySelector('.big-img img');
                function showImage(pic) {
                    bigImg.src = pic;
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
    </body>
</html>
