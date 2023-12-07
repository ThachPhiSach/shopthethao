<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/register.css" type="text/css" />
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
                        <img src="all_images/logo_black.png" alt="logo" width="125px">
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
            <h1>Sign Up</h1>
            <form action="signup" method="post">
                <div class="txt_field">
                    <input name="email" type="email" placeholder="Email" value="${email}" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="firstName" type="text" placeholder="First Name" value="${firstName}" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="lastName" type="text" placeholder="Last Name" value="${lastName}" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="password" type="password" placeholder="Password" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="repass" type="password" placeholder="Re-Enter Password" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="phone" type="text" placeholder="Phone Number" value="${phone}" required>
                    <span></span>
                </div>
                <div class="txt_field">
                    <input name="address" type="text" placeholder="Address" value="${address}" required>
                    <span></span>
                </div>
                <div class="check-box">
                    <input type="checkbox">
                    <label>I agree with all the terms and conditions.</label>
                </div>
                <p class="message">${message}</p>
                <input type="submit" value="Sign Up">
                <div class="signup_link">
                    Have an account already? <a href="login.jsp">Login here</a>
                </div>
            </form>
        </div>
        

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
