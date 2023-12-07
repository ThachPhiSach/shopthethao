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
        </style>
    </head>
    <body>
        <header>
            <div class="header-container">
                <div class="navbar">
                    <div class="logo">
                        <img src="images/logo_black.png" alt="logo" width="125px">
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a class="bx bx-home" href="index.html"> Home</a></li>
                            <li><a class="bx bxs-t-shirt" href="products.jsp"> Products</a></li>
                            <li><a class="bx bx-phone" href="contact.jsp"> Contact</a></li>
                            <li><a class='bx bx-log-in-circle' href="login.jsp"> Login</a></li>
                        </ul>
                    </nav>
                    <a class="cart" href="shopping-cart.jsp"><i class='bx bx-cart'></i></a>
                    <img src="images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                </div>
            </div>
        </header>

        <div class="flex-box">
            <div class="left">
                <div class="big-img">
                    <img src="images/bar_home.png">
                </div>
                <div class="image">
                    <div class="small-img">
                        <img src="images/bar_home.png" onclick="showImage(this.src)">
                    </div>
                    <div class="small-img">
                        <img src="images/away/bar_away.png" onclick="showImage(this.src)">
                    </div>
                    <div class="small-img">
                        <img src="images/away/bar_third.png" onclick="showImage(this.src)">
                    </div> 
                </div>
            </div>

            <div class="right">
                <div class="url">Home > Product > Kit</div>
                <div class="pname">Manchester United Kit 2023/24</div>
                <div class="rating">
                    <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star' ></i>
                        <i class='bx bxs-star-half' ></i>
                </div>
                <div class="price">100.000 VND</div>
                <div class="size">
                    <p>Size: </p>
                    <div class="psize">S</div>
                    <div class="psize">M</div>
                    <div class="psize">L</div>
                    <div class="psize">XL</div>
                    <div class="psize">XXL</div>
                </div>
                <div class="quantity">
                    <p>Quantity: </p>
                    <input type="number" min="1" max="5" value="1">
                </div>
                <div class="btn-box">
                    <button class="cart-btn">Add to Cart</button>
                    <button class="buy-btn">Buy Now</button>
                </div>
            </div>
            <a href="?action=viewProducts"><button class="return-btn">Return</button></a>
        </div>

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
                if(MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                }
                else
                {
                    MenuItems.style.maxHeight = "0px";
                }
            }
        </script>
    </body>
</html>
