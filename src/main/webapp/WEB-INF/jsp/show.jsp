<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="theme-next mist use-motion">
<head>
	<%@ include file="template/top.html"%>

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

    <title> ${article.title } | Ethan's Blog </title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

<div class="container one-collumn sidebar-position-left page-post-detail ">

	<%@ include file="template/header.html"%>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">
                    <div id="posts" class="posts-expand">
                        <article class="post post-type-normal " itemscope itemtype="http://schema.org/Article">
                            <header class="post-header">
                                <h1 class="post-title" itemprop="name headline">
                                    ${article.title }
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
											<c:forEach var="item" items="${ac }" varStatus="status1">
												<a href="/categories/${item.value }" itemprop="url" rel="index">
													<span itemprop="name">${item.value }</span>
												</a>
											</c:forEach>
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
                                <div id="test-editormd-view">
                                    <textarea style="display:none;" name="mdhtml"></textarea>
                                </div>
                            </div>

                            <footer class="post-footer">
                                <div class="post-tags">
									<c:forEach var="item" items="${at}"> 
										<c:forEach  var="tag" items="${item.value}"> 
										<a href="/tags/${tag }" rel="tag">#${tag }</a>
										</c:forEach> 
									</c:forEach>
                                </div>

                                <div class="post-nav">
									<!-- 上一篇其实是id减小的一篇，next是相对于首页的 -->
									<c:if test="${!empty nextArticle }">
	                                    <div class="post-nav-next post-nav-item">
	
											<a href="/blog/id/${nextArticle.url }"
	                                           title="${nextArticle.title }">
	                                            <i class="fa fa-chevron-left"></i> ${nextArticle.title }
	                                        </a>
	                                    </div>
	                                </c:if>

									<c:if test="${!empty prevArticle }">
	                                    <div class="post-nav-prev post-nav-item">
										<!-- 下一篇其实是id增大的一篇，prev是相对于首页的 -->
											<a href="/blog/id/${prevArticle.url }"
	                                           title="${prevArticle.title }">
	                                           ${prevArticle.title } <i class="fa fa-chevron-right"></i>
	                                        </a>
	                                    </div>
	                                 </c:if>
                                </div>
                            </footer>
                        </article>
                    </div>
                </div>
            </div>

            <div class="sidebar-toggle">
                <div class="sidebar-toggle-line-wrap">
                    <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
                    <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
                    <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
                </div>
            </div>

            <aside id="sidebar" class="sidebar">
                <div class="sidebar-inner">
                    <ul class="sidebar-nav motion-element">
                        <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap">
                            文章目录
                        </li>
                        <li class="sidebar-nav-overview" data-target="site-overview">
                            站点概览
                        </li>
                    </ul>

                    <section class="site-overview sidebar-panel ">
                        <div class="site-author motion-element" itemprop="author" itemscope
                             itemtype="http://schema.org/Person">
                            <img class="site-author-image" itemprop="image"
                                 src="/res/images/default_avatar.jpg"
                                 alt="Ethan"/>
                            <p class="site-author-name" itemprop="name">Ethan</p>
                            <p class="site-description motion-element" itemprop="description">当你的才华还撑不起你的野心时，<br/>你就应该静下心来学习。
                            </p>
                        </div>
                        <nav class="site-state motion-element">
                            <div class="site-state-item site-state-posts">
                                <a href="/archives">
                                    <!--site-state-posts中site-state-item-count内容：日志总数-->
                                    <span class="site-state-item-count">${articletotal }</span>
                                    <span class="site-state-item-name">日志</span>
                                </a>
                            </div>

                            <div class="site-state-item site-state-categories">
                                <a href="/categories">
                                    <!--site-state-categories中site-state-item-count：分类总数-->
                                    <span class="site-state-item-count">${categorytotal }</span>
                                    <span class="site-state-item-name">分类</span>
                                </a>
                            </div>

                            <div class="site-state-item site-state-tags">
                                <a href="/tags">
                                    <!--site-state-tags中site-state-item-count：标签总数-->
                                    <span class="site-state-item-count">${tagtotal }</span>
                                    <span class="site-state-item-name">标签</span>
                                </a>
                            </div>
                        </nav>

                        <div class="links-of-author motion-element">
                            <p class="site-author-name">Links</p>
                              <span class="links-of-author-item">
                                <a href="http://hexo.io/" target="_blank">Hexo</a>
                              </span>
                            
                              <span class="links-of-author-item">
                                <a href="https://github.com/iissnan/hexo-theme-next" target="_blank">NexT.Mist</a>
                              </span>
                        </div>
                    </section>

                    <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
                        <div class="post-toc-indicator-top post-toc-indicator">
                            <i class="fa fa-angle-double-up"></i>
                        </div>
                        <div class="post-toc">
                            <div class="post-toc-content">
                                <ol class="nav">
                                </ol>
                            </div>
                        </div>

                        <div class="post-toc-indicator-bottom post-toc-indicator">
                            <i class="fa fa-angle-double-down"></i>
                        </div>
                    </section>
                </div>
            </aside>
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

<script type="text/javascript">
    $(function() {
        var testEditormdView;
        var arr=location.href.split('/').pop().split('.'); 
        $.get("/content/url/"+arr[0], function(markdown) {
        	
            testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                htmlDecode      : "style,script,iframe"  // you can filter tags decode
            });

            var h3 = $(".markdown-body").find("h3");
            $(h3).each(function(n) {
                var tocId = $(this).attr("id");
                var tocContent = $(this).text();
                var tmpNav = "<li class='nav-item nav-level-2'><a class='nav-link' href='#"+tocId+"'><span class='nav-number'>"+(n+1)+".</span><span class='nav-text'>"+tocContent+"</span></a></li>";
                $(".post-toc-content").children(".nav").append(tmpNav);

            });
        });

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
</body>
</html>
