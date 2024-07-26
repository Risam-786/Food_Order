<%@ page import="java.util.*, java.sql.*" %>
<%@ page import="com.FoodItemDAO" %>
<%@ page import="com.FoodItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Food</title>
    <link rel="stylesheet" href="add.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- Including necessary styles for the navbar -->
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

        /* Add New Food Form */
        form {
            margin: 20px 0;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #f4511e;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #333;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #f4511e;
            color: white;
        }

        td img {
            width: 100px;
            height: 100px;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        footer p {
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="container">
                <div class="logo">
                    <a href="Welcome1.jsp" class="logo-link">FOODY</a>
                </div>
                <div class="navbar-search">
                    <form>
                        <input type="search" placeholder="Search">
                        <button type="submit"><box-icon name='search' color='#ffffff'></box-icon></button>
                    </form>
                </div>
                <ul class="nav-links">
                    <li><a href="Welcome1.jsp#hero">Home</a></li>
                    <li><a href="Welcome1.jsp#menu">Menu</a></li>
                    <li><a href="admin.html">Log Out</a></li>
                    <li><a href="addnew.jsp">Add New</a></li>
                    <li><a href="cart.jsp"><box-icon name='cart' color='white' size='30px'></box-icon></a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main>
        <h1>Add New Food</h1>
        <form action="AddNewProductServlet" method="post" enctype="multipart/form-data">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" ><br>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required><br>

            <label for="quantity">Quantity:</label>
            <input type="text" id="quantity" name="quantity" required><br>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" required><br>

            <input type="submit" value="Add Product">
        </form>

        <h1>Current Food Details</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Image URL</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodOrderDB", "root", "root");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM food_items");

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            double price = rs.getDouble("price");
                            int quantity = rs.getInt("quantity");
                            String imageUrl = rs.getString("image_url");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td>Rs. <%= price %></td>
                    <td><%= quantity %></td>
                    <td><img src="<%= imageUrl %>" alt="<%= name %>" width="100" height="100"></td>
                </tr>
                <%
                        }
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </main>

    <footer>
        <div class="container">
            <p>Designed and Developed by Fizul Risam S</p>
        </div>
    </footer>
</body>
</html>
