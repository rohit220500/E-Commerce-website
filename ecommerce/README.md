# ShopZone - E-Commerce Web Application

A professional Spring MVC e-commerce web application built with Java 17,
deployable on Apache Tomcat.

---

## Tech Stack

| Layer       | Technology                     |
|-------------|-------------------------------|
| Language    | Java 17 (JDK 17)              |
| Framework   | Spring MVC 5.3.x              |
| View        | JSP + JSTL                    |
| Build Tool  | Apache Maven 3.8+             |
| Server      | Apache Tomcat 9.x             |
| CSS/UI      | Bootstrap 5.3 + Bootstrap Icons |

---

## Project Structure

```
shopzone/
├── pom.xml                          ← Maven config (JDK 17, dependencies)
└── src/
    └── main/
        ├── java/com/shopzone/
        │   ├── controller/
        │   │   ├── HomeController.java
        │   │   ├── ProductController.java
        │   │   └── CartController.java
        │   ├── model/
        │   │   ├── Product.java
        │   │   ├── CartItem.java
        │   │   └── Cart.java
        │   └── service/
        │       ├── ProductService.java
        │       └── CartService.java
        └── webapp/
            ├── static/              ← CSS, JS, images
            └── WEB-INF/
                ├── web.xml          ← Servlet config
                ├── spring-mvc.xml   ← Spring config
                └── views/           ← JSP pages
                    ├── header.jsp
                    ├── footer.jsp
                    ├── home.jsp
                    ├── products.jsp
                    ├── product-detail.jsp
                    ├── cart.jsp
                    ├── checkout.jsp
                    └── order-success.jsp
```

---

## Prerequisites — Install These First

### 1. Install JDK 17 (Amazon Linux)
```bash
# Amazon Linux 2023
sudo dnf install java-17-amazon-corretto -y

# Amazon Linux 2
sudo amazon-linux-extras enable corretto17
sudo yum install java-17-amazon-corretto -y

# Verify
java -version
```

### 2. Install Maven
```bash
# Amazon Linux 2023
sudo dnf install maven -y

# Amazon Linux 2
sudo yum install maven -y

# Verify
mvn -version
```

### 3. Install Tomcat 9
```bash
cd /opt
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz
sudo tar -xvf apache-tomcat-9.0.87.tar.gz
sudo mv apache-tomcat-9.0.87 tomcat9
sudo chmod +x /opt/tomcat9/bin/*.sh
```

---

## Build the Project

```bash
# Clone or upload the project to your EC2
cd shopzone

# Build WAR file
mvn clean package

# WAR file will be at:
# target/shopzone.war
```

---

## Deploy to Tomcat

```bash
# Copy WAR to Tomcat webapps
sudo cp target/shopzone.war /opt/tomcat9/webapps/

# Start Tomcat
sudo /opt/tomcat9/bin/startup.sh

# Check logs
tail -f /opt/tomcat9/logs/catalina.out
```

---

## Access the Application

```
http://<YOUR-EC2-PUBLIC-IP>:8080/shopzone/
```

> Make sure port 8080 is open in your EC2 Security Group:
> EC2 → Security Groups → Inbound Rules → Add: TCP 8080, Source: 0.0.0.0/0

---

## Application Pages

| Page           | URL                                    |
|----------------|----------------------------------------|
| Home           | /shopzone/                             |
| All Products   | /shopzone/products                     |
| By Category    | /shopzone/products?category=Laptops    |
| Product Detail | /shopzone/products/{id}                |
| Search         | /shopzone/search?q=iphone              |
| Cart           | /shopzone/cart                         |
| Checkout       | /shopzone/cart/checkout                |
| Order Success  | /shopzone/order-success                |

---

## Features

- Browse 12 premium electronics products
- Filter by category (Smartphones, Laptops, Audio, etc.)
- Search products by name/description
- Product detail page with image, rating, discount
- Add to cart / update quantity / remove items
- Session-based cart (persists during browser session)
- Order summary with shipping calculation
- Checkout page with address & payment form
- Order success page with order ID
- Free shipping on orders above ₹999
- Professional UI with Bootstrap 5

---

## Tomcat Commands

```bash
# Start
sudo /opt/tomcat9/bin/startup.sh

# Stop
sudo /opt/tomcat9/bin/shutdown.sh

# Restart
sudo /opt/tomcat9/bin/shutdown.sh && sudo /opt/tomcat9/bin/startup.sh
```

---

## Common Issues

| Issue | Fix |
|-------|-----|
| Port 8080 not accessible | Open port in EC2 Security Group |
| `JAVA_HOME not set` | `export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))` |
| 404 on all pages | Check WAR deployed correctly in webapps/ |
| JSP not rendering | Ensure Tomcat 9.x is used (not 10+) — JSTL namespace differs |
