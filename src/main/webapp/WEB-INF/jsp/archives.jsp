<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html class="theme-next mist use-motion">
<head>
	<%@ include file="template/top.html"%>
	<title> 归档 | Ethan's Blog </title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

<div class="container one-collumn sidebar-position-left  page-archive  ">

	<%@ include file="template/header.html"%>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">
                    <section id="posts" class="posts-collapse">
                    
                        <span class="archive-move-on"></span>

    					<span class="archive-page-counter">好! 目前共计 ${articletotal } 篇日志。 继续努力。</span>

						<c:forEach var="year" items="${years}" varStatus="status1"> 
							<div class="collection-title">
							  <h2 class="archive-year motion-element" id="archive-year-${year }">${year }</h2>
							</div>
							<c:forEach var="article" items="${articles}" varStatus="status2"> 
								<c:choose>
								<c:when test="${fn:substring(article.time,0,4) eq year}">
									<article class="post post-type-normal" itemscope itemtype="http://schema.org/Article">
									    <header class="post-header">
									        <h1 class="post-title">
									            <a class="post-title-link" href="/blog/id/${article.url }" itemprop="url">
									                <span itemprop="name">${article.title }</span>
									            </a>
									        </h1>
									        <div class="post-meta">
									            <time class="post-time" itemprop="dateCreated"
									                  content=${article.time } >
									                ${fn:substring(article.time,5,10)}
									            </time>
									        </div>
									    </header>
									</article>
								</c:when>
								</c:choose>
							</c:forEach> 
						</c:forEach>
					</section>
          		</div>
			</div>

		<%@ include file="template/sidebar.html"%>

        </div>
    </main>

	<%@ include file="template/footer.html"%>

</div>

<%@ include file="template/bottom.html"%>

<script type="text/javascript" id="motion.page.archive">
    $('.archive-year').velocity('transition.slideLeftIn');
</script>

</body>
</html>
