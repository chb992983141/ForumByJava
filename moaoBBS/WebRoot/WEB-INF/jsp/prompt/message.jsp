<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统提示</title>
</head>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/common/Message.css" type="text/css"/>
<body>
<div class="main">
		<ul class="mainul">
        <li class="li1"><img src="${pageContext.request.contextPath }/images/common/system/system${promptResult.imagename}.jpg" /></li>
        <li class="li2">
        	<div class="infomain">
            	<h1>${PromptResult.title }</h1>
            	<div>
                	系统提示：${PromptResult.message}</br>
                </div>
                
                <div class="infoa">
                <a href="${pageContext.request.contextPath }/#">返回民人论坛首页再逛逛</a>&nbsp;|&nbsp;
                <input id="cancel" type="button" value="返回上一页" onclick="javascript:history.go(-1);"/>
                </div>
            </div>
        </li>
        </ul>
</div>
</body>
</html>
