<!DOCTYPE html>
<html>
    <head>
        <title>Contact</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/contact.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
                        <img src="all_images/logo_black.png" alt="logo" width="125px">
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a class="bx bxs-t-shirt" href="product"> Home</a></li>
                            <li><a class="bx bx-phone" href="#"> Contact</a></li>
                            <li><a class='bx bx-log-in-circle' href="login.jsp"> Login</a></li>
                        </ul>
                    </nav>
                    <a class="cart" href="shopping-cart.jsp"><i class='bx bx-cart'></i></a>
                    <img src="images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                </div>
            </div>
        </header>
        <section class="contact">
            <div class="content">
                <h2>Contact Us</h2>
            </div>
            <div class="container">
                <div class="contact-info">
                    <div class="box">
                        <div class="icon"><i class="bi bi-geo-alt-fill"></i></div>
                        <div class="text">
                            <h3>Address</h3>
                            <p>1 Vo Van Ngan, <br>Thu Duc District, Ho Chi Minh City, <br>Vietnam.</p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon"><i class="bi bi-telephone"></i></div>
                        <div class="text">
                            <h3>Phone</h3>
                            <p>000-000-0000</p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon"><i class="bi bi-envelope-at"></i></div>
                        <div class="text">
                            <h3>Email</h3>
                            <p>abcxyz@gmail.com</p>
                        </div>
                    </div>
                    <h2 class="txt">Connect with us</h2>
                    <ul class="sci">
                        <li><a href="#"><i class="bi bi-facebook"></i></a></li>
                        <li><a href="#"><i class="bi bi-twitter-x"></i></a></li>
                        <li><a href="#"><i class="bi bi-youtube"></i></a></li>
                        <li><a href="#"><i class="bi bi-instagram"></i></a></li>
                    </ul>
                </div>

                <div class="contact-form">
                    <form action="">
                        <h2>Send Message</h2>
                        <div class="inputBox">
                            <input type="text" required>
                            <span>Full Name</span>
                        </div>
                        <div class="inputBox">
                            <input type="email" required>
                            <span>Email</span>
                        </div>
                        <div class="inputBox">
                            <textarea required></textarea>
                            <span>Type your message...</span>
                        </div>
                        <div class="inputBox">
                            <input type="submit" value="Send">
                        </div>
                    </form>
                </div>
            </div>
        </section>

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
