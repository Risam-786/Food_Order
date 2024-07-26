<%@ page import="java.util.Map" %>
<%@ page import="com.FoodItem" %>
<%@ page import="com.Cart" %>
<%@ page import="com.RemoveFromCartServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    
    <!-- Including the required fonts and icon library -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
    <!-- Internal styles for the page -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Navbar styles */
        .navbar {
            background-color: #f4511e;
            color: #fff;
            padding: 10px 0;
        }

        .navbar .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 2em;
            font-weight: 900;
        }

        .logo-link {
            color: #fff;
            text-decoration: none;
        }

        .nav-links {
            list-style-type: none;
            display: flex;
            font-size: 1.2rem;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            color: #fdd835;
        }

        .navbar-search {
            text-align: center;
        }

        .navbar-search form {
            display: flex;
            align-items: center;
        }

        .navbar-search input[type="search"] {
            width: 250px;
            padding: 10px;
            border: none;
            border-radius: 30px;
        }

        .navbar-search button {
            background-color: #f4511e;
            border: none;
            color: #fff;
            padding: 10px;
            margin-left: 5px;
            cursor: pointer;
        }

        .navbar-search button:hover {
            background-color: #333;
        }
        #delivery{
        display:flex;
        justify-content:space-between;
        }
        

        /* Table styles */
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .cart-table th {
            background-color: #f4511e;
            color: white;
        }

        /* Button styles */
        .btn {
            display: inline-block;
            background-color: #f4511e;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #333;
        }

        /* Footer styles */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            bottom: 10px;
		    position: absolute;
		    width: -webkit-fill-available;
        }

        footer p {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    <header>
        <nav class="navbar">
            <div class="container">
                <div class="logo">
                    <a href="Welcome.jsp" class="logo-link">FOODY</a>
                </div>
                 <div class="navbar-search" style="position: relative;">
    <form>
        <input type="search" id="search-input" placeholder="Search" onkeyup="searchItems()">
        <button type="button" onclick="searchItems()"><box-icon name='search' color='#ffffff'></box-icon></button>
    </form>
    <ul id="suggestions" class="suggestions-list" style="display: none;"></ul>
</div>
                <ul class="nav-links">
                    <li><a href="Welcome.jsp">Home</a></li>
                    <li><a href="Welcome.jsp#menu">Menu</a></li>
                    <li><a href="index.html">Login</a></li>
<!--                     <li><a href="addnew.jsp">Add New</a></li>
 -->                    <li><a href="cart.jsp"><box-icon name='cart' color='white' size='30px'></box-icon></a></li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="container">
        <h2>Your Shopping Cart</h2>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart != null) {
                        Map<Integer, FoodItem> items = cart.getItems();
                        double total = 0;
                        for (Map.Entry<Integer, FoodItem> entry : items.entrySet()) {
                            FoodItem item = entry.getValue();
                %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td>Rs. <%= item.getPrice() %></td>
                    <td>
                        <form action="update-cart" method="post">
                            <input type="hidden" name="id" value="<%= item.getId() %>">
                            <select name="quantity" onchange="this.form.submit()">
                                <% for (int i = 1; i <= 10; i++) { %>
                                    <option value="<%= i %>" <%= item.getQuantity() == i ? "selected" : "" %>><%= i %></option>
                                <% } %>
                            </select>
                        </form>
                    </td>
                    <td>
                        <form action="remove-cart" method="post">
                            <input type="hidden" name="id" value="<%= item.getId() %>">
                            <button type="submit">Remove</button>
                        </form>
                    </td>
                </tr>
                <%
                            total += item.getPrice() * item.getQuantity();
                        }
                        session.setAttribute("total", total);
                %>
                <tr>
                    <td><strong>Total</strong></td>
                    <td><strong>Rs. <%= total %></strong></td>
                    <td></td>
                    <td></td>
                </tr>
                <%
                    } else {
                %>
                <tr>
                    <td colspan="4">Your cart is empty.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div id="delivery">
        <a href="Welcome.jsp" class="btn">Continue Shopping</a>
        <h3 align="right"><a href="delivery.jsp" class="btn">Take Delivery...(^_^)</a></h3>
        </div>
    </div>

    <footer>
        <div class="container">
            <p>Designed and Developed by Fizul Risam S</p>
        </div>
    </footer>
</body>
</html>
