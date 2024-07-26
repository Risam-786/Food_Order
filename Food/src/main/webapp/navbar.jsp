<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

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
</style>

<header>
    <nav class="navbar">
        <div class="container">
            <div class="logo">
                <a href="Welcome.jsp" class="logo-link">FOODY</a>
            </div>
            <div class="navbar-search">
                <form>
                    <input type="search" placeholder="Search">
                    <button type="submit"><box-icon name='search' color='#ffffff'></box-icon></button>
                </form>
            </div>
            <ul class="nav-links">
                <li><a href="Welcome.jsp">Home</a></li>
                <li><a href="Welcome.jsp#menu">Menu</a></li>
                <li><a href="index.html">Login</a></li>
                <li><a href="addnew.jsp">Add New</a></li>
                <li><a href="cart.jsp"><box-icon name='cart' color='white' size='30px'></box-icon></a></li>
            </ul>
        </div>
    </nav>
</header>

<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
