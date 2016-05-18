<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="theme-next mist use-motion">
<head>
	<%@ include file="template/top.html"%>
	
	<link rel="stylesheet" href="/res/vendors/editor.md/css/editormd.css" />
    <link rel="stylesheet" href="/res/vendors/editor.md/css/editormd.preview.css" />
	<title>About me | Ethan's Blog</title>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

<div class="container one-collumn sidebar-position-left  ">
    
	<%@ include file="template/header.html"%>

    <main id="main" class="main">
        <div class="main-inner">
            <div class="content-wrap">
                <div id="content" class="content">
                    <div id="posts" class="posts-expand">
                        <h2 id="Name"><a href="#Name" class="headerlink" title="Name"></a>Name</h2>
                        <p>CN: 陈子杰 | EN: Ethan</p>
                        <h2 id="I-Am"><a href="#I-Am" class="headerlink" title="I Am"></a>I Am</h2>
                        <p>武汉轻工大学一名大三学生，软件工程专业。<br/>平时都宅在寝室或者实验室，有时写代码，有时看电视。<br/>目前专注于Java
                            Web开发，对Linux运维、Python和大数据也比较感兴趣。</p>
                        <h2 id="Contact"><a href="#Contact" class="headerlink" title="Contact"></a>Contact</h2>
                        <p>微博：<a href="http://weibo.com/u/1764595164" target="_blank" rel="external">醉泪Ethan</a><br/>QQ：916030749<br/>GitHub：<a
                                href="https://github.com/chenzihaojie" target="_blank"
                                rel="external">chenzihaojie</a><br/>Email：chenzihaojie#gmail.com</p>
                    </div>
                </div>
                <div class="comments" id="comments">
                    <div class="ds-thread" data-thread-key="about/index.html"
                         data-title="About me" data-url="http://www.jier.space/about/index.html">
                    </div>
                </div>
            </div>
            
		<%@ include file="template/sidebar.html"%>

        </div>
    </main>

	<%@ include file="template/footer.html"%>

</div>

<%@ include file="template/bottom.html"%>

</body>
</html>