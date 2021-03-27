<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<%@ include file="head.jsp"%>

<body>

<jsp:include page="navigation.jsp">
    <jsp:param name="title" value="Product"/>
</jsp:include>

<div class="container">
    <div class="row py-2">
        <div class="col-12">
            <!-- TODO добавить переход на форму нового продукта -->
            <c:url value="/product/new" var="productUrl"/>
            <a class="btn btn-primary" href="${productUrl}">Add Product</a>
        </div>

        <div class="col-12">
            <table class="table table-bordered my-2">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>

<%--                <%!--%>
<%--                    private ProductRepository productRepository;--%>

<%--                    @Override--%>
<%--                    public void jspInit() {--%>
<%--                        productRepository = (ProductRepository) getServletContext().getAttribute("productRepository");--%>
<%--                    }--%>
<%--                %>--%>


                <c:choose>
                    <c:when test="${requestScope.products.isEmpty()}">
                        <tr>
                            <td colspan="4">
                                No data
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <%--                <% for (Product product : (List<Product>) request.getAttribute("products")) { %>--%>
                        <c:forEach var="product" items="${requestScope.products}">
                            <tr>
                                <th scope="row">
                                        <%--                        <%= product.getId() %>--%>
                                    <c:out value="${product.id}"/>
                                </th>
                                <td>
                                        <%--                        <%= product.getName() %>--%>
                                    <c:out value="${product.name}"/>
                                </td>
                                <td>
                                        <%--                        <%= product.getDescription() %>--%>
                                    <c:out value="${product.description}"/>
                                </td>
                                <td>
                                    <c:url value="/product/${product.id}" var="productUrl"/>
                                    <a class="btn btn-success" href="${productUrl}"><i class="fas fa-edit"></i></a>

                                    <c:url value="/product/delete/${product.id}" var="productDeleteUrl"/>
                                    <form method="post" action="${productDeleteUrl}" class="d-inline">
                                        <button class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--                <% } %>--%>
                    </c:otherwise>
                </c:choose>

                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="scripts.jsp"%>

</body>
</html>