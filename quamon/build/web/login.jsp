<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/login.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <div src="all_images/logo_black.png" class="logo">
                        <img src="all_images/logo.png" alt="logo" width="125px">
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a class="bx bx-home" href="product"> Home</a></li>
                            <li><a class="bx bx-phone" href="contact.jsp"> Contact</a></li>
                            <li><a class='bx bx-log-in-circle' href="login.jsp"> Login</a></li>
                        </ul>
                    </nav>
                    <a class="cart" href="shopping-cart.jsp"><i class='bx bx-cart'></i></a>
                    <img src="images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                </div>
            </div>
        </header>

        <!-- account page-->
        <div class="wrapper">
            <h1>Login</h1>
            <form action="login" method="post" class="form" onsubmit="onSubmitForm(this); return false;">           
                <p class="message"><i>${message}</i></p>
                <div class="txt_field">
                    <input name="email" type="email" placeholder="Email" id="email" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="password" type="password" placeholder="Password" id="password" required>
                    <span></span>
                </div>
                <div class="check-box">
                    <input type="checkbox">
                    <label>Remember me</label>
                </div>
                <input type="submit" value="Sign In">
                <div class="signup_link">
                    Not a member? <a href="register.jsp">Sign Up</a>
                </div>
            </form>
        </div>

        <!-- JS for toggle menu-->
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
