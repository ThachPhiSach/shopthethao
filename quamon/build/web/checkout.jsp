<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="styles/checkout.css" type="text/css" />
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

       <script>
            function togglePaymentOptions() {
                var selectElement = document.getElementById("paymentMethod");
                var paymentOptions = document.getElementById("paymentOptions");

                if (selectElement.value === "card") {
                    paymentOptions.style.display = "block";
                } else {
                    paymentOptions.style.display = "none";
                }
            }
        </script>
    </head>
    <body>
        <header>
            <div class="header-container">
                <div class="navbar">
                    <div class="logo">
                        <img src="all_images/logo_black.png" alt="logo" width="225px">
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
                    <a class="cart" href="cart"><i class='bx bx-cart'></i></a>
                    <img src="images/menu.png" alt="menu" class="menu-icon" onclick="menutoggle()">
                    <c:if test="${sessionScope.acc != null}">
                        <p class="greeting">Hello <span><i>${sessionScope.acc.firstName}</i></span></p>
                    </c:if>
                </div>
            </div>
        </header>

        <!-- content -->
        <div class="container">
            <div class="header">
                <h1>Checkout</h1>
            </div>
            <div class="customer-info">
                <h2>Customer Information</h2>
                <form action="">
                    <label>First Name:<span id="firstname"><i>${sessionScope.account.firstName}</i></span></label>
                    <label>Last Name:<span id="lastname"><i>${sessionScope.account.lastName}</i></span></label>
                    <label>Email:<span id="email"><i>${sessionScope.account.email}</i></span></label>
                    <label>Phone:<span id="phone"><i>${sessionScope.account.phone}</i></span></label>
                    <label>Address:
                        <span id="address"><i>${sessionScope.account.address}</i></span>
                    </label>
                </form>
            </div>
            <div class="content">
                <div class="product-details">
                    <h2>Products Information</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${sessionScope.cart}">
                                <tr>
                                    <td>
                                        <img src="all_images/both/${p.product.code}_both.png" alt="Product 1">
                                    </td>
                                    <td>${p.product.description}</td>
                                    <td>${p.quantity}</td>
                                    <td>${p.getTotalCurrencyFormat()}</td>
                                </tr>
                            </c:forEach>
                            <!-- <tr>
                                <td>
                                    <img src="images/read_madrid_home_2324.png" alt="Product 2">
                                </td>
                                <td>Real Madrid Kit 2023/24</td>
                                <td>2</td>
                                <td>200.000 VND</td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
                <div class="payment-methods">
                    <h2>Payment</h2>
                    <div class="total-price">
                        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <c:set var="totalPrice" value="0" />
                        <c:forEach var="pd" items="${sessionScope.listItem}">
                            <c:set var="productTotal" value="${pd.getTotal()}" />
                            <c:set var="totalPrice" value="${totalPrice + productTotal}" />
                            <c:set var="total" value="${pd.getSumTotalFormat(totalPrice)}" />
                        </c:forEach>
                        <p>Total: <i><span>${total}</span></i></p>
                    </div>
                    <div class="payment-options">
                        <form action="" class="payment-method">
                            <select id="paymentMethod" name="payment" onchange="togglePaymentOptions()">
                                <option value="cash">On Cash</option>
                                <option value="card">Credit Card</option>
                            </select>
                        </form>
                        <!-- <label for="cash-on-delivery">
                            <input type="radio" id="cash-on-delivery" name="payment-method" value="cash-on-delivery" checked>
                            Thanh toán tiền mặt
                        </label>
                        <label for="bank-transfer">
                            <input type="radio" id="bank-transfer" name="payment-method" value="bank-transfer">
                            Chuyển khoản ngân hàng
                        </label> -->
                        <div id="paymentOptions" class="bank-options" style="display: none;">
                            <input type="radio" name="banking" value="mastercard">
                            <img src="all_images/credit_cards.png" alt="">
                            <br>
                            <input type="radio" name="banking" value="momo">
                            <img src="all_images/momo.png" alt="">
                            <br>
                            <input type="radio" name="banking" value="zalopay">
                            <img src="all_images/zalo_pay.webp" alt="">
                            <br>
                            <input type="radio" name="banking" value="vnpay">
                            <img src="all_images/vnpay.png" alt="">
                        </div>

                        <div class="checkout-button">
                            <form action="#">
                                <input type="submit" value="Confirm">
                            </form>
                            <!-- <button type="button">Confirm</button> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
