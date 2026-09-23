# Bookbuddies
# BookBuddies

BookBuddies is a Java web application for buying, selling, and renting books online. Users can browse new and old (second-hand) book listings, add books to a cart, check out, and list their own used books for sale. Admins manage the book catalog and view/process orders.

## Features

**User side**
- Register and log in
- Browse new and recently listed books
- List your own old/used books for sale
- Add books to a cart and check out
- View order history and edit your profile

**Admin side**
- Add, edit, and delete books in the catalog
- View and manage all customer orders

## Tech Stack

- **Backend:** Java, Jakarta Servlets (Jakarta EE 10 / Servlet 6.0)
- **Frontend:** JSP, JSTL, HTML/CSS, Bootstrap
- **Database:** MySQL
- **Build tool:** Maven
- **Server:** Apache Tomcat 10.1+

## Getting Started

### Prerequisites

- JDK 17+
- Apache Maven
- MySQL Server 8.x
- Apache Tomcat 10.1.x (Tomcat 9 and earlier will **not** work — this project uses the `jakarta.servlet` namespace, which requires Tomcat 10.1+)

### 1. Set up the database

```sql
CREATE DATABASE ebook_app;
USE ebook_app;

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phoneNo VARCHAR(20),
  password VARCHAR(100)
);

CREATE TABLE book_details (
  id INT AUTO_INCREMENT PRIMARY KEY,
  bookname VARCHAR(150),
  author VARCHAR(150),
  price VARCHAR(50),
  bookCategory VARCHAR(50),
  status VARCHAR(50),
  photo VARCHAR(255),
  email VARCHAR(100)
);

CREATE TABLE cart (
  cid INT AUTO_INCREMENT PRIMARY KEY,
  bid INT,
  uid INT,
  bookName VARCHAR(150),
  author VARCHAR(150),
  price DOUBLE,
  total_price DOUBLE
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  uid INT,
  user_name VARCHAR(100),
  email VARCHAR(100),
  address VARCHAR(255),
  phoneNo VARCHAR(20),
  book_name VARCHAR(150),
  author VARCHAR(150),
  price VARCHAR(50),
  payment VARCHAR(50)
);
```

### 2. Configure database credentials

By default the app connects to `jdbc:mysql://localhost:3306/ebook_app` with username `root` and password `root`. If your local MySQL setup differs, update the credentials in:

```
src/main/java/com/DB/DBConnect.java
```

### 3. Build and run

**Using Eclipse:**
1. Import as an existing Maven project (`File → Import → Maven → Existing Maven Projects`).
2. Make sure the project's Java build path, compiler compliance, and Dynamic Web Module facet are set to match Java 17 / Servlet 6.0 (Jakarta EE 10).
3. Right-click the project → `Run As → Run on Server`, selecting a Tomcat 10.1 server.

**Using the command line:**
```bash
mvn clean package
```
This produces `target/BookBuddies.war`. Copy it into your Tomcat `webapps/` folder and start Tomcat:
```bash
# Linux/Mac
bin/startup.sh

# Windows
bin\startup.bat
```

### 4. Open the app

Visit `http://localhost:8080/BookBuddies/` in your browser. Admin pages are under `/admin/`.

## Project Structure

```
src/main/java/com/
├── DAO/            # Data access layer (Book, Cart, Order, User)
├── DB/             # Database connection
├── entity/         # Model classes
├── admin/servlet/  # Admin-side servlets
└── user/servlet/   # User-side servlets

src/main/webapp/
├── admin/          # Admin JSP pages
├── all_Components/ # Shared navbar/CSS
├── book/           # Book cover images
├── img/            # Site images
└── *.jsp           # User-facing pages (login, register, cart, checkout, etc.)
```
