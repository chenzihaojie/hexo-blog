<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh">
<head>
	<%@ include file="template/top.html"%>

    <link rel="stylesheet" href="/res/vendors/editor.md/examples/css/style.css" />
    <link rel="stylesheet" href="/res/vendors/editor.md/css/editormd.css" />

    <style type="text/css">

        .editormd-preview-active code, .editormd-preview-active pre.prettyprint{
            border: 0;
        }
        
        #mdtop{
        	margin: 10px 0 10px 277px;
        	width: 800px;
			font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif;
        	font-size: 16px;
        }
        #mdtitle{
			font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif;
        	font-size: 16px;
        }
        #mdtitle input{
        	font-size: 16px;
        	font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif;
        }
        
        #get-md-btn{
			font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif;
        	font-size: 16px;
        	border: none;
        	background: #4285f4;
         }
         
         #get-md-btn input{
        	font-size: 16px;
        	font-family:Lato,"PingFang SC","Microsoft YaHei",sans-serif;
        }

    </style>
    <title>新建博文 | Ethan's Blog</title>
</head>

<body>
<div id="layout">
    <form>
		<div id="mdtop">
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题：<input id="mdtitle" type="text" value="" name="title" style="width: 640px;" />&nbsp;&nbsp;<input id="get-md-btn" type="submit" name="submit" value="发布文章" style="color:#fff" />
		</div>
        <div id="test-editormd">
            <textarea style="display:none;">
            </textarea>
        </div>
    </form>
</div>

<script type="text/javascript" src="/res/vendors/jquery/index.js"></script>

<script src="/res/vendors/editor.md/lib/marked.min.js"></script>
<script src="/res/vendors/editor.md/lib/prettify.min.js"></script>

<script src="/res/vendors/editor.md/lib/raphael.min.js"></script>
<script src="/res/vendors/editor.md/lib/underscore.min.js"></script>
<script src="/res/vendors/editor.md/lib/sequence-diagram.min.js"></script>
<script src="/res/vendors/editor.md/lib/flowchart.min.js"></script>
<script src="/res/vendors/editor.md/lib/jquery.flowchart.min.js"></script>

<script src="/res/vendors/editor.md/editormd.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {
		$.get("/res/template.md", function(md) {
			testEditor = editormd("test-editormd", {
			    width: 795,
			    height: 580,
			    path : '/res/vendors/editor.md/lib/',
			    toolbarIcons : function() {
			        return [
			            "bold","italic", "quote", "|",
			            "h2", "h3", "h4", "|",
			            "list-ul", "list-ol", "hr", "|",
			            "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "|",
			            "preview", "clear", "|",
			            "help", "info"
			        ]
			    },
			    markdown : md,
			    codeFold : true,
			    syncScrolling : false,
			    saveHTMLToTextarea : false,    // 保存 HTML 到 Textarea
			    searchReplace : true,
			    watch : false,                // 关闭实时预览
			    htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
			    imageUpload : true,
			    imageFormats : ["jpg", "jpeg", "gif", "png", "bmp"],
			    imageUploadURL : "/uploadImg",
			    onload : function() {
			    }
			});
		});


        $("#get-md-btn").bind('click', function(e){
        	event.stopPropagation();
    		event.preventDefault();
            alert(testEditor.getMarkdown());
            var title = $("#mdtitle").val();
            var mdSource = testEditor.getMarkdown();
            if(window.confirm("确定提交吗?")){
	            $.ajax({
	            	url: "/edit",
	            	type: "post",
	            	data: {title,mdSource},
	            	async: false, 
	            	success: function(result){
	            		if(result!=""||result!="error"){
	            			window.window.location = "http://"+window.location.host + "/blog/id/"+result;
	            		}
	            		else{
	            			window.location.href = window.location.href;
	            		}
	
	            	}
	            });
            }
        });
    });
</script>
</body>
</html>