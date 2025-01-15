<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    // Chuyển đổi allProducts thành JSON
    Gson gson = new Gson();
    String jsonProducts = gson.toJson(request.getAttribute("allProducts"));
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="assets/includes/head.jsp"/>
    <title>Đồ nam</title>
    <link rel="stylesheet" href="assets/css/men.css">
    <link rel="stylesheet" href="assets/css/responsive_luat.css">
</head>

<body>
<header id="header">
    <jsp:include page="assets/includes/header.jsp"/>
</header>
<!-- Make a space to split the other out of header -->
<div style="height: 12rem;"></div>

<!-- Banner -->
<section id="section_banner" class="container-fluid p-0">
    <img src="assets/imgs/men/banner/3.jpg" alt="" class="w-100">
</section>

<!-- Featured -->
<section id="section_featured" class="container">
    <div class="row">
        <a href="" class="col-md-3"><img src="assets/imgs/men/featured/2.jpg" alt="" class="w-100"></a>
        <a href="" class="col-md-3"><img src="assets/imgs/men/featured/3.jpg" alt="" class="w-100"></a>
        <a href="" class="col-md-3"><img src="assets/imgs/men/featured/4.jpg" alt="" class="w-100"></a>
        <a href="" class="col-md-3"><img src="assets/imgs/men/featured/5.jpg" alt="" class="w-100"></a>
    </div>
</section>

<!-- All products -->
<section id="section_all_products">
    <!-- Top -->
    <div class="container-fluid" style="border-bottom: solid 1px #000;    height: 5rem;">
        <div class="top">
            <div class="filter">
                <h2>Lọc sản phẩm</h2>
                <i class="fa-solid fa-filter custom_icon"></i>
            </div>
            <h1>Tất cả sản phẩm</h1>
        </div>
    </div>
    <!-- Bottom -->
    <div class="container-fluid">
        <div class="bottom">
            <!-- Filter -->
            <form action="productFilter" method="get" class="filter">
                <!-- Loại Sản Phẩm -->
                <div id="filter-category">
                    <h4>Loại Sản Phẩm <span class="arrow"><i
                            class="fa-solid fa-chevron-down custom_icon"></i></span></h4>
                    <div class="filter-content">
                        <label><input type="checkbox" name="type" value="Áo"> Áo</label>
                        <label><input type="checkbox" name="type" value="Quần"> Quần</label>
                    </div>
                </div>

                <!-- Kích Thước -->
                <div id="filter-size">
                    <h4>Kích Thước <span class="arrow"><i class="fa-solid fa-chevron-down custom_icon"></i></span>
                    </h4>
                    <div class="filter-content">
                        <label><input type="checkbox" name="size" value="S"> S</label>
                        <label><input type="checkbox" name="size" value="M"> M</label>
                        <label><input type="checkbox" name="size" value="L"> L</label>
                        <label><input type="checkbox" name="size" value="XL"> XL</label>
                        <label><input type="checkbox" name="size" value="XXL"> XXL</label>
                        <label><input type="checkbox" name="size" value="3XL"> 3XL</label>
                        <label><input type="checkbox" name="size" value="4XL"> 4XL</label>
                    </div>
                </div>

                <!-- Giá -->
                <div id="filter-price">
                    <h4>Giá <span class="arrow"><i class="fa-solid fa-chevron-down custom_icon"></i></span></h4>
                    <div class="filter-content">
                        <input type="number" name="price-min" placeholder="Giá tối thiểu">
                        <input type="number" name="price-max" placeholder="Giá tối đa">
                        <select name="sortPrice" class="form-control">
                            <option value="">sắp xếp theo giá</option>
                            <option value="asc">Tăng dần</option>
                            <option value="desc">Giảm dần</option>
                        </select>
                    </div>
                </div>

                <input type="hidden" name="category" value="${category}">
                <!-- Button Submit -->
                <div class="filter-submit">
                    <button type="submit" class="btn btn-primary btn-block">Lọc sản phẩm</button>
                </div>
            </form>
            <!-- Right -->
            <div class="list_products">
                <div class="container mt-2">
                    <div class="row">
                        <!-- Product Card 1 -->
                        <c:forEach var="p" items="${allProducts}">
                            <div class="col-md-3 mt-4">
                                <a href="${pageContext.request.contextPath}/productDetail?pid=${p.id}"
                                   class="product-card">
                                    <img src="assets/product-imgs/${p.images[0]}" alt="${p.name}"
                                         class="product-image img-fluid">
                                    <div class="product-title">${p.name}</div>
                                    <div class="product-price" data-price="${p.unitPrice}"></div>
                                </a>
                            </div>
                        </c:forEach>

                        <c:if test="${empty allProducts}">
                            <h2 class="display-4 mt-5 text-center w-100">Không có sản phẩm nào.</h2>
                        </c:if>
                    </div>
                </div>
                <!-- Pagination -->
                <div id="pagination" class="container mt-5">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination custom-pagination justify-content-center">
                            <!-- Previous button -->
                            <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                                <a class="page-link"
                                        href="navController?category=men&page=${currentPage - 1}"
                                        aria-label="Previous"
                                        id="previous-page">
                                    <i class="fa-solid fa-chevron-left"></i>
                                </a>
                            </li>

                            <!-- Page numbers -->
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item <c:if test="${i == currentPage}">active</c:if>">
                                    <a class="page-link"
                                            href="navController?category=men&page=${i}"
                                            type="button"
                                            data-page="${i}">
                                            ${i}
                                    </a>
                                </li>
                            </c:forEach>

                            <!-- Next button -->
                            <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                                <a class="page-link"
                                        href="navController?category=men&page=${currentPage + 1}"
                                        aria-label="Next"
                                        id="next-page">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>
</section>

<footer id="footer">
    <jsp:include page="assets/includes/footer.jsp"/>
</footer>

<jsp:include page="assets/includes/foot.jsp"/>

<!-- Pagination -->
<script>
    <%--$(document).ready(function() {--%>
    <%--    // Lấy danh sách sản phẩm từ request--%>
    <%--    var products = <%= jsonProducts %>;--%>
    <%--    // Chuyển danh sách sản phẩm thành JSON--%>
    <%--    var productsJson = JSON.stringify(products);--%>

    <%--    // Xử lý click vào nút Previous--%>
    <%--    $('#next-page').on('click', function() {--%>
    <%--        var currentPage = ${currentPage};--%>
    <%--        var totalPages = ${totalPages};--%>
    <%--        var pageSize = ${pageSize};--%>
    <%--        var category = "${category}";--%>

    <%--        if (currentPage < totalPages) {--%>
    <%--            // Tạo đối tượng chứa các tham số--%>
    <%--            var requestData = {--%>
    <%--                category: category,--%>
    <%--                page: currentPage + 1,--%>
    <%--                pageSize: pageSize,--%>
    <%--                products: productsJson // Giả sử jsonProducts đã được định nghĩa trong JSP--%>
    <%--            };--%>

    <%--            $.ajax({--%>
    <%--                url: "productPagination",  // Địa chỉ Servlet--%>
    <%--                type: "POST",--%>
    <%--                contentType: "application/json", // Gửi dưới dạng JSON--%>
    <%--                data: JSON.stringify(requestData),  // Gửi dữ liệu JSON chứa thêm thông tin--%>
    <%--                success: function(response) {--%>
    <%--                    alert("Products sent successfully: " + response.status);--%>
    <%--                },--%>
    <%--                error: function(xhr, status, error) {--%>
    <%--                    alert("Error: " + error);--%>
    <%--                }--%>
    <%--            });--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>

    // function changePage() {
    //     $.ajax({
    //         url: "productPagination",  // Địa chỉ Servlet
    //         type: "POST",
    //         contentType: "application/json", // Gửi dưới dạng JSON
    //         data: productsJson,  // Gửi dữ liệu JSON
    //         success: function(response) {
    //             alert("Products sent successfully: " + response.status);
    //         },
    //         error: function(xhr, status, error) {
    //             alert("Error: " + error);
    //         }
    //     });
    // }

    <%--$(document).ready(function () {--%>
    <%--    // Xử lý khi nhấn vào nút Previous--%>
    <%--    $('#previous-page').on('click', function () {--%>
    <%--        const currentPage = parseInt($('#pagination').data('current-page')); // Lấy số trang hiện tại--%>
    <%--        if (currentPage > 1) {--%>
    <%--            const newPage = currentPage - 1;--%>
    <%--            loadPage(newPage);--%>
    <%--        }--%>
    <%--    });--%>

    <%--    // Xử lý khi nhấn vào các nút số trang--%>
    <%--    $('.page-link[data-page]').on('click', function () {--%>
    <%--        const page = $(this).data('page'); // Lấy số trang từ data-page--%>
    <%--        loadPage(page);--%>
    <%--    });--%>

    <%--    // Xử lý khi nhấn vào nút Next--%>
    <%--    $('#next-page').on('click', function () {--%>
    <%--        const currentPage = parseInt($('#pagination').data('current-page'));--%>
    <%--        const totalPages = parseInt($('#pagination').data('total-pages')); // Tổng số trang--%>
    <%--        if (currentPage < totalPages) {--%>
    <%--            const newPage = currentPage + 1;--%>
    <%--            loadPage(newPage);--%>
    <%--        }--%>
    <%--    });--%>

    <%--    // Hàm tải trang--%>
    <%--    function loadPage(page) {--%>
    <%--        var category = "${category}";--%>
    <%--        $.ajax({--%>
    <%--            url: "/WebBanQuanAo/navController",--%>
    <%--            type: "Post",--%>
    <%--            data: {--%>
    <%--              category: category,--%>
    <%--              page: page--%>
    <%--            },--%>
    <%--            success: function (data) {--%>
    <%--                const paginationContainer = document.querySelector('#pagination ul');--%>
    <%--                paginationContainer.innerHTML = '';--%>
    <%--                paginationContainer.innerHTML += data;--%>
    <%--            },--%>
    <%--            error: function (xhr, status, error) {--%>
    <%--                console.error("Lỗi khi gửi yêu cầu:", error);--%>
    <%--            }--%>
    <%--        });--%>
    <%--    }--%>
    <%--});--%>
</script>
</body>

</html>