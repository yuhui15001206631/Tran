<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div class="row">
        <div class="col-lg-4 col-lg-offset-2">
            <h5>共${pageInfo.total}条记录 共${pageInfo.pages}页</h5>
        </div>
        <div class="col-lg-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li <c:if test="${pageInfo.isFirstPage}">class="disabled"</c:if>>
                        <c:if test="${pageInfo.isFirstPage}">
                                <span aria-hidden="true">首页</span>
                        </c:if>
                        <c:if test="${pageInfo.isFirstPage==false}">
                            <a href="#" aria-label="Previous" no="1">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </c:if>
                    </li>
                    <li <c:if test="${pageInfo.hasPreviousPage==false}">class="disabled" </c:if>>
                        <a href="#" aria-label="Previous" no="${pageInfo.prePage}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="no">
                        <li <c:if test="${no==pageInfo.pageNum}">class="active"</c:if>>
                            <a no="${no}">${no}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a href="#" aria-label="Next" no="${pageInfo.nextPage}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" aria-label="Previous" no="${pageInfo.pages}">
                            <span aria-hidden="true">末页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
</div>