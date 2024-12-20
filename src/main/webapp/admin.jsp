<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.jdbi.v3.core.Jdbi" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/imgs/admin/favicon-32x32.png" type="image/png">

    <!-- Frameworks -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet" />

    <!-- CSS native -->
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/admin.css">
</head>

<body>
    <div class="container--admin">

        <aside>
            <div class="top">
                <div class="logo">
                    <!-- <img src="./assets/imgs/admin/logoadmin.jpg" alt="Logo" /> -->
                    <h2>LASMANATE</h2>
                </div>
                <div class="close" id="close-btn">
                    <span class="material-icons-sharp"> close </span>
                </div>
            </div>

            <div class="sidebar">
                <a class="active" href="#" onclick="showMain(event, 'dashboard')">
                    <span class="material-icons-sharp"> dashboard </span>
                    <h3>Bảng thông tin</h3>
                </a>

                <a href="#" onclick="showMain(event, 'manager_orders')">
                    <span class="material-icons-sharp"> receipt_long </span>
                    <h3>Đơn hàng</h3>
                </a>
                <a href="#" onclick="showMain(event, 'manager_users')">
                    <span class="material-icons-sharp"> person_outline </span>
                    <h3>Người dùng</h3>
                </a>
                <a href="" onclick="showMain(event, 'add_user')">
                    <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Người Dùng</h3>
                </a>
                <a href="#" onclick="showMain(event, 'manager_products')">
                    <span class="material-icons-sharp"> inventory </span>
                    <h3>Sản phẩm</h3>
                </a>
                <a href="" onclick="showMain(event, 'add_product')">
                    <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Sản Phẩm</h3>
                </a>
                <a href="#" onclick="showMain(event, 'manager_others')">
                    <span class="material-icons-sharp"> inventory </span>
                    <h3>Khác</h3>
                </a>
                <a href="" onclick="showMain(event, 'add_others')">
                    <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Khác</h3>
                </a>
                <a href="#">
                    <span class="material-icons-sharp"> settings </span>
                    <h3>Settings</h3>
                </a>
                <a href="user.html">
                    <span class="material-icons-sharp"> logout </span>
                    <h3>Logout</h3>
                </a>
            </div>
        </aside>

        <!--------------------------------------------------------
---------------------------------------------------------
 
                       Manager Info
 
---------------------------------------------------------
---------------------------------------------------------->
        <main id="dashboard">
            <h1>Bảng Thông Tin</h1>

            <div class="dash-top">


                <div class="date">
                    <input type="date" />
                </div>

                <div class="search-card">
                    <form id="search-form">
                        <div class="search-group">
                            <input type="text" id="search-input" name="search" placeholder="Nhập từ khóa..." required>
                            <button type="submit" class="search-button">
                                <span class="material-icons-sharp">search</span>
                            </button>
                        </div>
                    </form>
                </div>

            </div>
            <div class="insights">
                <!-- SALES -->
                <div class="sales">
                    <span class="material-icons-sharp"> analytics </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Doanh Thu</h3>
                            <h1>2500VND</h1>

                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>81%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- EXPENSES -->
                <div class="expenses">
                    <span class="material-icons-sharp"> bar_chart </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Chi Phí</h3>
                            <h1>1000VND</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>62%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- INCOME -->
                <div class="income">
                    <span class="material-icons-sharp"> stacked_line_chart </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Lợi Nhuận</h3>
                            <h1>1500VND</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>44%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>
            </div>

            <div class="recent-orders">
                <h2>Đơn Hàng Gần Đây</h2>
                <table id="recent-orders--table">
                    <thead>
                        <tr>
                            <th>Mã Đơn Hàng</th>
                            <th>Khách Hàng</th>
                            <th>SDT</th>
                            <th>Địa Chỉ</th>
                            <th>Ngày Tạo</th>
                            <th>Tổng Tiền</th>
                            <th>Thanh Toán</th>
                            <th>Trạng Thái</th>
                        </tr>
                    </thead>
                    <!-- Add tbody here | JS insertion -->
                </table>
                <a href="#">Show All</a>
            </div>

            <!-- product-order--details -->
            <div class="overlay">
                <div class="recent-orders popup">
                    <span onclick="hideOverlay(event)" class="material-icons-sharp close"> close </span>
                    <h2>Chi Tiết Đơn Hàng</h2>
                    <table id="orders-details--table">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Mã Sản Phẩm</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Size</th>
                                <th>Màu</th>
                                <th>Số Lượng</th>
                                <th>Đơn Giá</th>
                            </tr>
                        </thead>
                        <!-- Add tbody here | JS insertion -->
                    </table>
                    <a href="#">Show All</a>
                </div>
            </div>
        </main>


        <!--------------------------------------------------------
---------------------------------------------------------
 
                       Manager Orders
---------------------------------------------------------
---------------------------------------------------------->
        <main id="manager_orders">
            <h1>Quản lý đơn hàng</h1>

            <div class="dash-top">


                <div class="date">
                    <input type="date" />
                </div>

                <div class="search-card">
                    <form id="search-form">
                        <div class="search-group">
                            <input type="text" id="search-input" name="search" placeholder="Nhập từ khóa..." required>
                            <button type="submit" class="search-button">
                                <span class="material-icons-sharp">search</span>
                            </button>
                        </div>
                    </form>
                </div>

            </div>


            <div class="insights">
                <!-- SALES -->
                <div class="sales">
                    <span class="material-icons-sharp"> receipt_long </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Đơn Hàng</h3>
                            <h1>2500</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>81%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- EXPENSES -->
                <div class="expenses">
                    <span class="material-icons-sharp"> price_check </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Số Đơn Hàng Thành Công</h3>
                            <h1>1000</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>62%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- INCOME -->
                <div class="income">
                    <span class="material-icons-sharp"> unpublished </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Số Đơn Hàng Thất Bại</h3>
                            <h1>1500</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>44%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>
            </div>

            <div class="recent-orders">
                <h2>Danh Sách Đơn Hàng</h2>
                <table id="orders--table">
                    <thead>
                        <tr>
                            <th>Mã Đơn Hàng</th>
                            <th>Khách Hàng</th>
                            <th>SDT</th>
                            <th>Địa Chỉ</th>
                            <th>Ngày Tạo</th>
                            <th>Tổng Tiền</th>
                            <th>Thanh Toán</th>
                            <th>Trạng Thái</th>
                        </tr>
                    </thead>
                    <!-- Add tbody here | JS insertion -->
                </table>
                <a href="#">Show All</a>
            </div>

            <!-- product-order--details -->
            <div class="overlay">
                <div class="recent-orders popup">
                    <span onclick="hideOverlay(event)" class="material-icons-sharp close"> close </span>
                    <h2>Chi Tiết Đơn Hàng</h2>
                    <table id="orders-details--table">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Mã Sản Phẩm</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Size</th>
                                <th>Màu</th>
                                <th>Số Lượng</th>
                                <th>Đơn Giá</th>
                            </tr>
                        </thead>
                        <!-- Add tbody here | JS insertion -->
                    </table>
                    <a href="#">Show All</a>
                </div>
            </div>
        </main>

        <!--------------------------------------------------------
---------------------------------------------------------
 
                       Manager User  
 
---------------------------------------------------------
---------------------------------------------------------->

        <main id="manager_users">
            <h1>Quản lý người dùng</h1>
            <div class="dash-top">


                <div class="date">
                    <input type="date" />
                </div>

                <div class="search-card">
                    <form id="search-form">
                        <div class="search-group">
                            <input type="text" id="search-input" name="search" placeholder="Nhập từ khóa..." required>
                            <button type="submit" class="search-button">
                                <span class="material-icons-sharp">search</span>
                            </button>
                        </div>
                    </form>
                </div>

            </div>


            <div class="insights">
                <!-- Tổng khách hàng -->
                <div class="sales">
                    <span class="material-icons-sharp">
                        group
                    </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Người Dùng</h3>
                            <h1>10000</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>81%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- Khách hàng online -->
                <div class="expenses" style="opacity: 0;">
                    <span class="material-icons-sharp"> person </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Người Dùng online</h3>
                            <h1>1000</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>62%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- Khách hàng online -->
                <div class="expenses" style="opacity: 0;">
                    <span class="material-icons-sharp"> person </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Người Dùng online</h3>
                            <h1>1000</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>62%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>
            </div>



            <div class="recent-orders">
                <h2>Danh Sách Người Dùng</h2>
                <table id="users--table">
                    <thead>
                        <tr>
                            <th>Mã Nguời Dùng</th>
                            <th>Tên Người Dùng</th>
                            <th>Số Điện Thoại</th>
                            <th>Địa Chỉ</th>
                            <th>Email</th>
                            <th>Quyền</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <!-- Add tbody here | JS insertion -->
                </table>
                <a href="#">Show All</a>
            </div>

            <!-- edit users -->
            <div class="overlay">
                <div class="recent-orders popup">
                    <span onclick="hideOverlay(event)" class="material-icons-sharp close"> close </span>
                    <h2>Chỉnh Sửa Người Dùng</h2>
                    <table id="user_edit--table">
                        <thead>
                            <tr>
                                <th>Mã Nguời Dùng</th>
                                <th>Tên Người Dùng</th>
                                <th>Số Điện Thoại</th>
                                <th>Địa Chỉ</th>
                                <th>Email</th>
                                <th>Quyền</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <!-- Add tbody here | JS insertion -->
                    </table>
                    <a href="#">Show All</a>
                </div>
            </div>
        </main>

        <!--------------------------------------------------------
---------------------------------------------------------
 
                       Manager Products 
 
---------------------------------------------------------
---------------------------------------------------------->
        <main id="manager_products">
            <h1>Quản lý sản phẩm</h1>

            <div class="dash-top">


                <div class="date">
                    <input type="date" />
                </div>

                <div class="search-card">
                    <form id="search-form">
                        <div class="search-group">
                            <input type="text" id="search-input" name="search" placeholder="Nhập từ khóa..." required>
                            <button type="submit" class="search-button">
                                <span class="material-icons-sharp">search</span>
                            </button>
                        </div>
                    </form>
                </div>

            </div>


            <div class="insights">
                <!-- SALES -->
                <div class="sales">
                    <span class="material-icons-sharp"> inventory </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Sản Phẩm</h3>
                            <h1>2500</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>81%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- EXPENSES -->
                <div class="expenses" style="opacity: 0;">
                    <span class="material-icons-sharp"> bar_chart </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Chi Phí</h3>
                            <h1>1000VND</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>62%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>

                <!-- INCOME -->
                <div class="income" style="opacity: 0;">
                    <span class="material-icons-sharp"> stacked_line_chart </span>
                    <div class="middle">
                        <div class="left">
                            <h3>Tổng Lợi Nhuận</h3>
                            <h1>1500VND</h1>
                        </div>
                        <div class="progress">
                            <svg>
                                <circle cx="38" cy="38" r="36"></circle>
                            </svg>
                            <div class="number">
                                <p>44%</p>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted"> Last 24 hours </small>
                </div>
            </div>

            <div class="recent-orders">
                <h2>Danh Sách Sản Phẩm</h2>
                <table id="product--table">
                    <thead>
                        <tr>
                            <th>Mã Sản Phẩm</th>
                            <th>Danh Mục</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Ảnh Sản Phẩm</th>
                            <th>Giá Tiền</th>
                            <th>Size</th>
                            <th>Màu</th>
                            <th>Số Lượng</th>
                            <th>Ngày Nhập Kho</th>
                            <th>Tháo Tác</th>
                        </tr>
                    </thead>
                    <!-- Add tbody here | JS insertion -->
                </table>
                <a href="#">Show All</a>
            </div>

            <!-- edit products -->
            <div class="overlay">
                <div class="recent-orders popup">
                    <span onclick="hideOverlay(event)" class="material-icons-sharp close"> close </span>
                    <h2>Chỉnh Sửa Sản Phẩm</h2>
                    <table id="product_edit--table">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Danh Mục</th>
                                <th>Tên</th>
                                <th>Ảnh</th>
                                <th>Giá</th>
                                <th>Size</th>
                                <th>Màu</th>
                                <th>Số Lượng</th>
                                <th>Ngày Nhập Kho</th>
                                <th>Tháo Tác</th>
                            </tr>
                        </thead>
                        <!-- Add tbody here | JS insertion -->
                    </table>
                    <a href="#">Show All</a>
                </div>
            </div>
        </main>

        <!--------------------------------------------------------
---------------------------------------------------------
 
                       Manager Others
 
---------------------------------------------------------
---------------------------------------------------------->
        <main id="manager_others">
            <h1>Quản lý sản phẩm</h1>

            <div class="dash-top">


                <div class="date">
                    <input type="date" />
                </div>

                <div class="search-card">
                    <form id="search-form">
                        <div class="search-group">
                            <input type="text" id="search-input" name="search" placeholder="Nhập từ khóa..." required>
                            <button type="submit" class="search-button">
                                <span class="material-icons-sharp">search</span>
                            </button>
                        </div>
                    </form>
                </div>

            </div>


            <div class="recent-orders">
                <h2>Chương Trình Giảm Giá.</h2>
                <table id="sales--table">
                    <thead>
                        <tr>
                            <th>Mã</th>
                            <th>Tên</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày kết thúc</th>
                            <th>Mô tả</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <!-- Add tbody here | JS insertion -->
                </table>
                <a href="#">Show All</a>
            </div>




            <div class="recent-orders">
                <h2>Bộ sưu tầm.</h2>
                <table id="collections--table">
                    <thead>
                        <tr>
                            <th>Mã</th>
                            <th>Tên</th>
                            <th>Ngày bắt đầu</th>
                            <th>Mô tả</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <!-- Add tbody here | JS insertion -->
                </table>
                <a href="#">Show All</a>
            </div>

            <!-- edit others -->
            <div class="overlay">
                <div class="recent-orders popup" style="top: -20rem;">
                    <span onclick="hideOverlay(event)" class="material-icons-sharp close"> close </span>
                    <h2>Chỉnh Sửa Chương Trình Giảm Giá</h2>
                    <table id="sale_edit--table">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Mô tả</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <!-- Add tbody here | JS insertion -->
                    </table>
                    <h2 style="margin-top: 1rem;">Chỉnh Sửa Bộ Sưu Tập</h2>
                    <table id="collection_edit--table">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>Ngày bắt đầu</th>
                                <th>Mô tả</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <!-- Add tbody here | JS insertion -->
                    </table>
                    <a href="#">Show All</a>
                </div>
            </div>
        </main>


        <!------------------------------------ Add Product ------------------------------------>
        <main id="add_product">
            <h1>Thêm sản phẩm</h1>
            <form id="add-product-form">
                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-name">Tên Sản Phẩm</label>
                        <input type="text" id="product-name" name="product-name" placeholder="Nhập tên sản phẩm."
                            required>
                    </div>
                    <div class="form-group--items">
                        <label for="product-category">Danh Mục</label>
                        <input type="text" id="product-category" name="product-category"
                            placeholder="Nhập tên danh mục." required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-brand">Thương Hiệu</label>
                        <input type="text" id="product-brand" name="product-brand" placeholder="Nhập tên hãng."
                            required>
                    </div>
                    <div class="form-group--items">
                        <label for="product-style">Loại</label>
                        <input type="text" id="product-style" name="product-style" placeholder="Nhập tên loại."
                            required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-price">Giá</label>
                        <input type="number" id="product-price" name="product-price" placeholder="Nhập giá sản phẩm."
                            required>
                    </div>
                    <div class="form-group--items">
                        <label for="product-discount">Giảm Giá</label>
                        <input type="text" id="product-discount" name="product-discount"
                            placeholder="Nhập phần trăm giảm." required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-size">Kích Cỡ</label>
                        <input type="text" id="product-size" name="product-size" placeholder="Nhập kích thước."
                            required>
                    </div>
                    <div class="form-group--items"> <label for="product-color">Màu Sắc</label>
                        <input type="text" id="product-color" name="product-color" placeholder="Nhập màu sắc." required>
                    </div>
                </div>


                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-material">Chất Liệu</label>
                        <input type="text" id="product-material" name="product-material"
                            placeholder="Nhập chất liệu sản phẩm" required>
                    </div>
                    <div class="form-group--items">
                        <label for="product-amount">Số Lượng</label>
                        <input type="number" id="product-amount" name="product-amount"
                            placeholder="Nhập số lượng sản phẩm" required>
                    </div>

                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-stock-in-date">Ngày Nhập Kho</label>
                        <input type="date" id="product-stock-in-date" name="product-stock-in-date" required>
                    </div>
                    <div action="/upload" method="post" enctype="multipart/form-data" class="form-group--items"
                        style="position: relative;">
                        <label for="product-image">Chọn Ảnh</label>
                        <input type="file" style="z-index: 100;" id="product-image" name="product-image"
                            accept="image/*" placeholder="Tải têp.">
                        <input type="text" id="product-img" name="product-img" placeholder="Tải ảnh lên." required
                            style="position: absolute; top: 42%;">
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="product-decription">Mô Tả</label>
                        <!-- <input type="text" id="product-decriptione" name="product-decription" placeholder="Nhập mô tả."
                            required> -->
                        <textarea rows="5" type="text" name="product-decription" id="product-decriptione"
                            placeholder="Nhập mô tả."></textarea>
                    </div>
                </div>



                <button type="submit" class="btn-primary"> <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Sản Phẩm</h3>
                </button>
            </form>
        </main>

        <!------------------------------------ Add User ------------------------------------>
        <main id="add_user">
            <h1>Thêm Người Dùng</h1>
            <form id="add-product-form">
                <div class="form-group">
                    <div class="form-group--items">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập." required>
                    </div>
                    <div class="form-group--items">
                        <label for="role-id">ID Vai Trò</label>
                        <input type="text" id="role-id" name="role-id" placeholder="Nhập ID vai trò." required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="firstname">Họ</label>
                        <input type="text" id="firstname" name="firstname" placeholder="Nhập họ." required>
                    </div>
                    <div class="form-group--items">
                        <label for="lastname">Tên</label>
                        <input type="text" id="lastname" name="lastname" placeholder="Nhập tên." required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Nhập email." required>
                    </div>
                    <div action="/upload" method="post" enctype="multipart/form-data" class="form-group--items"
                        style="position: relative;">
                        <label for="product-image">Chọn Ảnh</label>
                        <input type="file" style="z-index: 100;" id="product-image" name="product-image"
                            accept="image/*" placeholder="Tải têp.">
                        <input type="text" id="product-img" name="product-img" placeholder="Tải ảnh lên." required
                            style="position: absolute; top: 42%;">
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="password">Mật Khẩu</label>
                        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu." required>
                    </div>
                    <div class="form-group--items">
                        <label for="address">Địa Chỉ</label>
                        <input type="text" id="address" name="address" placeholder="Nhập địa chỉ." required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="phone">Số Điện Thoại</label>
                        <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại." required>
                    </div>
                    <div class="form-group--items">
                        <label for="status">Trạng Thái</label>
                        <select id="status" name="status" required>
                            <option value="1">Hoạt Động</option>
                            <option value="0">Không Hoạt Động</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn-primary">
                    <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Người Dùng</h3>
                </button>
            </form>
        </main>

        <!------------------------------------ Add Others ------------------------------------>
        <main id="add_others">
            <!------------------------------------ Add Collections ------------------------------------>
            <h1>Thêm Bộ Sưu Tập</h1>
            <form id="add-product-form" action="/add-collection" method="POST">
                <div class="form-group">
                    <div class="form-group--items">
                        <label for="collections_name">Tên Bộ Sưu Tập</label>
                        <input type="text" id="collections_name" name="collections_name"
                            placeholder="Nhập tên bộ sưu tập." required>
                    </div>
                    <div class="form-group--items">
                        <label for="start_date">Ngày Bắt Đầu</label>
                        <input type="date" id="start_date" name="start_date" required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="collections_description">Mô Tả Bộ Sưu Tập</label>
                        <textarea id="collections_description" name="collections_description"
                            placeholder="Nhập mô tả bộ sưu tập." required></textarea>
                    </div>
                </div>

                <button type="submit" class="btn-primary">
                    <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Bộ Sưu Tập</h3>
                </button>
            </form>

            <!------------------------------------ Add Sales ------------------------------------>
            <h1>Thêm Chương Trình Khuyến Mãi</h1>
            <form id="add-product-form" action="/add-sales" method="POST">
                <div class="form-group">
                    <div class="form-group--items">
                        <label for="sales_name">Tên Chương Trình</label>
                        <input type="text" id="sales_name" name="sales_name" placeholder="Nhập tên chương trình."
                            required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="start_date">Ngày Bắt Đầu</label>
                        <input type="date" id="start_date" name="start_date" required>
                    </div>
                    <div class="form-group--items">
                        <label for="end_date">Ngày Kết Thúc</label>
                        <input type="date" id="end_date" name="end_date" required>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="sales_description">Mô Tả Chương Trình</label>
                        <textarea id="sales_description" name="sales_description" placeholder="Nhập mô tả chương trình."
                            required></textarea>
                    </div>
                </div>


                <button type="submit" class="btn-primary">
                    <span class="material-icons-sharp"> add </span>
                    <h3>Thêm Chương Trình Khuyến Mãi</h3>
                </button>
            </form>

            <!-- Gui thong bao -->
            <h1>Gửi Thông Báo</h1>
            <form id="add-product-form">
                <div class="form-group">
                    <div class="form-group--items">
                        <label for="notification-date">Ngày Thông Báo</label>
                        <input type="datetime-local" id="notification-date" name="notification-date" required>
                    </div>
                    <div class="form-group--items">
                        <label for="is-read">Trạng Thái Đọc</label>
                        <select id="is-read" name="is-read" required>
                            <option value="0">Chưa Đọc</option>
                            <option value="1">Đã Đọc</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group--items">
                        <label for="message">Nội Dung Thông Báo</label>
                        <textarea id="message" name="message" placeholder="Nhập nội dung thông báo."
                            required></textarea>
                    </div>
                </div>

                <button type="submit" class="btn-primary">
                    <span class="material-icons-sharp"> send </span>
                    <h3>Gửi Thông Báo</h3>
                </button>
            </form>
        </main>



        <div class="right">
            <div class="top">
                <button id="menu-btn">
                    <span class="material-icons-sharp"> menu </span>
                </button>
                <div class="theme-toggler">
                    <span class="material-icons-sharp active"> light_mode </span>
                    <span class="material-icons-sharp"> dark_mode </span>
                </div>
                <div class="profile">
                    <div class="info">
                        <p>Hey, <b>ManhDZ</b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                    <div class="profile-photo">
                        <img src="assets/imgs/admin/logoadmin.jpg" alt="Profile Picture" />
                    </div>
                </div>
            </div>

            <div class="recent-updates">
                <h2>Cập Nhập Gần Đây</h2>
                <!-- Add updates div here | JS insertion -->
            </div>

            <div class="sales-analytics">
                <h2>Phân tích bán hàng</h2>
                <div id="analytics">
                    <!-- Add items div here | JS insertion -->
                </div>
                <!-- <div class="item add-product">
                    <div>
                        <span class="material-icons-sharp"> add </span>
                        <h3>Thêm Sản Phẩm</h3>
                    </div>
                </div> -->
            </div>
        </div>
    </div>

    <script src="./assets/js/admin-data/recent-order-data.js"></script>
    <script src="./assets/js/admin-data/sales-analytics-data.js"></script>
    <script src="./assets/js/admin-data/update-data.js"></script>
    <script src="./assets/js/admin-data/user-data.js"></script>
    <script src="./assets/js/admin-data/product-data.js"></script>
    <script src="./assets/js/admin-data/order-data.js"></script>
    <script src="./assets/js/admin-data/order-details-data.js"></script>
    <script src="./assets/js/admin-data/others-data.js"></script>
    <script src="./assets/js/admin.js"></script>

</body>

</html>