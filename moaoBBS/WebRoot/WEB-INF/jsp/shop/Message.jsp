<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统消息</title>
</head>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/Message.css" type="text/css"/>
<body>
<div class="main">
		<ul class="mainul">
        <li class="li1"><img src="${pageContext.request.contextPath }/images/system/system${imagename}.jpg" /></li>
        <li class="li2">
        	<div class="infomain">
            	<h1>${title }</h1>
            	<div>
                	${message}
                </div>
                <div class="infoa">
                <a href="${pageContext.request.contextPath }/getIndexCommodity">商城首页</a>&nbsp;<a href="#">moao-BBS</a>&nbsp;<a href="#">博客</a>
                </div>
            </div>
        </li>
        </ul>
</div>
</body>
</html>
