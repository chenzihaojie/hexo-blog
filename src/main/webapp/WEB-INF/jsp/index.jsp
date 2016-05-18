<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="theme-next mist use-motion">
<head>
	<%@ include file="template/top.html"%>
    <title> Ethan's Blog </title>
    
    <style type="text/css">

    table{
        border: none;
    }

    .posts-expand .post-body img{
        border: none;
    }
    
    .editormd-preview-container, .editormd-html-preview{
        padding: 0;
        font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif;
        font-size:14px;
        line-height: 2;
        color: #555;
    }

    .editormd-preview-container p, .editormd-html-preview p{
        margin: 0 0 25px 0;
    }

    .editormd-html-preview code, .editormd-html-preview pre.prettyprint{
        border: 0;
    }

    .markdown-body{
        display: table;
    }

    .markdown-body table{
        display: block;
    }

    .markdown-body a:hover, .markdown-body a:active{
        text-decoration: none;
    }
</style>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

<div class="container one-collumn sidebar-position-left page-home">

	<%@ include file="template/header.html"%>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">
                    <section id="posts" class="posts-expand">
						<c:forEach var="article" items="${articles}" varStatus="status1"> 
							<c:forEach var="item" items="${ac }" varStatus="status2">
								<c:choose>
									<c:when test="${article.id eq item.key}">
										<article class="post post-type-normal " itemscope itemtype="http://schema.org/Article">
				                            <header class="post-header">
				                                <h1 class="post-title" itemprop="name headline">
				                                    <a class="post-title-link" href="/blog/id/${article.url}" itemprop="url">
				                                    ${article.title }
				                                    </a>
				                                </h1>
				
				                                <div class="post-meta">
													<span class="post-time">
														<span class="post-meta-item-icon">
															<i class="fa fa-calendar-o"></i>
														</span>
														<span class="post-meta-item-text">发表于</span>
														<time itemprop="dateCreated" content="${article.time }">
															${article.time }
														</time>
													</span>
																
													<span class="post-category">
														&nbsp; | &nbsp;
														<span class="post-meta-item-icon">
														  <i class="fa fa-folder-o"></i>
														</span>
														<span class="post-meta-item-text">分类于</span>
														<span itemprop="about" itemscope itemtype="https://schema.org/Thing">
															<a href="/categories/${item.value }" itemprop="url" rel="index">
																<span itemprop="name">${item.value }</span>
															</a>
														</span>
													</span>
																
													<span id="/blog/id/${article.url }" class="leancloud_visitors" data-flag-title="${article.title }">
														&nbsp; | &nbsp;
														<span class="post-meta-item-icon">
															<i class="fa fa-eye"></i>
														</span>
														<span class="post-meta-item-text">阅读次数 </span>
														<span class="leancloud-visitors-count">${article.readCount }</span>
													</span>
												</div>
				                            </header>
				
				                            <div class="post-body" itemprop="articleBody">
				                                <div id="test-editormd-view${article.id }">
				                                    <textarea style="display:none;" name="mdhtml"></textarea>
				                                </div>
					                            <div class="post-more-link text-center">
										            <a class="btn" href="/blog/id/${article.url }">
										              阅读全文 »
										            </a>
					          					</div>
				                            </div>
			                        	</article>
									</c:when>
								</c:choose>
							</c:forEach> 
						</c:forEach> 
                    </section>

					<!-- 分页导航 -->
                    <nav id="Pagination" class="pagination">
                    </nav>
                </div>
            </div>

		<%@ include file="template/sidebar.html"%>
        </div>
    </main>

	<%@ include file="template/footer.html"%>

</div>


<%@ include file="template/bottom.html"%>

<script src="/res/vendors/editor.md/lib/marked.min.js"></script>
<script src="/res/vendors/editor.md/lib/prettify.min.js"></script>
<script src="/res/vendors/editor.md/lib/raphael.min.js"></script>
<script src="/res/vendors/editor.md/lib/underscore.min.js"></script>
<script src="/res/vendors/editor.md/lib/sequence-diagram.min.js"></script>
<script src="/res/vendors/editor.md/lib/flowchart.min.js"></script>
<script src="/res/vendors/editor.md/lib/jquery.flowchart.min.js"></script>
<script src="/res/vendors/editor.md/editormd.js"></script>

<script src="/res/vendors/jquery_pagination/jquery.pagination.js"></script>

<script type="text/javascript" src="/res/js/src/scrollspy.js"></script>

<script type="text/javascript">
    $(function() {
		<c:forEach var="article" items="${articles}" varStatus="status"> 
        $.get("/summary/url/${article.url}", function(markdown) {
        	
            testEditormdView${article.id} = editormd.markdownToHTML("test-editormd-view${article.id}", {
                markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                htmlDecode      : "style,script,iframe"  // you can filter tags decode
            });

        });
		</c:forEach> 

    });
</script>

<script type="text/javascript" id="sidebar.toc.highlight">
    $(document).ready(function () {
        var tocSelector = '.post-toc';
        var $tocSelector = $(tocSelector);
        var activeCurrentSelector = '.active-current';
        $tocSelector
                .on('activate.bs.scrollspy', function () {
                    var $currentActiveElement = $(tocSelector + ' .active').last();
                    removeCurrentActiveClass();
                    $currentActiveElement.addClass('active-current');
                    $tocSelector[0].scrollTop = $currentActiveElement.position().top;
                })
                .on('clear.bs.scrollspy', function () {
                    removeCurrentActiveClass();
                });

        function removeCurrentActiveClass() {
            $(tocSelector + ' ' + activeCurrentSelector)
                    .removeClass(activeCurrentSelector.substring(1));
        }

        function processTOC() {
            getTOCMaxHeight();
            toggleTOCOverflowIndicators();
        }

        function getTOCMaxHeight() {
            var height = $('.sidebar').height() -
                    $tocSelector.position().top -
                    $('.post-toc-indicator-bottom').height();
            $tocSelector.css('height', height);
            return height;
        }

        function toggleTOCOverflowIndicators() {
            tocOverflowIndicator(
                    '.post-toc-indicator-top',
                    $tocSelector.scrollTop() > 0 ? 'show' : 'hide'
            );
            tocOverflowIndicator(
                    '.post-toc-indicator-bottom',
                    $tocSelector.scrollTop() >= $tocSelector.find('ol').height() - $tocSelector.height() ? 'hide' : 'show'
            )
        }

        $(document).on('sidebar.motion.complete', function () {
            processTOC();
        });

        $('body').scrollspy({target: tocSelector});
        $(window).on('resize', function () {
            if ($('.sidebar').hasClass('sidebar-active')) {
                processTOC();
            }
        });

        onScroll($tocSelector);

        function onScroll(element) {
            element.on('mousewheel DOMMouseScroll', function (event) {
                var oe = event.originalEvent;
                var delta = oe.wheelDelta || -oe.detail;

                this.scrollTop += ( delta < 0 ? 1 : -1 ) * 30;
                event.preventDefault();

                toggleTOCOverflowIndicators();
            });
        }

        function tocOverflowIndicator(indicator, action) {
            var $indicator = $(indicator);
            var opacity = action === 'show' ? 1 : 0;
            $indicator.velocity ?
                    $indicator.velocity('stop').velocity({
                        opacity: opacity
                    }, {duration: 100}) :
                    $indicator.stop().animate({
                        opacity: opacity
                    }, 100);
        }

    });
</script>
<script type="text/javascript" id="sidebar.nav">
    $(document).ready(function () {
        var html = $('html');
        var TAB_ANIMATE_DURATION = 200;
        var hasVelocity = $.isFunction(html.velocity);
        $('.sidebar-nav li').on('click', function () {
            var item = $(this);
            var activeTabClassName = 'sidebar-nav-active';
            var activePanelClassName = 'sidebar-panel-active';
            if (item.hasClass(activeTabClassName)) {
                return;
            }
            var currentTarget = $('.' + activePanelClassName);
            var target = $('.' + item.data('target'));

            hasVelocity ?
                    currentTarget.velocity('transition.slideUpOut', TAB_ANIMATE_DURATION, function () {
                        target
                                .velocity('stop')
                                .velocity('transition.slideDownIn', TAB_ANIMATE_DURATION)
                                .addClass(activePanelClassName);
                    }) :
                    currentTarget.animate({opacity: 0}, TAB_ANIMATE_DURATION, function () {
                        currentTarget.hide();
                        target
                                .stop()
                                .css({'opacity': 0, 'display': 'block'})
                                .animate({opacity: 1}, TAB_ANIMATE_DURATION, function () {
                                    currentTarget.removeClass(activePanelClassName);
                                    target.addClass(activePanelClassName);
                                });
                    });

            item.siblings().removeClass(activeTabClassName);
            item.addClass(activeTabClassName);
        });

        $('.post-toc a').on('click', function (e) {
            e.preventDefault();
            var targetSelector = NexT.utils.escapeSelector(this.getAttribute('href'));
            var offset = $(targetSelector).offset().top;
            hasVelocity ?
                    html.velocity('stop').velocity('scroll', {
                        offset: offset + 'px',
                        mobileHA: false
                    }) :
                    $('html, body').stop().animate({
                        scrollTop: offset
                    }, 500);
        });

        // Expand sidebar on post detail page by default, when post has a toc.
        NexT.motion.middleWares.sidebar = function () {
            var $tocContent = $('.post-toc-content');

            if (CONFIG.scheme !== 'Pisces' && (CONFIG.sidebar.display === 'post' || CONFIG.sidebar.display === 'always')) {
                if ($tocContent.length > 0 && $tocContent.html().trim().length > 0) {
                    NexT.utils.displaySidebar();
                }
            }
        };
    });
</script>

<script type="text/javascript">
	$(function () {
	    var initPagination = function () {
	        var maxentries = ${page.totalCount}; //总共多少项
	        // 创建分页
	        $("#Pagination").pagination(maxentries, {
	            items_per_page:${page.everyPage}, //每页显示多少项
	            current_page:${page.currentPage-1}, //当前所在页
	            num_display_entries: 4, //主体页数
	            prev_text: "&lt;",
	            next_text: "&gt;",
	            callback: pageselectCallback
	        });
	    }();
	
	    function pageselectCallback(page_id, jq) {

            var a = $(".pagination").find("a");
            $(a).each(function(n) {
            	$(this).addClass("page-number");
            	$(".prev").removeClass("page-number");
            	$(".next").removeClass("page-number");
            });
            
            var span = $(".pagination").find("span");
            $(span).each(function(n) {
            	$(this).addClass("page-number");
            	$(".prev").removeClass("page-number");
            	$(".next").removeClass("page-number");
            });
	    	
	        var cp = page_id + 1;
	        
	        if(cp==1){
	        	$(".prev").remove();
	        }
	        
	        if(cp==Math.ceil(${page.totalCount/page.everyPage})){
	        	$(".next").remove();
	        }
	        
	        if (cp !=${page.currentPage}) {
	            window.location.href = "/index?pn=" + cp;
	        }

	        return false;
	    }
	});
</script>

</body>
</html>
