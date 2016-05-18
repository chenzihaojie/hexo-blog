<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="theme-next mist use-motion">
<head>
<%@ include file="template/top.html"%>
<title>标签 | Ethan's Blog</title>
</head>
<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

	<div class="container one-collumn sidebar-position-left  ">

		<%@ include file="template/header.html"%>

		<main id="main" class="main">
		<div class="main-inner">
			<div class="content-wrap">
				<div id="content" class="content">
					<div id="posts" class="posts-expand">
						<div class="tag-cloud">

							<div class="tag-cloud-title">
								目前共计 ${tagCount } 个标签
							</div>
								        			                            
						</div>
						<div id="myTags">
							<canvas width="700" height="250" id="my3DTags" style="">
								<p>Anything in here will be replaced on browsers that support the canvas element</p>
							</canvas>
						</div>
						<div class="tags" id="tags" style="display:none">
							<ul>
								<c:forEach var="tag" items="${tags }" varStatus="status">
									<li><a href="/tags/${tag.name }" data-weight="${30+tag.id }" style="font-size: 30px; color: #ff00ff">${tag.name }</a>
									</li>
								</c:forEach>
							</ul>
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

<script type="text/javascript" src="/res/vendors/tags/jquery.tagcanvas.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#my3DTags").tagcanvas({
			textFont:"Georgia,Optima",
			textColour:null,
			outlineColour:"#ff00ff",
			weight:!0,
			reverse:!0,
			weightMode: 'both',
			textHeight:40,
			weightFrom:"data-weight",
			weight:true,
			dragControl:true,
			depth:.8,
			maxSpeed:.05,
			bgRadius:1,
			freezeDecel:!0
		},"tags")||$("#myTags").hide()});
</script>

</body>
</html>
