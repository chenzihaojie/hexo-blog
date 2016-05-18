<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="theme-next mist use-motion">
<head>
	<%@ include file="template/top.html"%>
	<title>分类 | Ethan's Blog</title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

<div class="container one-collumn sidebar-position-left  ">
    
	<%@ include file="template/header.html"%>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">
                    <div id="posts" class="posts-expand">
                        <div class="category-all-page">
                            <div class="category-all-title">
                                目前共计 ${categoryCount } 个分类
                            </div>
                            <div class="category-all">
								<ul class="category-list">
									<c:forEach var="item" items="${cs }" varStatus="status">
										<li class="category-list-item">
											<a class="category-list-link" href="/categories/${item.key }">${item.key }</a>
											<span class="category-list-count">${item.value }</span>
										</li>
									</c:forEach> 
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		<%@ include file="template/sidebar.html"%>
        </div>
    </main>

	<%@ include file="template/footer.html"%>

</div>

<%@ include file="template/bottom.html"%>


<script src="/res/vendors/tags/tagcanvas.js" type="text/javascript"></script>

</body>
</html>
