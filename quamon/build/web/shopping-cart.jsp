<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/cart.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
                        <img src="all_images/logo_black.png" alt="logo" width="125px">
                       
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a class="bx bx-home" href="product"> Home</a></li>
                            <li><a class="bx bx-phone" href="contact.jsp"> Contact</a></li>
                                <c:if test="${sessionScope.acc != null}">
                                <li><a class='bx bx-log-out-circle' href="logout"> Logout</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acc == null}">
                                <li><a class='bx bx-log-in-circle' href="login.jsp"> Login</a></li>
                                </c:if>
                        </ul>
                    </nav>
                    <a class="cart" href="#"><i class='bx bx-cart'></i></a>
                    <img src="images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                    <c:if test="${sessionScope.acc != null}">
                        <p class="greeting">Hello <span><i>${sessionScope.acc.firstName}</i></span></p>
                    </c:if>
                </div>
            </div>
        </header>

        <!-- cart item detail-->
        <div class="small-container cart-page">
            <a class="btn-add-more" href="product">Continue Shopping</a>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>   

                <c:forEach items="${sessionScope.listItem}" var="item">
                    <tr>
                        <td>
                            <div class="cart-info">
                                <img src="all_images/both/${item.product.code}_both.png">
                                <div>
                                    <p>${item.product.description}</p>
                                    <small>Price: ${item.product.getPriceFormat()}</small>
                                    <br>
                                    <a href="cart?action=remove&code=${item.product.code}">Remove</a>
                                </div>
                            </div>
                        </td>
                        <td id="update">
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="code" value="${item.product.code}">
                                <input type="number" name="quantity" value="<c:out value="${item.quantity}" />" id="quantity">
                                <input type="submit" value="Update">
                            </form>
                        </td>
                        <!-- <td><span>${item.quantity}</span></td> -->
                        <td>${item.getTotalCurrencyFormat()}</td>
                    </tr>
                </c:forEach>
            </table>


            <div class="total-price">
                <table>
                    <!-- <tr>
                        <td>Subtotal</td>
                        <td>200.000 VND</td>
                    </tr>
                    <tr>
                        <td>Tax</td>
                        <td>15.000 VND</td>
                    </tr> -->
                    <tr>
                        <td>Total</td>
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <c:set var="totalPrice" value="0" />
                        <c:forEach var="pd" items="${sessionScope.listItem}">
                            <c:set var="productTotal" value="${pd.getTotal()}" />
                            <c:set var="totalPrice" value="${totalPrice + productTotal}" />
                            <c:set var="total" value="${pd.getSumTotalFormat(totalPrice)}" />
                        </c:forEach>

                        <td>
                            <c:out value="${total}" />
                        </td>
                    </tr>
                </table>
            </div>

            <div class="checkout-btn">
                <form action="checkout">
                    <input type="submit" value="Purchase">
                </form>
                <!-- <a href="checkout.jsp">Purchase</a> -->
            </div>
        </div>


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
