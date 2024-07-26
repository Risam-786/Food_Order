<%@ page import="com.FoodItemDAO, com.FoodItem, com.Cart" %>
<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Food Order</title>
    <link rel="stylesheet" href="Welcome.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

<header>
    <nav class="navbar">
        <div class="container">
            <div class="logo">
                <a href="Welcome.jsp" class="logo-link">FOODY</a>
            </div>
            <div class="navbar-search">
                <form>
                    <input type="search" id="search-input" placeholder="Search" onkeyup="searchItems()">
                    <button type="button" onclick="searchItems()"><box-icon name='search' color='#ffffff'></box-icon></button>
                </form>
                <ul id="suggestions" class="suggestions-list"></ul>
            </div>
            <ul class="nav-links">
                <li><a href="#hero">Home</a></li>
                <li class="dropdown">
                    <a href="#menu" class="dropbtn">Menu</a>
                    <div class="dropdown-content">
                        <a href="#veg-menu">Veg</a>
                        <a href="#nonveg-menu">Non-Veg</a>
                        <a href="#drinks-menu">Drinks</a>
                    </div>
                </li>
                <li><a href="index.html">Log Out</a></li>
                <li><a href="cart.jsp"><box-icon name='cart' color='white' size='30px'></box-icon></a></li>
            </ul>
        </div>
    </nav>
</header>

<main>
    <section class="hero" id="hero">
        <div class="hero-content">
            <h1>Welcome to Foody</h1>
            <p>Eat Fresh. Stay Healthy.</p>
        </div>
    </section>

    <section class="menu" id="menu">
        <h1 align="center"><strong>Popular Dishes</strong></h1>
        <div class="container">
            <div class="menu-items">
                <% 
                    FoodItemDAO foodDao = new FoodItemDAO();
                    List<FoodItem> popularItems = foodDao.getPopularFoodItems();

                    for (FoodItem item : popularItems) { 
                %>
                <div class="menu-item">
                    <h2><%= item.getName() %></h2>
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>">
                    <p>Rs. <%= item.getPrice() %></p>
                    <a href="CartServlet?id=<%= item.getId() %>" class="btn-add-to-cart">Add to cart</a>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <section class="menu" id="veg-menu">
        <h1 align="center"><strong>Veg Dishes</strong></h1>
        <div class="container">
            <div class="menu-items">
                <% 
                    List<FoodItem> vegItems = foodDao.getVegFoodItems();
                    for (FoodItem item : vegItems) { 
                %>
                <div class="menu-item">
                    <h2><%= item.getName() %></h2>
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>">
                    <p>Rs. <%= item.getPrice() %></p>
                    <a href="CartServlet?id=<%= item.getId() %>" class="btn-add-to-cart">Add to cart</a>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <section class="menu" id="nonveg-menu">
        <h1 align="center"><strong>Non-Veg Dishes</strong></h1>
        <div class="container">
            <div class="menu-items">
                <% 
                    List<FoodItem> nonVegItems = foodDao.getNonVegFoodItems();
                    for (FoodItem item : nonVegItems) { 
                %>
                <div class="menu-item">
                    <h2><%= item.getName() %></h2>
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>">
                    <p>Rs. <%= item.getPrice() %></p>
                    <a href="CartServlet?id=<%= item.getId() %>" class="btn-add-to-cart">Add to cart</a>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <section class="menu" id="drinks-menu">
        <h1 align="center"><strong>Drinks</strong></h1>
        <div class="container">
            <div class="menu-items">
                <% 
                    List<FoodItem> drinksItems = foodDao.getDrinks();
                    for (FoodItem item : drinksItems) { 
                %>
                <div class="menu-item">
                    <h2><%= item.getName() %></h2>
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>">
                    <p>Rs. <%= item.getPrice() %></p>
                    <a href="CartServlet?id=<%= item.getId() %>" class="btn-add-to-cart">Add to cart</a>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <section class="menu" id="all-dishes">
        <h1 align="center"><strong>All Available Dishes</strong></h1>
        <div class="container">
            <div class="menu-items">
                <% 
                    List<FoodItem> items = foodDao.getAllFoodItems();
                    for (FoodItem item : items) { 
                %>
                <div class="menu-item">
                    <h2><%= item.getName() %></h2>
                    <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>">
                    <p>Rs. <%= item.getPrice() %></p>
                    <a href="CartServlet?id=<%= item.getId() %>" class="btn-add-to-cart">Add to cart</a>
                </div>
                <% } %>
            </div>
        </div>
    </section>
</main>

<footer>
    <div class="container">
        <p>Designed and Developed by Fizul Risam S</p>
    </div>
</footer>

<script>
function searchItems() {
    var input, filter, menuItems, item, i, txtValue;
    input = document.getElementById('search-input');
    filter = input.value.toUpperCase();
    menuItems = document.getElementsByClassName('menu-item');
    suggestions = document.getElementById('suggestions');
    
    // Clear previous suggestions
    suggestions.innerHTML = "";

    // Set to keep track of unique product names
    var uniqueNames = new Set();

    for (i = 0; i < menuItems.length; i++) {
        item = menuItems[i];
        txtValue = item.textContent || item.innerText;
        var itemName = item.getElementsByTagName("h2")[0].textContent;
        
        if (txtValue.toUpperCase().indexOf(filter) > -1 && !uniqueNames.has(itemName)) {
            item.style.display = "";

            // Add unique item name to the set
            uniqueNames.add(itemName);
            
            // Add matching item to suggestions list
            var suggestionItem = document.createElement("li");
            suggestionItem.textContent = itemName;
            suggestionItem.onclick = (function(item) {
                return function() {
                    // Scroll to the selected item
                    item.scrollIntoView({behavior: 'smooth'});
                };
            })(item);
            suggestions.appendChild(suggestionItem);
        } else {
            item.style.display = "none";
        }
    }
}
</script>

</body>
</html>
